#!/usr/bin/python3

# cmake . --trace |& grep ^/ | grep -v CMakeLists.txt | cut -d '(' -f 1 | sort -u

import subprocess
import os
import re
import json
import argparse
import sys

def readCache(varName):
    f = open("CMakeCache.txt", "r")
    for line in f:
        m = re.match('(.*?)=(.*)', line)
        if m is not None and m.group(1)==varName:
            return m.group(2)

def checkPackageVersion(frameworkName):
    value = readCache("FIND_PACKAGE_MESSAGE_DETAILS_%s:INTERNAL" % frameworkName)
    if value is None:
        return None
    m = re.match('.*\\]\\[v(.*?)\\]', value)
    if m:
        return m.group(1)
    else:
        return None

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Figures out the dependencies of the build directory in the cwd.')

    try:
        projectDir = readCache("CMAKE_HOME_DIRECTORY:INTERNAL")
    except:
        print("Run in a build directory.")
        parser.print_help()
        sys.exit(1)

    proc = subprocess.Popen(['cmake', '.', '--trace'], stdout=open(os.devnull, "w"), stderr=subprocess.PIPE)
    processedFiles = {}
    lookedUpPackages = {}

    for line in proc.stderr:
        theLine = line.decode("utf-8")

        m = re.match('.*?:\s*find_package\((.*?) (.*?)\).*', theLine)
        if m is not None:
            if "$" not in m.group(2):
                lookedUpPackages[m.group(1)] = m.group(2)

        m = re.match("(^/.*?)\\(.*", theLine)
        if m is not None:
            currentFile = m.group(1)
            filePath, fileName = os.path.split(currentFile)

            if fileName == "CMakeLists.txt":
                continue

            m = re.match("(.*)Config.cmake", fileName)
            m2 = re.match("Find(.*).cmake", fileName)
            if m2:
                moduleName = m2.group(1)
            elif m:
                moduleName = m.group(1)
            else:
                continue

            if not moduleName in processedFiles:
                processedFiles[moduleName] = { 'files': set() }

            if not 'version' in processedFiles[moduleName]:
                processedFiles[moduleName]['files'].add(fileName)
                processedFiles[moduleName]['version'] = checkPackageVersion(moduleName)

    proc.wait()

    print("[")
    first = True
    for v, value in processedFiles.items():
        if not first:
            print(',\n', end='')
        first = False

        value['files'] = list(value['files'])
        value['project'] = v
        print("\t%s" % (json.dumps(value)), end='')
        if v in lookedUpPackages:
            del lookedUpPackages[v]

    if lookedUpPackages != {}:
        if not first:
            print(',\n', end='')

        print("\t{ 'missingPackages': %s }" % json.dumps(lookedUpPackages), end='')
    print("\n]\n")