#! /usr/bin/python3

"""
    2023 (C) Martin Quinson.
    
    This file is distributed as GPL v3+.
"""
import sys, os, stat, re, subprocess

import markdown
from jinja2 import Environment, PackageLoader, select_autoescape
from pathlib import Path

# Render the result including jQuery, Bootstrap.
WRAPPER_RENDER = True
OUTPUT_FOLDER = 'site'


def render_html(outfile_name: str, markdown_content: str) -> None:
    """Render quiz in Markdown format to HTML."""

    extensions = ["tables", "app.extensions.checkbox", "app.extensions.radio", "app.extensions.textbox"]

    html = markdown.markdown(markdown_content, extensions=extensions, output_format="html5")
    env = Environment(loader=PackageLoader('app', 'static'), autoescape=select_autoescape(['html', 'xml']))

    javascript = env.get_template('app.js').render()

    test_html = env.get_template('base.html').render(content=html, javascript=javascript)
    if WRAPPER_RENDER:
        test_html = env.get_template('wrapper.html').render(content=test_html)

    with open(outfile_name, "w+") as f:  # create final file
        f.write(test_html)
    print(f"wrote into {outfile_name}.")

def compile_sharin(outfile_name: str, sharin_name:str, script_template: str) -> None:
    with open(outfile_name, "w") as output:
      for line in script_template.splitlines():
        #print(f"line: {line}")
        if re.match('#!', line):
            output.write(line)
            output.write("\n# THIS SCRIPT WAS GENERATED, DO NOT EDIT\n# Real source: {}\n".format(sharin_name))

        elif re.match('.*KCCLEAN.*', line) or re.match('.*KCINSTALL.*', line):
            print(f"Invalid line: {line}")
            exit(1)

        elif re.match('.*SHTRL_INCLUDE.*', line):
            cmd = re.sub('.*SHTRL_INCLUDE *','',line).split()
            if len(cmd) != 2:
                print("Syntax error in SHTRL_INCLUDE (not 2 parameters):\n  {}".format(line))
                exit(1)
            (component, destdir) = cmd
            if not os.path.exists(component) and os.path.exists(Path(sharin_name).parent/component):
                component=Path(sharin_name).parent/component
            assert os.path.exists(component), "Component {} of {} not found".format(component, outfile_name)

            output.write(f"{line}\n")
            output.write("uudecode << 'SHTRL_INCLUDE_EOF' > {}/{} &&\n".format(destdir,os.path.basename(component)))
            encoded = subprocess.run("uuencode --base64 - < {}".format(component), stdout=subprocess.PIPE, shell=True, text=True)
            for l in encoded.stdout:
                output.write(l)
            output.write("SHTRL_INCLUDE_EOF\n")
            output.write("chmod {} {}/{}\n".format(re.sub('o','',oct(stat.S_IMODE(os.stat(component).st_mode))), destdir,os.path.basename(component)))
            output.write("# End of SHTRL_INCLUDE {}\n\n".format(component))

        elif re.match('.*SHTRL_COMMAND.*', line):
            cmd = re.sub('.*SHTRL_COMMAND *','',line).split(None, 1)
            if len(cmd) != 2 or len(cmd[1])==0:
                print("Syntax error in SHTRL_COMMAND (not 2 parameters):\n  {}".format(line))
                exit(1)
            (var, cmd) = cmd

            print("COMMAND {}=$({}".format(var, cmd))

            output.write("# SHTRL_COMMAND '${}' gets an opaque value\n".format(var))

            output.write("uudecode << 'SHTRL_COMMAND_EOF' > /tmp/.cmd\n")
            encoded = subprocess.run("uuencode --base64 -", input=cmd, stdout=subprocess.PIPE, shell=True, text=True)
            for l in encoded.stdout:
                output.write(l)
            output.write("SHTRL_COMMAND_EOF\n")
            output.write("{}=$(sh /tmp/.cmd)\n".format(var))

            output.write("# End of SHTRL_COMMAND\n\n")
        else:
            output.write(f"{line}\n")
      output.write("\nrm -f /tmp/.cmd\n") # Just in case there were some SHTRL_COMMAND
    os.chmod(outfile_name, stat.S_IRUSR|stat.S_IWUSR|stat.S_IXUSR) # user rwx
    print(f"wrote into {outfile_name}.")
    

if __name__ == "__main__":
    # Convert all the .md (markdown) files inside the [markdown-quiz-files] folder
    print("-" * 50 + "\nCompile the pages from Markdown to HTML\n")

    WRAPPER_RENDER = 'embed' not in sys.argv

    for file_name in Path('exo').rglob('*.md'):
        if not file_name.name.startswith('.#'): # Pass emacs temp files
            target = Path('site')/file_name.relative_to("exo/")
            if not target.parent.exists():
                target.parent.mkdir(parents=True)
                
            with open(file_name, "r") as f:
                print(f"Converting {file_name} ... ", end='')
                outfile = str(target)[:-2]
                
                render_html(f"{outfile}html", f.read())

    print("-" * 50 + "\nCompile the sharin scripts\n")
    for file_name in Path('exo').rglob('*.sharin'):
        if not file_name.name.startswith('.#'): # Pass emacs temp files
            target = Path('site')/file_name.relative_to("exo/")
            if not target.parent.exists():
                target.parent.mkdir(parents=True)
                
            with open(file_name, "r") as f:
                print(f"Compiling {file_name} ... ", end='')
                outfile = str(target)[:-4]
                
                compile_sharin(f"{outfile}", file_name, f.read())

    sys.exit(0)
