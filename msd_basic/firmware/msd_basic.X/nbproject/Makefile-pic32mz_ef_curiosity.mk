#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic32mz_ef_curiosity.mk)" "nbproject/Makefile-local-pic32mz_ef_curiosity.mk"
include nbproject/Makefile-local-pic32mz_ef_curiosity.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic32mz_ef_curiosity
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c ../src/system_config/pic32mz_ef_curiosity/system_init.c ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c ../src/system_config/pic32mz_ef_curiosity/system_tasks.c ../src/app.c ../src/main.c ../src/timer.c ../src/switch.c ../src/adc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/256799347/bsp.o ${OBJECTDIR}/_ext/1698122060/drv_tmr.o ${OBJECTDIR}/_ext/276079137/drv_usbhs.o ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o ${OBJECTDIR}/_ext/464737300/sys_clk_static.o ${OBJECTDIR}/_ext/1637942171/sys_devcon.o ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/1876606571/sys_fs.o ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o ${OBJECTDIR}/_ext/106150384/ff.o ${OBJECTDIR}/_ext/106150384/diskio.o ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o ${OBJECTDIR}/_ext/1592475509/sys_tmr.o ${OBJECTDIR}/_ext/1004681772/usb_host.o ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o ${OBJECTDIR}/_ext/1488941123/system_init.o ${OBJECTDIR}/_ext/1488941123/system_interrupt.o ${OBJECTDIR}/_ext/1488941123/system_exceptions.o ${OBJECTDIR}/_ext/1488941123/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/timer.o ${OBJECTDIR}/_ext/1360937237/switch.o ${OBJECTDIR}/_ext/1360937237/adc.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/256799347/bsp.o.d ${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d ${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d ${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d ${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d ${OBJECTDIR}/_ext/1876606571/sys_fs.o.d ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d ${OBJECTDIR}/_ext/106150384/ff.o.d ${OBJECTDIR}/_ext/106150384/diskio.o.d ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d ${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d ${OBJECTDIR}/_ext/1004681772/usb_host.o.d ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d ${OBJECTDIR}/_ext/1488941123/system_init.o.d ${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d ${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d ${OBJECTDIR}/_ext/1488941123/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/timer.o.d ${OBJECTDIR}/_ext/1360937237/switch.o.d ${OBJECTDIR}/_ext/1360937237/adc.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/256799347/bsp.o ${OBJECTDIR}/_ext/1698122060/drv_tmr.o ${OBJECTDIR}/_ext/276079137/drv_usbhs.o ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o ${OBJECTDIR}/_ext/464737300/sys_clk_static.o ${OBJECTDIR}/_ext/1637942171/sys_devcon.o ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o ${OBJECTDIR}/_ext/1876606571/sys_fs.o ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o ${OBJECTDIR}/_ext/106150384/ff.o ${OBJECTDIR}/_ext/106150384/diskio.o ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o ${OBJECTDIR}/_ext/1592475509/sys_tmr.o ${OBJECTDIR}/_ext/1004681772/usb_host.o ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o ${OBJECTDIR}/_ext/1488941123/system_init.o ${OBJECTDIR}/_ext/1488941123/system_interrupt.o ${OBJECTDIR}/_ext/1488941123/system_exceptions.o ${OBJECTDIR}/_ext/1488941123/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/timer.o ${OBJECTDIR}/_ext/1360937237/switch.o ${OBJECTDIR}/_ext/1360937237/adc.o

# Source Files
SOURCEFILES=../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c ../src/system_config/pic32mz_ef_curiosity/system_init.c ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c ../src/system_config/pic32mz_ef_curiosity/system_tasks.c ../src/app.c ../src/main.c ../src/timer.c ../src/switch.c ../src/adc.c


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
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic32mz_ef_curiosity.mk dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
else
${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.ok ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.err 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d" "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.d"  -o ${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_cache_pic32mz.S  -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/1637942171/sys_devcon_cache_pic32mz.o.asm.d",--gdwarf-2
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/256799347/bsp.o: ../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/256799347" 
	@${RM} ${OBJECTDIR}/_ext/256799347/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/256799347/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/256799347/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/256799347/bsp.o.d" -o ${OBJECTDIR}/_ext/256799347/bsp.o ../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1698122060/drv_tmr.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1698122060" 
	@${RM} ${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1698122060/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1698122060/drv_tmr.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/276079137/drv_usbhs.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/276079137" 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/276079137/drv_usbhs.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/276079137" 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d" -o ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/464737300/sys_clk_static.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/464737300" 
	@${RM} ${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/464737300/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/464737300/sys_clk_static.o ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1637942171/sys_devcon.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1637942171/sys_devcon.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1876606571/sys_fs.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1876606571" 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1876606571/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1876606571/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1876606571/sys_fs.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1876606571" 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/106150384/ff.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/106150384" 
	@${RM} ${OBJECTDIR}/_ext/106150384/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/106150384/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/106150384/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/106150384/ff.o.d" -o ${OBJECTDIR}/_ext/106150384/ff.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/106150384/diskio.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/106150384" 
	@${RM} ${OBJECTDIR}/_ext/106150384/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/106150384/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/106150384/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/106150384/diskio.o.d" -o ${OBJECTDIR}/_ext/106150384/diskio.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1560362081" 
	@${RM} ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1556635708/sys_ports_static.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1556635708" 
	@${RM} ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1592475509/sys_tmr.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1592475509" 
	@${RM} ${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1592475509/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1592475509/sys_tmr.o ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host_msd.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_init.o: ../src/system_config/pic32mz_ef_curiosity/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_init.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_init.o ../src/system_config/pic32mz_ef_curiosity/system_init.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_interrupt.o: ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_interrupt.o ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_exceptions.o: ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_exceptions.o ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_tasks.o: ../src/system_config/pic32mz_ef_curiosity/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_tasks.o ../src/system_config/pic32mz_ef_curiosity/system_tasks.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/timer.o: ../src/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/timer.o.d" -o ${OBJECTDIR}/_ext/1360937237/timer.o ../src/timer.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/switch.o: ../src/switch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/switch.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/switch.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/switch.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/switch.o.d" -o ${OBJECTDIR}/_ext/1360937237/switch.o ../src/switch.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/adc.o: ../src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/adc.o.d" -o ${OBJECTDIR}/_ext/1360937237/adc.o ../src/adc.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/256799347/bsp.o: ../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/256799347" 
	@${RM} ${OBJECTDIR}/_ext/256799347/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/256799347/bsp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/256799347/bsp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/256799347/bsp.o.d" -o ${OBJECTDIR}/_ext/256799347/bsp.o ../src/system_config/pic32mz_ef_curiosity/bsp/bsp.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1698122060/drv_tmr.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1698122060" 
	@${RM} ${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1698122060/drv_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1698122060/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1698122060/drv_tmr.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/276079137/drv_usbhs.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/276079137" 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/276079137/drv_usbhs.o.d" -o ${OBJECTDIR}/_ext/276079137/drv_usbhs.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o: ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/276079137" 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o.d" -o ${OBJECTDIR}/_ext/276079137/drv_usbhs_host.o ../src/system_config/pic32mz_ef_curiosity/framework/driver/usb/usbhs/src/dynamic/drv_usbhs_host.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/464737300/sys_clk_static.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/464737300" 
	@${RM} ${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/464737300/sys_clk_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/464737300/sys_clk_static.o.d" -o ${OBJECTDIR}/_ext/464737300/sys_clk_static.o ../src/system_config/pic32mz_ef_curiosity/framework/system/clk/src/sys_clk_static.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1637942171/sys_devcon.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/1637942171/sys_devcon.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1637942171" 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d 
	@${RM} ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o.d" -o ${OBJECTDIR}/_ext/1637942171/sys_devcon_pic32mz.o ../src/system_config/pic32mz_ef_curiosity/framework/system/devcon/src/sys_devcon_pic32mz.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1876606571/sys_fs.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1876606571" 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1876606571/sys_fs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1876606571/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1876606571/sys_fs.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1876606571" 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1876606571/sys_fs_media_manager.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/106150384/ff.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/106150384" 
	@${RM} ${OBJECTDIR}/_ext/106150384/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/106150384/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/106150384/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/106150384/ff.o.d" -o ${OBJECTDIR}/_ext/106150384/ff.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/ff.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/106150384/diskio.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/106150384" 
	@${RM} ${OBJECTDIR}/_ext/106150384/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/106150384/diskio.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/106150384/diskio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/106150384/diskio.o.d" -o ${OBJECTDIR}/_ext/106150384/diskio.o ../src/system_config/pic32mz_ef_curiosity/framework/system/fs/diskio.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1560362081" 
	@${RM} ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1560362081/sys_int_pic32.o ../src/system_config/pic32mz_ef_curiosity/framework/system/int/src/sys_int_pic32.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1556635708/sys_ports_static.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1556635708" 
	@${RM} ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1556635708/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/1556635708/sys_ports_static.o ../src/system_config/pic32mz_ef_curiosity/framework/system/ports/src/sys_ports_static.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1592475509/sys_tmr.o: ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1592475509" 
	@${RM} ${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1592475509/sys_tmr.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1592475509/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1592475509/sys_tmr.o ../src/system_config/pic32mz_ef_curiosity/framework/system/tmr/src/sys_tmr.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host_msd.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host_msd.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host_msd.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_msd.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o: ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1004681772" 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o.d" -o ${OBJECTDIR}/_ext/1004681772/usb_host_scsi.o ../src/system_config/pic32mz_ef_curiosity/framework/usb/src/dynamic/usb_host_scsi.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_init.o: ../src/system_config/pic32mz_ef_curiosity/system_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_init.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_init.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_init.o ../src/system_config/pic32mz_ef_curiosity/system_init.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_interrupt.o: ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_interrupt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_interrupt.o ../src/system_config/pic32mz_ef_curiosity/system_interrupt.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_exceptions.o: ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_exceptions.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_exceptions.o ../src/system_config/pic32mz_ef_curiosity/system_exceptions.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1488941123/system_tasks.o: ../src/system_config/pic32mz_ef_curiosity/system_tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1488941123" 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1488941123/system_tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1488941123/system_tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1488941123/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1488941123/system_tasks.o ../src/system_config/pic32mz_ef_curiosity/system_tasks.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/timer.o: ../src/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/timer.o.d" -o ${OBJECTDIR}/_ext/1360937237/timer.o ../src/timer.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/switch.o: ../src/switch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/switch.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/switch.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/switch.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/switch.o.d" -o ${OBJECTDIR}/_ext/1360937237/switch.o ../src/switch.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1360937237/adc.o: ../src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src/pic32mz_ef_curiosity" -I"../src" -I"../src/system_config/pic32mz_ef_curiosity" -I"../../../../../../framework" -I"../src/system_config/pic32mz_ef_curiosity/framework" -I"../src/system_config/pic32mz_ef_curiosity/bsp" -MMD -MF "${OBJECTDIR}/_ext/1360937237/adc.o.d" -o ${OBJECTDIR}/_ext/1360937237/adc.o ../src/adc.c    -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=501,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_pic32mz_ef_curiosity=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=501,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/msd_basic.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/pic32mz_ef_curiosity
	${RM} -r dist/pic32mz_ef_curiosity

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
