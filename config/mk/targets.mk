ifeq ($(do_p2y),yes)
  p2y   = p2y
endif
ifeq ($(do_e2y),yes)
  e2y   = e2y
endif
INTERFCS = a2y c2y $(p2y) $(e2y)
CORE     = yambo ypp $(INTERFCS)
GPL      = yambo_rt_gpl
UTILS    = changelog
CLEANS   = clean_fast clean clean_all distclean
PH_PROJ  = yambo_ph ypp_ph 
SC_PROJ  = yambo_sc ypp_sc
MAG_PROJ = yambo_magnetic ypp_magnetic
RT_PROJ  = yambo_rt ypp_rt yambo_rt_iterative
NL_PROJ  = yambo_nl ypp_nl
RTE_PROJ = yambo_rt yambo_qed yambo_pl ypp_rt
KERR_PROJ= yambo_kerr
ALL      = $(CORE) $(PH_PROJ) $(SC_PROJ) $(MAG_PROJ) $(RTE_PROJ) $(NL_PROJ) $(KERR_PROJ) $(GPL)
BROKEN   = yambo_electric yambo_phdyn
SCRIPTS  = ydb.pl
EXE      = $(CORE) $(PH_PROJ) $(SC_PROJ) $(MAG_PROJ) $(RTE_PROJ) $(NL_PROJ) $(KERR_PROJ) $(BROKEN) $(SCRIPTS)
