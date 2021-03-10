#!../../bin/linux-x86_64/MKS946

#- You may have to change MKS946 to something else
#- everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase "${TOP}/dbd/MKS946.dbd"
MKS946_registerRecordDeviceDriver pdbbase

epicsEnvSet("PREFIX", "UWXRD:MKS946:")
epicsEnvSet("PORT", "serial1")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/MKS946App/Db")

drvAsynSerialPortConfigure("serial1", "/dev/ttyUSBO", 0, 0, 0)
asynOctetSetInputEos("serial1",0,"FF")
asynOctetSetOutputEos("serial1",0,"FF")
asynSetOption("serial1",0,"baud","115200")
asynSetOption("serial1",0,"bits","8")
asynSetOption("serial1",0,"stop","1")
asynSetOption("serial1",0,"parity","none")
asynSetOption("serial1",0,"clocal","Y")
asynSetOption("serial1",0,"crtscts","N")

## Load record instances
#dbLoadRecords("db/xxx.db","user=uwchamber")
dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946_MFC.db","P=$(PREFIX),PORT=serial1,MFC=mfc1,N=1")
dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946_MFC.db","P=$(PREFIX),PORT=serial1,MFC=mfc2,N=2")
dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946_MFC.db","P=$(PREFIX),PORT=serial1,MFC=mfc3,N=3")
dbLoadRecords("/home/uwchamber/epics/MKS946/MKS946App/Db/MKS946_PRC.db","P=$(PREFIX),PORT=serial1,PRC=prc1,N=5")

cd "${TOP}/iocBoot/iocMKS946"
iocInit

## Start any sequence programs
#seq sncxxx,"user=uwchamber"
