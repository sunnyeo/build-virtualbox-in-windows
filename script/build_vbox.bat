@echo off

call base_config.bat

cd /d %VBOX_DIR%

echo [+] Configure VirtualBox build setting
set BUILD_TARGET_ARCH=amd64
cscript configure.vbs --with-vc="%VS2010VC_DIR%" --with-qt5="%DEFAULT_DIR%\Qt\qt5-x64" --with-DDK="%WINDDK_DIR%" --with-libSDL="%SDL_DIR%" --with-openssl="%SSL64_DIR%" --with-openssl32="%SSL32_DIR%" --with-libcurl="%DEFAULT_DIR%\curl\x64" --with-libcurl32="%DEFAULT_DIR%\curl\x32"
