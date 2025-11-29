# stolen from: https://github.com/FND/markdown-checklist/blob/master/markdown_checklist/extension.py
import re

from markdown.extensions import Extension
from markdown.preprocessors import Preprocessor
from markdown.postprocessors import Postprocessor


def makeExtension(configs=None):
    if configs is None:
        return RadioExtension()
    else:
        return RadioExtension(configs=configs)


class RadioExtension(Extension):

    def extendMarkdown(self, md):
        postprocessor = RadioPostprocessor(md)
        md.postprocessors.register(postprocessor, 'radio', 40) # Priority must be >raw_html


class RadioPostprocessor(Postprocessor):
    """
    adds checklist class to list element
    """

    list_pattern = re.compile(r"(<ul>\n<li>\([ Xx]\))")
    item_pattern = re.compile(r"^<li>\(([ Xx])\)(.*)</li>$", re.MULTILINE)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def run(self, html):
        html = re.sub(self.list_pattern, self._convert_list, html)
        return re.sub(self.item_pattern, self._convert_item, html)

    def _convert_list(self, match):
        return match.group(1).replace("<ul>", f"<ul class=\"radio-list\">")

    def _convert_item(self, match):
        state, caption = match.groups()
        checked = (state != " ")
        correct = "1" if checked else "0"
        fake = "0" if checked else "1"

        return f"<li>" \
           f"<label><input type=\"radio\" data-question=\"{fake}\" data-content=\"{correct}\" />{caption}</label>" \
           f"</li>"
