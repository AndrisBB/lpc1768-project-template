

ELF=image.elf

STARTUP=startup_lpc175x_6x.o
OBJS+=$(STARTUP)

CFLAGS= -c
LDFLAGS= -nostdlib
$(ELF) : $(OBJS)
	$(call debug,Lining file $(ELF))
	arm-none-eabi-gcc $(LDFLAGS) -o ./build/$@ ./build/$(OBJS)

%.o: %.c
	$(call debug,Compiling file $@)
	arm-none-eabi-gcc $(CFLAGS) -o ./build/$@ $<

#$(STARTUP) : startup_lpc175x_6x.c
#	$(call debug,Compile Startup file)
#	arm-none-eabi-gcc $(CFLAGS) -o ./build/$@ $<


# Macros to echo colored debug messages
COLOR="\033[0;32m"
NO_COLOR="\033[0m"
debug=@echo $(COLOR)$(1)$(NO_COLOR)
