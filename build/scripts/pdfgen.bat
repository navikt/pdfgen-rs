@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  pdfgen startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and PDFGEN_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\pdfgen-2.0.0.jar;%APP_HOME%\lib\pdfgen-core-1.1.61.jar;%APP_HOME%\lib\kotlin-logging-jvm-7.0.13.jar;%APP_HOME%\lib\ktor-server-netty-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-server-content-negotiation-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-server-status-pages-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-server-core-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-serialization-jackson-jvm-3.3.0.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.20.0.jar;%APP_HOME%\lib\handlebars-jackson2-4.3.1.jar;%APP_HOME%\lib\logstash-logback-encoder-8.1.jar;%APP_HOME%\lib\validation-model-1.28.2.jar;%APP_HOME%\lib\feature-reporting-1.28.2.jar;%APP_HOME%\lib\metadata-fixer-1.28.2.jar;%APP_HOME%\lib\core-1.28.2.jar;%APP_HOME%\lib\validation-model-jakarta-1.28.2.jar;%APP_HOME%\lib\feature-reporting-jakarta-1.28.2.jar;%APP_HOME%\lib\metadata-fixer-jakarta-1.28.2.jar;%APP_HOME%\lib\core-jakarta-1.28.2.jar;%APP_HOME%\lib\jackson-databind-2.20.0.jar;%APP_HOME%\lib\jackson-core-2.20.0.jar;%APP_HOME%\lib\jackson-module-kotlin-2.20.0.jar;%APP_HOME%\lib\kotlin-reflect-2.2.10.jar;%APP_HOME%\lib\ktor-http-cio-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-serialization-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-websockets-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-http-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-events-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-network-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-utils-jvm-3.3.0.jar;%APP_HOME%\lib\ktor-io-jvm-3.3.0.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.10.2.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.9.0.jar;%APP_HOME%\lib\kotlinx-io-core-jvm-0.8.0.jar;%APP_HOME%\lib\kotlinx-io-bytestring-jvm-0.8.0.jar;%APP_HOME%\lib\kotlin-stdlib-2.2.20.jar;%APP_HOME%\lib\handlebars-4.3.1.jar;%APP_HOME%\lib\openhtmltopdf-pdfbox-1.1.31.jar;%APP_HOME%\lib\openhtmltopdf-slf4j-1.1.31.jar;%APP_HOME%\lib\openhtmltopdf-svg-support-1.1.31.jar;%APP_HOME%\lib\simpleclient_common-0.16.0.jar;%APP_HOME%\lib\simpleclient_hotspot-0.16.0.jar;%APP_HOME%\lib\logback-classic-1.5.18.jar;%APP_HOME%\lib\batik-codec-1.17.jar;%APP_HOME%\lib\batik-transcoder-1.17.jar;%APP_HOME%\lib\batik-bridge-1.17.jar;%APP_HOME%\lib\batik-script-1.17.jar;%APP_HOME%\lib\batik-anim-1.17.jar;%APP_HOME%\lib\batik-gvt-1.17.jar;%APP_HOME%\lib\batik-svggen-1.17.jar;%APP_HOME%\lib\batik-svg-dom-1.17.jar;%APP_HOME%\lib\batik-parser-1.17.jar;%APP_HOME%\lib\batik-awt-util-1.17.jar;%APP_HOME%\lib\batik-dom-1.17.jar;%APP_HOME%\lib\batik-css-1.17.jar;%APP_HOME%\lib\xmlgraphics-commons-2.9.jar;%APP_HOME%\lib\commons-io-2.20.0.jar;%APP_HOME%\lib\annotations-23.0.0.jar;%APP_HOME%\lib\jsoup-1.21.2.jar;%APP_HOME%\lib\jaxb-api-2.4.0-b180830.0359.jar;%APP_HOME%\lib\jaxb-runtime-4.0.5.jar;%APP_HOME%\lib\slf4j-api-2.0.17.jar;%APP_HOME%\lib\pdfbox-3.0.3.jar;%APP_HOME%\lib\xmpbox-3.0.3.jar;%APP_HOME%\lib\openhtmltopdf-core-1.1.31.jar;%APP_HOME%\lib\graphics2d-3.0.1.jar;%APP_HOME%\lib\batik-ext-1.17.jar;%APP_HOME%\lib\jackson-annotations-2.20.jar;%APP_HOME%\lib\simpleclient-0.16.0.jar;%APP_HOME%\lib\parser-1.28.2.jar;%APP_HOME%\lib\pdf-model-1.28.2.jar;%APP_HOME%\lib\logback-core-1.5.18.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\jaxb-core-4.0.5.jar;%APP_HOME%\lib\fontbox-3.0.3.jar;%APP_HOME%\lib\pdfbox-io-3.0.3.jar;%APP_HOME%\lib\commons-logging-1.3.3.jar;%APP_HOME%\lib\batik-xml-1.17.jar;%APP_HOME%\lib\batik-util-1.17.jar;%APP_HOME%\lib\batik-constants-1.17.jar;%APP_HOME%\lib\batik-i18n-1.17.jar;%APP_HOME%\lib\batik-shared-resources-1.17.jar;%APP_HOME%\lib\xml-apis-ext-1.3.04.jar;%APP_HOME%\lib\netty-codec-http2-4.2.4.Final.jar;%APP_HOME%\lib\alpn-api-1.1.3.v20160715.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.2.4.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.2.4.Final.jar;%APP_HOME%\lib\config-1.4.4.jar;%APP_HOME%\lib\jansi-2.4.2.jar;%APP_HOME%\lib\simpleclient_tracer_otel-0.16.0.jar;%APP_HOME%\lib\simpleclient_tracer_otel_agent-0.16.0.jar;%APP_HOME%\lib\verapdf-xmp-core-1.28.2.jar;%APP_HOME%\lib\rhino-1.7.13.jar;%APP_HOME%\lib\jaxb-impl-2.3.2.jar;%APP_HOME%\lib\jaxb-core-2.3.0.1.jar;%APP_HOME%\lib\stax-utils-20070216.jar;%APP_HOME%\lib\jakarta.xml.bind-api-4.0.2.jar;%APP_HOME%\lib\angus-activation-2.0.2.jar;%APP_HOME%\lib\jakarta.activation-api-2.1.3.jar;%APP_HOME%\lib\txw2-4.0.5.jar;%APP_HOME%\lib\istack-commons-runtime-4.1.2.jar;%APP_HOME%\lib\verapdf-xmp-core-jakarta-1.28.2.jar;%APP_HOME%\lib\xml-apis-1.4.01.jar;%APP_HOME%\lib\netty-codec-http-4.2.4.Final.jar;%APP_HOME%\lib\netty-handler-4.2.4.Final.jar;%APP_HOME%\lib\netty-codec-compression-4.2.4.Final.jar;%APP_HOME%\lib\netty-codec-base-4.2.4.Final.jar;%APP_HOME%\lib\netty-transport-classes-kqueue-4.2.4.Final.jar;%APP_HOME%\lib\netty-transport-classes-epoll-4.2.4.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.2.4.Final.jar;%APP_HOME%\lib\netty-transport-4.2.4.Final.jar;%APP_HOME%\lib\netty-buffer-4.2.4.Final.jar;%APP_HOME%\lib\netty-resolver-4.2.4.Final.jar;%APP_HOME%\lib\netty-common-4.2.4.Final.jar;%APP_HOME%\lib\simpleclient_tracer_common-0.16.0.jar


@rem Execute pdfgen
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %PDFGEN_OPTS%  -classpath "%CLASSPATH%" no.nav.pdfgen.ApplicationKt %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable PDFGEN_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%PDFGEN_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
