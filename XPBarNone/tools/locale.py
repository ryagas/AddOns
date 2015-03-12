#!/usr/bin/python
import fnmatch
import os
import re
import sys

LOCALE_HEADER = """\
-- This file is generated by locale.py.
local L = LibStub("AceLocale-3.0"):NewLocale("XPBarNone", "enUS", true)
if not L then return end
--\
"""

FOUND_STRINGS = []
EXCLUDE_DIRS = [".git", "Libs", "Locales", "Textures"]
LOCALE_REGEX = re.compile(r"(?P<locale_string>L\[\".+\"\])")
FUNCTION_REGEX = re.compile(
    r"^(?:local )?function (?P<function_name>.+)\(.*\)$")

for root, dirnames, filenames in os.walk('.'):
    for excluded in EXCLUDE_DIRS:
        try:
            dirnames.remove(excluded)
        except:
            pass

    for filename in fnmatch.filter(filenames, '*.lua'):
        pathinfo = {
            'dir': os.path.basename(os.getcwd()),
            'filename': filename,
            'fullpath': "{root}/{filename}".format(
                root=root,
                filename=filename),
        }
        headerAdded = False
        sys.stderr.write("Searching {fullpath}\n".format(**pathinfo))

        with open(pathinfo.get('fullpath'), 'r') as f:
            current_func = None
            for line in f:
                m = LOCALE_REGEX.search(line)
                try:
                    current_func = FUNCTION_REGEX.search(
                        line).group('function_name')
                except:
                    pass
                if m:
                    if not headerAdded:
                        print(LOCALE_HEADER)
                        headerAdded = True
                        print("-- File: {dir}/{filename}".format(**pathinfo))
                    if current_func:
                        print("-- In function: {}()".format(current_func))
                        current_func = None
                    L = m.group('locale_string')
                    if not L in FOUND_STRINGS:
                        FOUND_STRINGS.append(L)
                        print("{} = true".format(L))