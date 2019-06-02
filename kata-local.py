#! /usr/bin/python3

import json
import shutil, os, sys, stat, subprocess

with open('index.json') as data_file:
    main = json.load(data_file)

if os.path.isdir('/tmp/katalocal'):
    shutil.rmtree('/tmp/katalocal')
os.makedirs('/tmp/katalocal')

if 'details' in main and 'steps' in main['details']:
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
            for key in 'verify', 'solution':
                dst_name = '/tmp/katalocal/{}'.format(step[key])
                shutil.copyfile(step[key], dst_name)
                os.chmod(dst_name, stat.S_IRUSR|stat.S_IWUSR|stat.S_IXUSR) # user rwx
            
            # TODO: install the assets
            
            print("XXXXXXXX\nXXX Step '{}': check that the test really needs the solution\nXXXXXXXX\n".format(step['title']))
            if subprocess.call("docker run --rm --volume /tmp/katalocal/:/tmp/katacoda ubuntu sh -c 'cd && /tmp/katacoda/{}'".format(step['verify']), shell=True):
                print("XXXXXXXX\nXXX Step '{}': the verification on a blank docker fails as expected.".format(step['title']))
            else:
                print("XXXXXXXX\nXXX Step '{}': the verification passes on a blank docker while it should fail! Please fix it".format(step['title']))
                sys.exit(2)
                
            print("XXXXXXXX\nXXX Step '{}': check that the solution passes the test\nXXXXXXXX\n".format(step['title']))
            if subprocess.call("docker run --rm --volume /tmp/katalocal/:/tmp/katacoda ubuntu sh -c 'cd && /tmp/katacoda/{} && /tmp/katacoda/{}'".format(step['solution'], step['verify']), shell=True):
                print("XXXXXXXX\nXXX Step '{}': Verification failed.".format(step['title']))
                sys.exit(2)
            print("\nXXXXXXXX\nStep '{}': passed.\nXXXXXXXX\n".format(step['title']))
