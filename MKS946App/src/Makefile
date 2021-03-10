TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MKS946
# MKS946.dbd will be created and installed
DBD += MKS946.dbd

# MKS946.dbd will be made up from these files:
MKS946_DBD += base.dbd

# Include dbd files from all support applications:
#MKS946_DBD += xxx.dbd
MKS946_DBD += calc.dbd
MKS946_DBD += asyn.dbd
MKS946_DBD += stream.dbd
MKS946_DBD += stream-scalcout.dbd
MKS946_DBD += drvAsynIPPort.dbd
MKS946_DBD += drvAsynSerialPort.dbd
# Add all the support libraries needed by this IOC
#MKS946_LIBS += xxx

# MKS946_registerRecordDeviceDriver.cpp derives from MKS946.dbd
MKS946_SRCS += MKS946_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MKS946_SRCS_DEFAULT += MKS946Main.cpp
MKS946_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MKS946_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MKS946_LIBS += $(EPICS_BASE_IOC_LIBS)
MKS946_LIBS += asyn
MKS946_LIBS += stream
MKS946_LIBS += calc
#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

