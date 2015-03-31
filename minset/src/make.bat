@echo off

set PIN_COMMON_CXXFLAGS= /MT /EHs- /EHa- /wd4530 /DTARGET_WINDOWS /DBIGARRAY_MULTIPLIER=1 /DUSING_XED /D_CRT_SECURE_NO_DEPRECATE /D_SECURE_SCL=0

set PIN_IA32_CXXFLAGS= /DTARGET_IA32 /DHOST_IA32
set PIN_IA32E_CXXFLAGS= /DTARGET_IA32E /DHOST_IA32E
set PIN_EXTRA_CXXFLAGS= /nologo /Gy
set PIN_DEBUG_CXXFLAGS= /Od /Zi
set PIN_RELEASE_CXXFLAGS= /O2
set INCLUDES=/IC:\peach\tools\minset\pin-2.8-37300-msvc10-ia32_intel64-windows\source\include /IC:\peach\tools\minset\pin-2.8-37300-msvc10-ia32_intel64-windows\source\include\gen /IC:\peach\tools\minset\pin-2.8-37300-msvc10-ia32_intel64-windows\extras\xed2-ia32\include

set CXXFLAGS=%INCLUDES% %PIN_COMMON_CXXFLAGS% %PIN_IA32_CXXFLAGS% %PIN_EXTRA_CXXFLAGS% %PINE_RELEASE_CXXFLAGS%

cl /c  bblocks.cpp %CXXFLAGS%

set PIN_ROOT=C:\peach\tools\minset\pin-2.8-37300-msvc10-ia32_intel64-windows
set PIN_LPATHS=/LIBPATH:%PIN_ROOT%\ia32\lib /LIBPATH:%PIN_ROOT%\ia32\lib-ext /LIBPATH:%PIN_ROOT%\extras\xed2-ia32\lib

set PIN_COMMON_LIBS= pin.lib libxed.lib libcpmt.lib libcmt.lib pinvm.lib kernel32.lib
set PIN_COMMON_LIBS= pin.lib libxed.lib libcpmt.lib libcmt.lib pinvm.lib kernel32.lib
set PIN_IA32_LIBS= ntdll-32.lib
set PIN_IA32E_LIBS= ntdll-64.lib

set PIN_COMMON_LDFLAGS= /DLL /EXPORT:main /NODEFAULTLIB
set PIN_IA32_LDFLAGS= /MACHINE:x86 /ENTRY:Ptrace_DllMainCRTStartup@12 /BASE:0x55000000
set PIN_IA32E_LDFLAGS= /MACHINE:x64 /ENTRY:Ptrace_DllMainCRTStartup /BASE:0xC5000000

set PIN_EXTRA_LDFLAGS= /NOLOGO /INCREMENTAL:NO
set PIN_EXTRA_IA32_LDFLAGS=
set PIN_EXTRA_IA32E_LDFLAGS=

set PIN_DEBUG_LDFLAGS= /DEBUG
set PIN_RELEASE_LDFLAGS= /OPT:REF


link bblocks.obj %PIN_LPATHS% %PIN_COMMON_LDFLAGS% %PIN_IA32_LDFLAGS% %PIN_EXTRA_LDFLAGS% %PIN_RELEASE_LDFLAGS% %PIN_IA32_LIBS% %PIN_COMMON_LIBS%

copy /y *.dll ..

del *.lib *.obj *.exp
