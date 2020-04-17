TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += polyscience4100Support

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord
# Install devXxxSoft.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Compile and add the code to the support library
polyscience4100Support_SRCS += xxxRecord.c
polyscience4100Support_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
polyscience4100Support_SRCS += dbSubExample.c
polyscience4100Support_SRCS += polyscience4100Hello.c
polyscience4100Support_SRCS += initTrace.c

polyscience4100Support_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = polyscience4100
# polyscience4100.dbd will be created and installed
DBD += polyscience4100.dbd

# polyscience4100.dbd will be made up from these files:
polyscience4100_DBD += base.dbd
polyscience4100_DBD += xxxSupport.dbd
polyscience4100_DBD += dbSubExample.dbd
polyscience4100_DBD += polyscience4100Hello.dbd
polyscience4100_DBD += initTrace.dbd
#include iocStatus and autosave which are installed by epics Debian package
# /usr/lib/epics/dbd/
#polyscience4100_DBD += caPutLog.dbd
#polyscience4100_DBD += devIocStats.dbd
#polyscience4100_DBD += asSupport.dbd
#polyscience4100_DBD += system.dbd
polyscience4100_DBD += asyn.dbd
polyscience4100_DBD += stream.dbd
polyscience4100_DBD += drvAsynIPPort.dbd
polyscience4100_DBD += drvAsynSerialPort.dbd
#polyscience4100_DBD += calcSupport.dbd
#polyscience4100_DBD += swaitRecord.dbd

# polyscience4100_registerRecordDeviceDriver.cpp derives from polyscience4100.dbd
polyscience4100_SRCS += polyscience4100_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
polyscience4100_SRCS_DEFAULT += polyscience4100Main.cpp
polyscience4100_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#polyscience4100_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from the support library
polyscience4100_LIBS += polyscience4100Support

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

ifneq ($(SNCSEQ),)
    # Build sncExample into polyscience4100Support
    sncExample_SNCFLAGS += +r
    polyscience4100_DBD += sncExample.dbd
    polyscience4100Support_SRCS += sncExample.stt
    polyscience4100Support_LIBS += seq pv
    polyscience4100_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

#package: /usr/lib/epics/lib/linux-x86
#polyscience4100_LIBS += caPutLog
#polyscience4100_LIBS += autosave
#polyscience4100_LIBS += devIocStats
polyscience4100_LIBS += asyn
polyscience4100_LIBS += stream
#polyscience4100_LIBS += calc
#polyscience4100_LIBS += sscan

# Finally link to the EPICS Base libraries
polyscience4100_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

