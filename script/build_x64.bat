@echo off

call base_config.bat

echo [*] Build cURL x64
cd /d %CURL_DIR%\winbuild
nmake /f Makefile.vc mode=dll WITH_SSL=static DEBUG=no MACHINE=x64 SSL_PATH=%SSL64_DIR% ENABLE_SSPI=no ENABLE_WINSSL=no ENABLE_IDN=no

echo [*] Move cURL x64 files
copy ..\builds\libcurl-vc-x64-release-dll-ssl-static-ipv6\lib\libcurl.lib %DEFAULT_DIR%\curl\x64
copy ..\builds\libcurl-vc-x64-release-dll-ssl-static-ipv6\bin\libcurl.dll %DEFAULT_DIR%\curl\x64
copy ..\builds\libcurl-vc-x64-release-dll-ssl-static-ipv6\include\curl\*.h %DEFAULT_DIR%\curl\x64\include\curl

echo [*] Check moved files
IF EXIST %DEFAULT_DIR%\curl\x64\libcurl.lib echo    -libcurl.lib OK
IF EXIST %DEFAULT_DIR%\curl\x64\libcurl.dll echo    -libcurl.dll OK
IF EXIST %DEFAULT_DIR%\curl\x64\include echo    -Include Files OK

echo [+] Qt

cd %QT_DIR%
configure.bat -opensource -confirm-license -nomake tests -nomake examples -no-compile-examples -release -shared -prefix %DEFAULT_DIR%\Qt\qt5-x64
