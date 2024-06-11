# Build VirtualBox in Windows

## Introduction

[This repository](https://github.com/VirtualBoBs/build-virtualbox-in-windows) provides a set of scripts that will help you compile VirtualBox easily.

You can find the official manual to compile VirtualBox in Windows from [the official site](https://www.virtualbox.org/wiki/Windows%20build%20instructions), but it's too obsolete to follow at this time. So, we wrote Python scripts that prepare required libraries for compilation, and compile VirtualBox automatically.

What you need to do is only to install pre-requisites for the compilation, and run the scripts.

## Features

- It downloads or compiles the following: 7-Zip, MinGW, SDL, SSL, cURL, Qt5
- It creates and registers a credential that is needed to compile drivers in Windows.
- It manages dependencies in the compilation.
- It compiles VirtualBox binaries.

## Requirement

- Windows 10
- Python (≥ 3.8)
- Enough space (at least 20GB)

## Building

To build VirtualBox via the scripts, you should follow the steps below.

### 1. Set Up Environment

Before using the scripts, you need to install the following.

- Visual Studio 2019 (Tested on **Professional**)
  - Desktop development with C++ -> WinSDK 10.0.22000.0
- [WinDDK 10.0.22000.1](https://learn.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)
- [WinDDK 7.1](https://www.microsoft.com/en-us/download/details.aspx?id=11800)
- [SSL 32bit/64bit](https://slproweb.com/products/Win32OpenSSL.html)

If at least one of them is not installed properly, you could be in trouble with compile errors afterward. And, we recommend you install them **in their default paths**.

### 2. Set Up Privilege

Before going into any steps, you should satisfy the following:

- Test Mode
- Root Privilege

You can turn on the test mode with the following:


- 1. Disable Secure Boot in BIOS
- 2. Turn on test mode
  ```cmd
  bcdedit /set testsigning on
  ```

Note that **you MUST reboot your PC** when you turned on the test mode **for the first time**.

And, you should execute any scripts in this repository **with root-privilege(Administrator)**. Unless, you will confront unexpected issues afterwards.

### 3. Download Source of VirtualBox

You should download from [the official site](https://www.virtualbox.org/wiki/Downloads) the sources of VirtualBox, which you want to compile. And copy the sources into `C:/VBoxBuild/VirtualBox`. Scripts will use `C:/VBoxBuild` as a default working directory for compilation.

### 4, Clone This Repository

Clone this repository via:

```cmd
git clone https://github.com/VirtualBoBs/build-virtualbox-in-windows.git
```

### 5. Run Setup Script

Run `script/setup.py`.

It will configure all the requirements for your compilation.

### 6. Run Build Script

Run `script/build.py`.

Please make sure that **the prior setup stage has been accomplished**.

It will build the components of VirtualBox. You can find the compiled binaries in `C:/VBoxBuild/VirtualBox/out/win.amd64/release/bin`.

If you've finished Step 1~5, building the binaries needs **Step 6 only**.

## Usage

### Run VirtualBox

When you run the GUI version of VirtualBox(`VirtualBox.exe`), you need dynamic libraries of both Qt and cURL library. You can run it via:

```cmd
SET PATH=%PATH%;C:\VBoxBuild\Qt\qt5-x64\bin
SET PATH=%PATH%;C:\VBoxBuild\curl\x64

C:\VBoxBuild\VirtualBox\out\win.amd64\release\bin\VirtualBox.exe
```

### Debug VirtualBox

The default setting provides disabled-hardening on the VirtualBox binary, so you can attach any kind of debugger on the running process of compiled VirtualBox.

## FAQ

### Q) I keep getting an error in `SignTool`: `Multiple certificates were found that meet all the given criteria.`

A) Unfortunately, now our script does not handle multiple certificates being generated during the Setup step. You need to run it only once unlike the Build step. And here is the solution:

1. Run `certmgr.msc`
2. Delete **all the certificates** named `MyTestCertificate` in the `Certificates - Personal`
3. Start from the Setup step.


## Bug Reporting

We use Github Issue as its primary upstream bug tracker. Bugs found when running scripts should be reported via:

- [https://github.com/VirtualBoBs/build-virtualbox-in-windows/issues](https://github.com/VirtualBoBs/build-virtualbox-in-windows/issues)

Especially, let us know if you can not download files automatically in the scripts. Old URLs in the scripts might be the causes.

## Contact

You can contact us via:

- Send a mail via a leg of bird
- Use our common telepathy
- Wish to God your genuine belief

Or, well, just e-mail us :p

## License

Copyright (c) 2020 JungHyun Kim & JaeSeung Lee of VirtualBoBs

Released under the [MIT license](https://tldrlegal.com/license/mit-license).
