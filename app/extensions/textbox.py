# stolen from: https://github.com/FND/markdown-checklist/blob/master/markdown_checklist/extension.py
import re

from markdown.extensions import Extension
from markdown.preprocessors import Preprocessor
from markdown.postprocessors import Postprocessor


def makeExtension(configs=None):
    if configs is None:
        return TextboxExtension()
    else:
        return TextboxExtension(configs=configs)


class TextboxExtension(Extension):

    def extendMarkdown(self, md):
        postprocessor = TextboxPostprocessor(md)
        md.postprocessors.register(postprocessor, 'textbox', 40) # Priority must be >raw_html


class TextboxPostprocessor(Postprocessor):
    """
    adds textbox class to list element
    """

    # item_pattern = re.compile(r"^<li>\(([ Xx])\)(.*)</li>$", re.MULTILINE)
    list_pattern = re.compile(r"(<ul>\n<li>[Rr]:=)")
    item_pattern = re.compile(r"^<li>([Rr]:=)(.*)</li>$", re.MULTILINE)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def run(self, html):
        html = re.sub(self.list_pattern, self._convert_list, html)
        return re.sub(self.item_pattern, self._convert_item, html)

    def _convert_list(self, match):
        return match.group(1).replace("<ul>", f"<ul class=\"textbox\">")

    def _convert_item(self, match):
        state, caption = match.groups()
        # the correct answer next to another false one are saved in an attribute such as meta-data written backwards.
        correct = caption.strip()[::-1]
        fake = "".join([c + 's' for c in correct])
        return f"<li>" \
           f"<input type=\"text\" data-content=\"{correct}\" data-question=\"{fake}\" " \
           f"placeholder=\"Enter the correct answer.\" class=\"form-control\" />"
        return self.render_item(caption, state != " ")



