####################################################################

MODULE = OtdDrv

GCC = gcc

INCLUDE = -I include

C_FLAGS = -Wall -O -pipe $(INCLUDE)

####################################################################

ifneq ($(KERNELRELEASE),)
	obj-m := $(MODULE).o
else
	KERNELDIR := /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)
all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

new rebuild:	clean all

clean:
	rm -rf mo* .mo* Mo* *.ko *.cmd *.o *.mod.* *.mod .Otd* .M*
endif

