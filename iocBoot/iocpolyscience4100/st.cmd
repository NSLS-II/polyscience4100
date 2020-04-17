#!../../bin/linux-x86_64/polyscience4100

#epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
#epicsEnvSet("EPICS_CA_ADDR_LIST","10.16.1.255")

## You may have to change polyscience4100 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/polyscience4100.dbd"
polyscience4100_registerRecordDeviceDriver pdbbase

epicsEnvSet("STREAM_PROTOCOL_PATH","$(TOP)/protocol")
#Terminal Server Port #4 (Moxa) 
drvAsynIPPortConfigure("TS-P4","10.16.2.55:4004")
#asynSetTraceMask("TS-P4",-1,0x9)
#asynSetTraceIOMask("TS-P4",-1,0x9)

## Load record instances
#dbLoadTemplate "db/userHost.substitutions"
#dbLoadRecords "db/dbSubExample.db", "user=softiocHost"

dbLoadRecords("db/devPolyScience4100.db","P=XF:16ID:LIX,R={PS:1},PORT=TS-P4")
#dbLoadRecords("$(ASYN)/db/asynRecord.db","P=XF:16ID:LIX,R={PS:1}Asyn,PORT=TS-P4,ADDR=0,OMAX=80,IMAX=80")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

#reboot this IOC remotely (from CSS) if needed
#dbLoadRecords ("$(EPICS_BASE)/db/iocAdminSoft.db", "IOC=XF:16ID:LIX{PS}")
#dbLoadRecords ("$(EPICS_BASE)/db/save_restoreStatus.db", "P=XF:16ID:LIX{PS}")
#save_restoreSet_status_prefix("XF:16ID:LIX{PS}")

#asSetFilename("/cf-update/acf/default.acf")

#set_savefile_path("./as", "/save")
#set_requestfile_path("./as", "/req")
#set_pass0_restoreFile("ps_settings_0.sav")
#set_pass1_restoreFile("ps_settings_1.sav")


cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=softiocHost"

#makeAutosaveFileFromDbInfo("./as/req/ps_settings_0.req", "autosaveFields_pass0")
#makeAutosaveFileFromDbInfo("./as/req/ps_settings_1.req", "autosaveFields_pass1")
#create_monitor_set("ps_settings_0.req", 10, "")
#create_monitor_set("ps_settings_1.req", 10, "")

#caPutLogInit("ioclog.cs.nsls2.local:7004", 1)

