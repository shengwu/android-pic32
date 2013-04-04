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
ifeq "$(wildcard nbproject/Makefile-local-PIC24FJ256DA206.mk)" "nbproject/Makefile-local-PIC24FJ256DA206.mk"
include nbproject/Makefile-local-PIC24FJ256DA206.mk
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC24FJ256DA206
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=a
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/adb.o ${OBJECTDIR}/adb_file.o ${OBJECTDIR}/adb_packet.o
POSSIBLE_DEPFILES=${OBJECTDIR}/adb.o.d ${OBJECTDIR}/adb_file.o.d ${OBJECTDIR}/adb_packet.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/adb.o ${OBJECTDIR}/adb_file.o ${OBJECTDIR}/adb_packet.o


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
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-PIC24FJ256DA206.mk dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256DA206
MP_LINKER_FILE_OPTION=,-Tp24FJ256DA206.gld
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
${OBJECTDIR}/adb.o: adb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb.o.d 
	@${RM} ${OBJECTDIR}/adb.o.ok ${OBJECTDIR}/adb.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb.o.d" -o ${OBJECTDIR}/adb.o adb.c    
	
${OBJECTDIR}/adb_file.o: adb_file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb_file.o.d 
	@${RM} ${OBJECTDIR}/adb_file.o.ok ${OBJECTDIR}/adb_file.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb_file.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb_file.o.d" -o ${OBJECTDIR}/adb_file.o adb_file.c    
	
${OBJECTDIR}/adb_packet.o: adb_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb_packet.o.d 
	@${RM} ${OBJECTDIR}/adb_packet.o.ok ${OBJECTDIR}/adb_packet.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb_packet.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb_packet.o.d" -o ${OBJECTDIR}/adb_packet.o adb_packet.c    
	
else
${OBJECTDIR}/adb.o: adb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb.o.d 
	@${RM} ${OBJECTDIR}/adb.o.ok ${OBJECTDIR}/adb.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb.o.d" -o ${OBJECTDIR}/adb.o adb.c    
	
${OBJECTDIR}/adb_file.o: adb_file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb_file.o.d 
	@${RM} ${OBJECTDIR}/adb_file.o.ok ${OBJECTDIR}/adb_file.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb_file.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb_file.o.d" -o ${OBJECTDIR}/adb_file.o adb_file.c    
	
${OBJECTDIR}/adb_packet.o: adb_packet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/adb_packet.o.d 
	@${RM} ${OBJECTDIR}/adb_packet.o.ok ${OBJECTDIR}/adb_packet.o.err 
	@${FIXDEPS} "${OBJECTDIR}/adb_packet.o.d" $(SILENT) -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -ffunction-sections -Wall -DNDEBUG -I"." -I"../common" -I"../libusb" -I"../microchip/include" -mlarge-data -mconst-in-data -Os -MMD -MF "${OBJECTDIR}/adb_packet.o.d" -o ${OBJECTDIR}/adb_packet.o adb_packet.c    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} -omf=coff $(MP_EXTRA_AR_PRE) r dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
else
dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} -omf=coff $(MP_EXTRA_AR_PRE) r dist/${CND_CONF}/${IMAGE_TYPE}/libadb.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC24FJ256DA206
	${RM} -r dist/PIC24FJ256DA206

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
