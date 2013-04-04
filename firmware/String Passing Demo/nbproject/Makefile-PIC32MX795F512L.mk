#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PIC32MX795F512L.mk)" "nbproject/Makefile-local-PIC32MX795F512L.mk"
include nbproject/Makefile-local-PIC32MX795F512L.mk
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC32MX795F512L
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/302131729/logging.o ${OBJECTDIR}/_ext/553913376/adb.o ${OBJECTDIR}/_ext/553913376/adb_file.o ${OBJECTDIR}/_ext/553913376/adb_packet.o ${OBJECTDIR}/_ext/419204172/btstack_memory.o ${OBJECTDIR}/_ext/419204172/hci.o ${OBJECTDIR}/_ext/419204172/hci_cmds.o ${OBJECTDIR}/_ext/419204172/hci_dump.o ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o ${OBJECTDIR}/_ext/419204172/l2cap.o ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o ${OBJECTDIR}/_ext/419204172/linked_list.o ${OBJECTDIR}/_ext/419204172/memory_pool.o ${OBJECTDIR}/_ext/419204172/rfcomm.o ${OBJECTDIR}/_ext/419204172/run_loop.o ${OBJECTDIR}/_ext/419204172/sdp.o ${OBJECTDIR}/_ext/419204172/sdp_util.o ${OBJECTDIR}/_ext/419204172/utils.o ${OBJECTDIR}/_ext/8483893/accessory.o ${OBJECTDIR}/_ext/8483893/bt_app.o ${OBJECTDIR}/_ext/8483893/connection.o ${OBJECTDIR}/_ext/553933061/usb_config.o ${OBJECTDIR}/_ext/553933061/usb_host_android.o ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o ${OBJECTDIR}/_ext/1788113008/uart2.o ${OBJECTDIR}/_ext/1228106465/usb_host.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/main.o ${OBJECTDIR}/NU32.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/302131729/logging.o.d ${OBJECTDIR}/_ext/553913376/adb.o.d ${OBJECTDIR}/_ext/553913376/adb_file.o.d ${OBJECTDIR}/_ext/553913376/adb_packet.o.d ${OBJECTDIR}/_ext/419204172/btstack_memory.o.d ${OBJECTDIR}/_ext/419204172/hci.o.d ${OBJECTDIR}/_ext/419204172/hci_cmds.o.d ${OBJECTDIR}/_ext/419204172/hci_dump.o.d ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d ${OBJECTDIR}/_ext/419204172/l2cap.o.d ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d ${OBJECTDIR}/_ext/419204172/linked_list.o.d ${OBJECTDIR}/_ext/419204172/memory_pool.o.d ${OBJECTDIR}/_ext/419204172/rfcomm.o.d ${OBJECTDIR}/_ext/419204172/run_loop.o.d ${OBJECTDIR}/_ext/419204172/sdp.o.d ${OBJECTDIR}/_ext/419204172/sdp_util.o.d ${OBJECTDIR}/_ext/419204172/utils.o.d ${OBJECTDIR}/_ext/8483893/accessory.o.d ${OBJECTDIR}/_ext/8483893/bt_app.o.d ${OBJECTDIR}/_ext/8483893/connection.o.d ${OBJECTDIR}/_ext/553933061/usb_config.o.d ${OBJECTDIR}/_ext/553933061/usb_host_android.o.d ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d ${OBJECTDIR}/_ext/1788113008/uart2.o.d ${OBJECTDIR}/_ext/1228106465/usb_host.o.d ${OBJECTDIR}/LCD.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/NU32.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/302131729/logging.o ${OBJECTDIR}/_ext/553913376/adb.o ${OBJECTDIR}/_ext/553913376/adb_file.o ${OBJECTDIR}/_ext/553913376/adb_packet.o ${OBJECTDIR}/_ext/419204172/btstack_memory.o ${OBJECTDIR}/_ext/419204172/hci.o ${OBJECTDIR}/_ext/419204172/hci_cmds.o ${OBJECTDIR}/_ext/419204172/hci_dump.o ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o ${OBJECTDIR}/_ext/419204172/l2cap.o ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o ${OBJECTDIR}/_ext/419204172/linked_list.o ${OBJECTDIR}/_ext/419204172/memory_pool.o ${OBJECTDIR}/_ext/419204172/rfcomm.o ${OBJECTDIR}/_ext/419204172/run_loop.o ${OBJECTDIR}/_ext/419204172/sdp.o ${OBJECTDIR}/_ext/419204172/sdp_util.o ${OBJECTDIR}/_ext/419204172/utils.o ${OBJECTDIR}/_ext/8483893/accessory.o ${OBJECTDIR}/_ext/8483893/bt_app.o ${OBJECTDIR}/_ext/8483893/connection.o ${OBJECTDIR}/_ext/553933061/usb_config.o ${OBJECTDIR}/_ext/553933061/usb_host_android.o ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o ${OBJECTDIR}/_ext/1788113008/uart2.o ${OBJECTDIR}/_ext/1228106465/usb_host.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/main.o ${OBJECTDIR}/NU32.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-PIC32MX795F512L.mk dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/302131729/logging.o: ../_Libraries/common/logging.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/302131729 
	@${RM} ${OBJECTDIR}/_ext/302131729/logging.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/302131729/logging.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/302131729/logging.o.d" -o ${OBJECTDIR}/_ext/302131729/logging.o ../_Libraries/common/logging.c  
	
${OBJECTDIR}/_ext/553913376/adb.o: ../_Libraries/libadb/adb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb.o.d" -o ${OBJECTDIR}/_ext/553913376/adb.o ../_Libraries/libadb/adb.c  
	
${OBJECTDIR}/_ext/553913376/adb_file.o: ../_Libraries/libadb/adb_file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb_file.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb_file.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb_file.o.d" -o ${OBJECTDIR}/_ext/553913376/adb_file.o ../_Libraries/libadb/adb_file.c  
	
${OBJECTDIR}/_ext/553913376/adb_packet.o: ../_Libraries/libadb/adb_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb_packet.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb_packet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb_packet.o.d" -o ${OBJECTDIR}/_ext/553913376/adb_packet.o ../_Libraries/libadb/adb_packet.c  
	
${OBJECTDIR}/_ext/419204172/btstack_memory.o: ../_Libraries/libbtstack/src/btstack_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/btstack_memory.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/btstack_memory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/btstack_memory.o.d" -o ${OBJECTDIR}/_ext/419204172/btstack_memory.o ../_Libraries/libbtstack/src/btstack_memory.c  
	
${OBJECTDIR}/_ext/419204172/hci.o: ../_Libraries/libbtstack/src/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci.o.d" -o ${OBJECTDIR}/_ext/419204172/hci.o ../_Libraries/libbtstack/src/hci.c  
	
${OBJECTDIR}/_ext/419204172/hci_cmds.o: ../_Libraries/libbtstack/src/hci_cmds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_cmds.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_cmds.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_cmds.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_cmds.o ../_Libraries/libbtstack/src/hci_cmds.c  
	
${OBJECTDIR}/_ext/419204172/hci_dump.o: ../_Libraries/libbtstack/src/hci_dump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_dump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_dump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_dump.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_dump.o ../_Libraries/libbtstack/src/hci_dump.c  
	
${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o: ../_Libraries/libbtstack/src/hci_transport_mchpusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o ../_Libraries/libbtstack/src/hci_transport_mchpusb.c  
	
${OBJECTDIR}/_ext/419204172/l2cap.o: ../_Libraries/libbtstack/src/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/l2cap.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/l2cap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/l2cap.o.d" -o ${OBJECTDIR}/_ext/419204172/l2cap.o ../_Libraries/libbtstack/src/l2cap.c  
	
${OBJECTDIR}/_ext/419204172/l2cap_signaling.o: ../_Libraries/libbtstack/src/l2cap_signaling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d" -o ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o ../_Libraries/libbtstack/src/l2cap_signaling.c  
	
${OBJECTDIR}/_ext/419204172/linked_list.o: ../_Libraries/libbtstack/src/linked_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/linked_list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/linked_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/linked_list.o.d" -o ${OBJECTDIR}/_ext/419204172/linked_list.o ../_Libraries/libbtstack/src/linked_list.c  
	
${OBJECTDIR}/_ext/419204172/memory_pool.o: ../_Libraries/libbtstack/src/memory_pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/memory_pool.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/memory_pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/memory_pool.o.d" -o ${OBJECTDIR}/_ext/419204172/memory_pool.o ../_Libraries/libbtstack/src/memory_pool.c  
	
${OBJECTDIR}/_ext/419204172/rfcomm.o: ../_Libraries/libbtstack/src/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/rfcomm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/rfcomm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/rfcomm.o.d" -o ${OBJECTDIR}/_ext/419204172/rfcomm.o ../_Libraries/libbtstack/src/rfcomm.c  
	
${OBJECTDIR}/_ext/419204172/run_loop.o: ../_Libraries/libbtstack/src/run_loop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/run_loop.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/run_loop.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/run_loop.o.d" -o ${OBJECTDIR}/_ext/419204172/run_loop.o ../_Libraries/libbtstack/src/run_loop.c  
	
${OBJECTDIR}/_ext/419204172/sdp.o: ../_Libraries/libbtstack/src/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/sdp.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/sdp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/sdp.o.d" -o ${OBJECTDIR}/_ext/419204172/sdp.o ../_Libraries/libbtstack/src/sdp.c  
	
${OBJECTDIR}/_ext/419204172/sdp_util.o: ../_Libraries/libbtstack/src/sdp_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/sdp_util.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/sdp_util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/sdp_util.o.d" -o ${OBJECTDIR}/_ext/419204172/sdp_util.o ../_Libraries/libbtstack/src/sdp_util.c  
	
${OBJECTDIR}/_ext/419204172/utils.o: ../_Libraries/libbtstack/src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/utils.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/utils.o.d" -o ${OBJECTDIR}/_ext/419204172/utils.o ../_Libraries/libbtstack/src/utils.c  
	
${OBJECTDIR}/_ext/8483893/accessory.o: ../_Libraries/libconn/accessory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/accessory.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/accessory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/accessory.o.d" -o ${OBJECTDIR}/_ext/8483893/accessory.o ../_Libraries/libconn/accessory.c  
	
${OBJECTDIR}/_ext/8483893/bt_app.o: ../_Libraries/libconn/bt_app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/bt_app.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/bt_app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/bt_app.o.d" -o ${OBJECTDIR}/_ext/8483893/bt_app.o ../_Libraries/libconn/bt_app.c  
	
${OBJECTDIR}/_ext/8483893/connection.o: ../_Libraries/libconn/connection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/connection.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/connection.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/connection.o.d" -o ${OBJECTDIR}/_ext/8483893/connection.o ../_Libraries/libconn/connection.c  
	
${OBJECTDIR}/_ext/553933061/usb_config.o: ../_Libraries/libusb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_config.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_config.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_config.o ../_Libraries/libusb/usb_config.c  
	
${OBJECTDIR}/_ext/553933061/usb_host_android.o: ../_Libraries/libusb/usb_host_android.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_host_android.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_host_android.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_host_android.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_host_android.o ../_Libraries/libusb/usb_host_android.c  
	
${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o: ../_Libraries/libusb/usb_host_bluetooth.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o ../_Libraries/libusb/usb_host_bluetooth.c  
	
${OBJECTDIR}/_ext/1788113008/uart2.o: ../_Libraries/microchip/common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1788113008 
	@${RM} ${OBJECTDIR}/_ext/1788113008/uart2.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1788113008/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/1788113008/uart2.o.d" -o ${OBJECTDIR}/_ext/1788113008/uart2.o ../_Libraries/microchip/common/uart2.c  
	
${OBJECTDIR}/_ext/1228106465/usb_host.o: ../_Libraries/microchip/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1228106465 
	@${RM} ${OBJECTDIR}/_ext/1228106465/usb_host.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228106465/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/1228106465/usb_host.o.d" -o ${OBJECTDIR}/_ext/1228106465/usb_host.o ../_Libraries/microchip/usb/usb_host.c  
	
${OBJECTDIR}/LCD.o: LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/LCD.o.d" -o ${OBJECTDIR}/LCD.o LCD.c  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c  
	
${OBJECTDIR}/NU32.o: NU32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/NU32.o.d 
	@${FIXDEPS} "${OBJECTDIR}/NU32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/NU32.o.d" -o ${OBJECTDIR}/NU32.o NU32.c  
	
else
${OBJECTDIR}/_ext/302131729/logging.o: ../_Libraries/common/logging.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/302131729 
	@${RM} ${OBJECTDIR}/_ext/302131729/logging.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/302131729/logging.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/302131729/logging.o.d" -o ${OBJECTDIR}/_ext/302131729/logging.o ../_Libraries/common/logging.c  
	
${OBJECTDIR}/_ext/553913376/adb.o: ../_Libraries/libadb/adb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb.o.d" -o ${OBJECTDIR}/_ext/553913376/adb.o ../_Libraries/libadb/adb.c  
	
${OBJECTDIR}/_ext/553913376/adb_file.o: ../_Libraries/libadb/adb_file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb_file.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb_file.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb_file.o.d" -o ${OBJECTDIR}/_ext/553913376/adb_file.o ../_Libraries/libadb/adb_file.c  
	
${OBJECTDIR}/_ext/553913376/adb_packet.o: ../_Libraries/libadb/adb_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553913376 
	@${RM} ${OBJECTDIR}/_ext/553913376/adb_packet.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553913376/adb_packet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553913376/adb_packet.o.d" -o ${OBJECTDIR}/_ext/553913376/adb_packet.o ../_Libraries/libadb/adb_packet.c  
	
${OBJECTDIR}/_ext/419204172/btstack_memory.o: ../_Libraries/libbtstack/src/btstack_memory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/btstack_memory.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/btstack_memory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/btstack_memory.o.d" -o ${OBJECTDIR}/_ext/419204172/btstack_memory.o ../_Libraries/libbtstack/src/btstack_memory.c  
	
${OBJECTDIR}/_ext/419204172/hci.o: ../_Libraries/libbtstack/src/hci.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci.o.d" -o ${OBJECTDIR}/_ext/419204172/hci.o ../_Libraries/libbtstack/src/hci.c  
	
${OBJECTDIR}/_ext/419204172/hci_cmds.o: ../_Libraries/libbtstack/src/hci_cmds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_cmds.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_cmds.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_cmds.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_cmds.o ../_Libraries/libbtstack/src/hci_cmds.c  
	
${OBJECTDIR}/_ext/419204172/hci_dump.o: ../_Libraries/libbtstack/src/hci_dump.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_dump.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_dump.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_dump.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_dump.o ../_Libraries/libbtstack/src/hci_dump.c  
	
${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o: ../_Libraries/libbtstack/src/hci_transport_mchpusb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o.d" -o ${OBJECTDIR}/_ext/419204172/hci_transport_mchpusb.o ../_Libraries/libbtstack/src/hci_transport_mchpusb.c  
	
${OBJECTDIR}/_ext/419204172/l2cap.o: ../_Libraries/libbtstack/src/l2cap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/l2cap.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/l2cap.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/l2cap.o.d" -o ${OBJECTDIR}/_ext/419204172/l2cap.o ../_Libraries/libbtstack/src/l2cap.c  
	
${OBJECTDIR}/_ext/419204172/l2cap_signaling.o: ../_Libraries/libbtstack/src/l2cap_signaling.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/l2cap_signaling.o.d" -o ${OBJECTDIR}/_ext/419204172/l2cap_signaling.o ../_Libraries/libbtstack/src/l2cap_signaling.c  
	
${OBJECTDIR}/_ext/419204172/linked_list.o: ../_Libraries/libbtstack/src/linked_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/linked_list.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/linked_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/linked_list.o.d" -o ${OBJECTDIR}/_ext/419204172/linked_list.o ../_Libraries/libbtstack/src/linked_list.c  
	
${OBJECTDIR}/_ext/419204172/memory_pool.o: ../_Libraries/libbtstack/src/memory_pool.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/memory_pool.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/memory_pool.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/memory_pool.o.d" -o ${OBJECTDIR}/_ext/419204172/memory_pool.o ../_Libraries/libbtstack/src/memory_pool.c  
	
${OBJECTDIR}/_ext/419204172/rfcomm.o: ../_Libraries/libbtstack/src/rfcomm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/rfcomm.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/rfcomm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/rfcomm.o.d" -o ${OBJECTDIR}/_ext/419204172/rfcomm.o ../_Libraries/libbtstack/src/rfcomm.c  
	
${OBJECTDIR}/_ext/419204172/run_loop.o: ../_Libraries/libbtstack/src/run_loop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/run_loop.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/run_loop.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/run_loop.o.d" -o ${OBJECTDIR}/_ext/419204172/run_loop.o ../_Libraries/libbtstack/src/run_loop.c  
	
${OBJECTDIR}/_ext/419204172/sdp.o: ../_Libraries/libbtstack/src/sdp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/sdp.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/sdp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/sdp.o.d" -o ${OBJECTDIR}/_ext/419204172/sdp.o ../_Libraries/libbtstack/src/sdp.c  
	
${OBJECTDIR}/_ext/419204172/sdp_util.o: ../_Libraries/libbtstack/src/sdp_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/sdp_util.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/sdp_util.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/sdp_util.o.d" -o ${OBJECTDIR}/_ext/419204172/sdp_util.o ../_Libraries/libbtstack/src/sdp_util.c  
	
${OBJECTDIR}/_ext/419204172/utils.o: ../_Libraries/libbtstack/src/utils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/419204172 
	@${RM} ${OBJECTDIR}/_ext/419204172/utils.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/419204172/utils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/419204172/utils.o.d" -o ${OBJECTDIR}/_ext/419204172/utils.o ../_Libraries/libbtstack/src/utils.c  
	
${OBJECTDIR}/_ext/8483893/accessory.o: ../_Libraries/libconn/accessory.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/accessory.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/accessory.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/accessory.o.d" -o ${OBJECTDIR}/_ext/8483893/accessory.o ../_Libraries/libconn/accessory.c  
	
${OBJECTDIR}/_ext/8483893/bt_app.o: ../_Libraries/libconn/bt_app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/bt_app.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/bt_app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/bt_app.o.d" -o ${OBJECTDIR}/_ext/8483893/bt_app.o ../_Libraries/libconn/bt_app.c  
	
${OBJECTDIR}/_ext/8483893/connection.o: ../_Libraries/libconn/connection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/8483893 
	@${RM} ${OBJECTDIR}/_ext/8483893/connection.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/8483893/connection.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/8483893/connection.o.d" -o ${OBJECTDIR}/_ext/8483893/connection.o ../_Libraries/libconn/connection.c  
	
${OBJECTDIR}/_ext/553933061/usb_config.o: ../_Libraries/libusb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_config.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_config.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_config.o ../_Libraries/libusb/usb_config.c  
	
${OBJECTDIR}/_ext/553933061/usb_host_android.o: ../_Libraries/libusb/usb_host_android.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_host_android.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_host_android.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_host_android.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_host_android.o ../_Libraries/libusb/usb_host_android.c  
	
${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o: ../_Libraries/libusb/usb_host_bluetooth.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/553933061 
	@${RM} ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o.d" -o ${OBJECTDIR}/_ext/553933061/usb_host_bluetooth.o ../_Libraries/libusb/usb_host_bluetooth.c  
	
${OBJECTDIR}/_ext/1788113008/uart2.o: ../_Libraries/microchip/common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1788113008 
	@${RM} ${OBJECTDIR}/_ext/1788113008/uart2.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1788113008/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/1788113008/uart2.o.d" -o ${OBJECTDIR}/_ext/1788113008/uart2.o ../_Libraries/microchip/common/uart2.c  
	
${OBJECTDIR}/_ext/1228106465/usb_host.o: ../_Libraries/microchip/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1228106465 
	@${RM} ${OBJECTDIR}/_ext/1228106465/usb_host.o.d 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228106465/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/_ext/1228106465/usb_host.o.d" -o ${OBJECTDIR}/_ext/1228106465/usb_host.o ../_Libraries/microchip/usb/usb_host.c  
	
${OBJECTDIR}/LCD.o: LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/LCD.o.d" -o ${OBJECTDIR}/LCD.o LCD.c  
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c  
	
${OBJECTDIR}/NU32.o: NU32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/NU32.o.d 
	@${FIXDEPS} "${OBJECTDIR}/NU32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -DPLATFORM=400 -DNDEBUG -I"../_Libraries/libadb" -I"../_Libraries/libconn" -I"../_Libraries/libusb" -I"../_Libraries/libbtstack/src" -I"../_Libraries/libbtstack/include/btstack" -I"../_Libraries/libbtstack" -I"../_Libraries/microchip/common" -I"../_Libraries/microchip/usb" -I"../_Libraries/microchip/include" -I"../_Libraries/microchip/include/USB" -I"../_Libraries/common" -MMD -MF "${OBJECTDIR}/NU32.o.d" -o ${OBJECTDIR}/NU32.o NU32.c  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_ICD3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--defsym=_min_heap_size=3000 
else
dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}       -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=3000
	${MP_CC_DIR}\\pic32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/String_Passing_Demo.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC32MX795F512L
	${RM} -r dist/PIC32MX795F512L

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
