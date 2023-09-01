#! /usr/bin/python3

"""
    2023 (C) Martin Quinson.
    
    This file is distributed as GPL v3+.
"""
import sys
import os

import markdown
from jinja2 import Environment, PackageLoader, select_autoescape
from pathlib import Path

# Render the result including jQuery, Bootstrap.
WRAPPER_RENDER = True
OUTPUT_FOLDER = 'site'


def render_test(outfile_name: str, markdown_content: str) -> None:
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


if __name__ == "__main__":
    # Convert all the .md (markdown) files inside the [markdown-quiz-files] folder
    print("-" * 50 + "\nCompile the pages from Markdown to HTML\n" + "-" * 50)

    WRAPPER_RENDER = 'embed' not in sys.argv

    for file_name in Path('exo').rglob('*.md'):
        if not file_name.name.startswith('.#'): # Pass emacs temp files
            target = Path('site')/file_name.relative_to("exo/")
            if not target.parent.exists():
                target.parent.mkdir(parents=True)
                
            with open(file_name, "r") as f:
                print(f"Converting {file_name} ... ", end='')
                outfile = str(target)[:-2]
                
                render_test(f"{outfile}html", f.read())

    sys.exit(0)
