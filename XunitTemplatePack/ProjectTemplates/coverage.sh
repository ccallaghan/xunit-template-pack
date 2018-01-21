#!/bin/bash

mono --debug \
--profile=log:coverage,onlycoverage,\
covfilter=-xunit.abstractions,\
covfilter=-xunit.assert,\
covfilter=-xunit.console,\
covfilter=-xunit.core,\
covfilter=-xunit.execution.desktop,\
covfilter=-xunit.runner.reporters.net452,\
covfilter=-xunit.runner.utility.net452,\
output=coverage.mlpd \
    ../packages/xunit.runner.console.2.3.1/tools/net452/xunit.console.exe \
    bin/Debug/${ProjectName}.dll > /dev/null

mprof-report --reports=coverage --coverage-out=coverage.xml coverage.mlpd > /dev/null
mono ../packages/ReportGenerator.3.1.1/tools/ReportGenerator.exe -reports:coverage.xml -targetdir:report > /dev/null
open ./report/index.htm
