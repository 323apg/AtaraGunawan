#
# Variable definitions
#
PRECMP=
ifneq (,$(findstring yambo_sc,$(MAKECMDGOALS)))
 PRECMP=-D_SC
else ifneq (,$(findstring yambo_rt,$(MAKECMDGOALS)))
 PRECMP=-D_RT 
else ifneq (,$(findstring yambo_ph,$(MAKECMDGOALS)))
 PRECMP=-D_ELPH
else ifneq (,$(findstring yambo_nl,$(MAKECMDGOALS)))
 PRECMP=-D_NL -D_RT -D_DOUBLE
endif
#
# Compilation
#
yambo yambo_ph yambo_sc yambo_rt yambo_nl: 
	@rm -f ${compdir}/log/"compile_"$@".log"
	@rm -f ${compdir}/config/stamps_and_lists/compilation_stop_$@.stamp
	@touch ${compdir}/config/stamps_and_lists/compiling_$@.stamp
	@$(call todo_precision,$(PRECMP))
	@$(MAKE) $(MAKEFLAGS) dependencies
	@$(MAKE) $(MAKEFLAGS) ext-libs
	@$(MAKE) $(MAKEFLAGS) int-libs
	@+LIBS="$(YLIBDRIVER)";LAB="$@_Ydriver_";BASE="lib/yambo/Ydriver/src";ADF="$(PRECMP) -D_yambo";$(todo_lib);$(mk_lib)
	@+LIBS="$(Y_LIBS)";BASE="src";ADF="$(PRECMP)";$(todo_lib);$(mk_lib)
	@+X2DO="$@";BASE="driver";XLIBS="$(Y_LIBS_LD)";ADF="$(PRECMP)";$(todo_driver)
	@+X2DO="$@";BASE="driver";XLIBS="$(Y_LIBS_LD)";ADF="$(PRECMP)";$(mk_exe)
