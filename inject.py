from contextlib import contextmanager

import pathlib
import io
import sys


MARKER = "/* content */"


@contextmanager
def make_string_buffer():
    fi = io.StringIO()
    yield fi
    fi.close()


def main() -> int:
    if len(sys.argv) != 2:
        return 1

    template = pathlib.Path(sys.argv[1]).read_text()
    if MARKER not in template:
        return 1

    cut = template.index(MARKER)
    with make_string_buffer() as buff:
        buff.write(template[:cut])
        buff.write(sys.stdin.read().strip())
        buff.write(template[cut + len(MARKER):])

        sys.stdout.write(buff.getvalue())

    return 0


if __name__ == "__main__":
    sys.exit(main())
