#! /usr/bin/python3

import json
import shutil, os, sys, stat, subprocess, re

### Check the index.json syntax
if subprocess.call("jsonlint-py3 index.json", shell=True):
    print("Please fix your json sytax")
    exit(1)

### Recompile the shar files
# I fail to get the assets doing what I want, so I embeed some content files in the setup scripts

for sharin in os.listdir():
    if re.match('.*\.sharin$', sharin):
        basescript=re.sub(r'sharin$', r'sh', sharin)
        print("Compiling {}".format(basescript))
        with open(sharin, "r") as input , open(basescript, "w") as output:
            installed=[]
            for line in input:
                if re.match('#!', line):
                    output.write(line)
                    output.write("\n# THIS SCRIPT WAS GENERATED, DO NOT EDIT\n# Real source: {}\n".format(sharin))
                    output.write("\n(apt update; apt -y install locales manpages-fr) 2>/dev/null >/dev/null\n")
                    output.write("sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen\n")
                    output.write("dpkg-reconfigure --frontend=noninteractive locales\n")
                    output.write("update-locale LANG=fr_FR.UTF-8\n\n")
                    
                elif re.match('.*KCCLEAN.*', line):
                    print("CLEAN")
                    output.write(line)
                    output.write("cd; rm -rf *\n")
                    
                elif re.match('.*KCINSTALL.*', line):
                    request = re.sub('.*KCINSTALL *','',line).split()
                    if len(request) != 2:
                        print("Syntax error in KCINSTALL (not 2 parameters):\n  {}".format(line))
                        exit(1)                    
                    (cmd, pkg) = request
                    print("INSTALL {} if {} not found".format(pkg,cmd))
                    output.write(line)
                    output.write("if which {} >/dev/null 2>/dev/null || [ -e {} ] ; then :; else apt install {} 2>/dev/null >/dev/null; fi\n".format(cmd,cmd,pkg))
                    installed.append(pkg)
                    
                elif re.match('.*KCINCLUDE.*', line):
                    cmd = re.sub('.*KCINCLUDE *','',line).split()
                    if len(cmd) != 2:
                        print("Syntax error in KCINCLUDE (not 2 parameters):\n  {}".format(line))
                        exit(1)
                    (component, destdir) = cmd
                    assert os.path.exists(basescript), "Component {} of {} not found".format(component, basescript)

                    print("INCLUDE {}".format(cmd))

                    output.write(line)
                    if not "sharutils" in installed:
                        output.write("if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi\n")
                        installed.append("sharutils")
                        
                    output.write("uudecode << 'KCINCLUDE_EOF' > {}/{} &&\n".format(destdir,os.path.basename(component)))
                    encoded = subprocess.run("uuencode --base64 - < {}".format(component), stdout=subprocess.PIPE, shell=True, text=True)
                    for l in encoded.stdout:
                        output.write(l)
                    output.write("KCINCLUDE_EOF\n")
                    output.write("chmod {} {}/{}\n".format(re.sub('o','',oct(stat.S_IMODE(os.stat(component).st_mode))),
                                                          destdir,os.path.basename(component)))
                    output.write("# End of KCINCLUDE {}\n\n".format(component))

                elif re.match('.*KCCOMMAND.*', line):
                    cmd = re.sub('.*KCCOMMAND *','',line).split(None, 1)
                    if len(cmd) != 2 or len(cmd[1])==0:
                        print("Syntax error in KCCOMMAND (not 2 parameters):\n  {}".format(line))
                        exit(1)
                    (var, cmd) = cmd

                    print("COMMAND {}=$({}".format(var, cmd))

                    output.write(line)
                    if not "sharutils" in installed:
                        output.write("if which uuencode >/dev/null 2>/dev/null ; then :; else apt install sharutils 2>/dev/null >/dev/null; fi\n")
                        installed.append("sharutils")
                        
                    output.write("uudecode << 'KCCOMMAND_EOF' > /tmp/.cmd &&\n")
                    encoded = subprocess.run("echo '{}'|uuencode --base64 -".format(cmd), stdout=subprocess.PIPE, shell=True, text=True)
                    for l in encoded.stdout:
                        output.write(l)
                    output.write("KCCOMMAND_EOF\n")
                    output.write("{}=$(sh /tmp/.cmd)\n".format(var))
                    
                    output.write("# End of KCCOMMAND\n\n")
                else:
                    output.write(line)
            output.write("\nrm -f /tmp/.cmd\n") # Just in case there were some KCCOMMAND
            output.write("\necho done > /tmp/.katacoda-finished\n")
        os.chmod(basescript, stat.S_IRUSR|stat.S_IWUSR|stat.S_IXUSR) # user rwx
        print("Done")

### Check the tests in a docker    
with open('index.json') as data_file:
    main = json.load(data_file)

if os.path.isdir('/tmp/katalocal'):
    shutil.rmtree('/tmp/katalocal')
os.makedirs('/tmp/katalocal')

if not ('details' in main):
    print("Your index.json does not contain a 'details' section. I'm puzzled.")
    print(main)
    os.exit(1)
    
subprocess.call("echo '#! /bin/sh -x' > /tmp/katalocal/setup_assets", shell=True)
subprocess.call("echo 'cd /tmp/katacoda' >> /tmp/katalocal/setup_assets", shell=True)
            
if 'assets' in main['details']:
    for host in main['details']['assets']:
        for asset in main['details']['assets'][host]:
            assert 'file'   in asset, "{} does not have a 'file' component".format(asset)
            assert 'target' in asset, "{} does not have a 'target' component".format(asset)

            filename=asset['file']
            target=asset['target']
            shutil.copyfile("assets/{}".format(filename), '/tmp/katalocal/{}'.format(filename))
            subprocess.call("echo 'cp {} {}' >> /tmp/katalocal/setup_assets".format(filename,target), shell=True)
            if 'chmod' in asset:
                subprocess.call("echo 'chmod {} {}/{}' >> /tmp/katalocal/setup_assets".format(asset['chmod'], target, filename), shell=True)
os.chmod("/tmp/katalocal/setup_assets", stat.S_IRUSR|stat.S_IWUSR|stat.S_IXUSR) # user rwx

if 'steps' in main['details']:
    for step in main['details']['steps']:
        if 'verify' in step:
            # Check that we have all what we need
            if not os.path.exists(step['verify']):
                print("Step '{}': {} (verify script) not found. Please fix it.".format(step['title'], step['verify']))
                sys.exit(1)
            if not 'solution' in step:
                print("Step '{}': verify script but no solution script! Skipping.".format(step['title']))
                continue
            if not os.path.exists(step['solution']):
                print("Step '{}': {} (solution script) not found. Please fix it.".format(step['title'], step['solution']))
                sys.exit(1)
            print("Step {}: Prepare to check it (found both verify and solution scripts)".format(step['title']))
            
            # Install the scripts in position
            for key in 'verify', 'solution', 'courseData': 
                if key in step: # courseData is optional
                    dst_name = '/tmp/katalocal/{}'.format(step[key])
                    shutil.copyfile(step[key], dst_name)
                    os.chmod(dst_name, stat.S_IRUSR|stat.S_IWUSR|stat.S_IXUSR) # user rwx
            
            setup="true"            
            if 'courseData' in step:
                setup="/tmp/katacoda/{}".format(step['courseData'])
            solution="/tmp/katacoda/{}".format(step['solution'])
            verify="/tmp/katacoda/{}".format(step['verify'])

            print("XXXXXXXX\nXXX Step '{}': check that the test really needs the solution\nXXXXXXXX".format(step['title']))
            cmd="docker run --rm --volume /tmp/katalocal/:/tmp/katacoda kctest sh -c 'cd && /tmp/katacoda/setup_assets && {} && {}' >/dev/null 2>/dev/null".format(setup, verify)
            print("Exec {}\n".format(cmd))            
            if subprocess.call(cmd, shell=True):
                print("XXXXXXXX\nXXX Step '{}': the verification on a blank docker fails as expected.".format(step['title']))
            else:
                print("XXXXXXXX\nXXX Step '{}': the verification passes on a blank docker while it should fail! Please fix it".format(step['title']))
                sys.exit(2)
                
            print("XXXXXXXX\nXXX Step '{}': check that the solution passes the test\nXXXXXXXX".format(step['title']))
            cmd="docker run --rm --volume /tmp/katalocal/:/tmp/katacoda kctest sh -x -c 'cd && /tmp/katacoda/setup_assets && {} && {} && {}'".format(setup, solution, verify)
            print("Exec {}\n".format(cmd))            
            if subprocess.call(cmd, shell=True):
                print("XXXXXXXX\nXXX Step '{}': Verification failed.".format(step['title']))
                sys.exit(2)
            print("\nXXXXXXXX\nStep '{}': passed.\nXXXXXXXX\n".format(step['title']))
