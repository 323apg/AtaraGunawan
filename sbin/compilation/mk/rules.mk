#
# Suffixes
#
.SUFFIXES: .F .f90 .c .f .o .a
#
# Includes
#
-include local_modules.dep
#
# Rules
#
.F.o:
	$(F90_elemental_compilation)
.f.o:
	$(f77_elemental_compilation)
.c.o:
	$(c_elemental_compilation)
