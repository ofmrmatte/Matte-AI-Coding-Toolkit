from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_PATHS = [
    "AGENTS.md",
    "README.md",
    "CHANGELOG.md",
    "CONTRIBUTING.md",
    "LICENSE",
    "NOTICE.md",
    "docs/00-overview.md",
    "docs/01-installation.md",
    "docs/02-playbook.md",
    "templates/AGENTS.md",
    "templates/PROJECT.md",
    "templates/ARCHITECTURE.md",
    "templates/DECISIONS.md",
    "templates/TODO.md",
    "scripts/bootstrap.ps1",
    "scripts/bootstrap.sh",
    "examples/sample-project/AGENTS.md",
    "examples/sample-project/PROJECT.md",
    "examples/sample-project/ARCHITECTURE.md",
    "examples/sample-project/DECISIONS.md",
    "examples/sample-project/TODO.md",
]

LINK_PATTERN = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")
IGNORED_SCHEMES = ("http://", "https://", "mailto:", "tel:")


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)
    print(f"FAIL: {message}")


def check_required_paths(failures: list[str]) -> None:
    for relative_path in REQUIRED_PATHS:
        if not (ROOT / relative_path).exists():
            fail(f"missing required path: {relative_path}", failures)


def normalize_link(raw_link: str) -> str:
    link = raw_link.strip().strip("<>")
    if " " in link and not link.startswith(("./", "../")):
        link = link.split(" ", 1)[0]
    return unquote(link)


def check_markdown_links(failures: list[str]) -> None:
    markdown_files = sorted(ROOT.rglob("*.md"))

    for markdown_file in markdown_files:
        text = markdown_file.read_text(encoding="utf-8")
        for match in LINK_PATTERN.finditer(text):
            link = normalize_link(match.group(1))
            if not link or link.startswith("#") or link.startswith(IGNORED_SCHEMES):
                continue

            path_part = link.split("#", 1)[0].split("?", 1)[0]
            if not path_part:
                continue

            if path_part.startswith("/"):
                target = ROOT / path_part.lstrip("/")
            else:
                target = markdown_file.parent / path_part

            if not target.resolve().exists():
                relative_source = markdown_file.relative_to(ROOT)
                fail(f"broken local link in {relative_source}: {link}", failures)


def main() -> int:
    failures: list[str] = []
    check_required_paths(failures)
    check_markdown_links(failures)

    if failures:
        print(f"\n{len(failures)} check(s) failed.")
        return 1

    markdown_count = sum(1 for _ in ROOT.rglob("*.md"))
    print(f"PASS: required files present; local links valid across {markdown_count} Markdown files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
