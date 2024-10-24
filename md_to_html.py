# packagesL python-markdown, pymdown-extensions, pygments

import os
import markdown
import fire
import pymdownx.arithmatex as arithmatex

from pathlib import Path
from string import Template
from datetime import datetime
from markdown.extensions.wikilinks import WikiLinkExtension


def md_to_html(
    md_base_path="./public",
    html_base_path="./public",
    template_file="./template/template.html",
):
    """Convert all markdown files in the 'md_base_path' directory to html in the 'html_base_path' directory, using the 'template_file' template."""

    md_base_path = Path(md_base_path)
    html_base_path = Path(html_base_path)
    template_file = Path(template_file)

    extensions = [
        "tables",
        "toc",
        "fenced_code",
        "footnotes",
        "abbr",
        # "nl2br",
        # "pymdownx.b64",
        "pymdownx.arithmatex",
        "pymdownx.inlinehilite",
        "pymdownx.superfences",
        "pymdownx.highlight",
        "pymdownx.smartsymbols",
        "pymdownx.saneheaders",
        "pymdownx.betterem",
        "pymdownx.magiclink",
        "pymdownx.mark",
        "pymdownx.mark",
        "pymdownx.caret",
        "pymdownx.tilde",
        WikiLinkExtension(base_url="", end_url=".html"),
    ]

    extension_config = {
        "pymdownx.arithmatex": {
            "generic": True,
        },
        "pymdownx.inlinehilite": {
            "custom_inline": [
                {
                    "name": "math",
                    "class": "arithmatex",
                    "format": arithmatex.arithmatex_inline_format(which="generic"),
                }
            ]
        },
        "pymdownx.superfences": {
            "custom_fences": [
                {
                    "name": "math",
                    "class": "arithmatex",
                    "format": arithmatex.arithmatex_fenced_format(which="generic"),
                }
            ]
        },
    }

    for p in md_base_path.glob("**/*.md"):
        with open(p, "r", encoding="utf-8") as input_file:
            text = input_file.read()
        html_body = markdown.markdown(
            text, extensions=extensions, extension_configs=extension_config
        )

        with open(template_file, "r") as f:
            html_template = Template(f.read())

        html = html_template.substitute(
            {
                "BODY": html_body,
                "FOOTER": f"modified: {datetime.fromtimestamp(os.path.getmtime(p)).strftime('%Y-%m-%d %H:%M:%S')}",
            }
        )

        html_file = (html_base_path / p.relative_to(md_base_path)).with_suffix(".html")
        html_file.parent.mkdir(exist_ok=True, parents=True)
        with open(
            html_file, "w", encoding="utf-8", errors="xmlcharrefreplace"
        ) as output_file:
            output_file.write(html)


if __name__ == "__main__":
    fire.Fire(md_to_html)
