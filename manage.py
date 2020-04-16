#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
import warnings

from dotenv import read_dotenv


def main():
    # TODO: Add this in a try/except block for FileNotFound on travis
    with warnings.catch_warnings():
        try:
            warnings.filterwarnings('error')
            read_dotenv('env/app/test.env')
        except UserWarning:
            # read_dotenv()
            pass

    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'blog_app.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
