SRCS = tst.c
SUB_DIR = foo

all:$(SUB_TGT)

.PHONY: $(SUB_TGT) $(SUB_DIR) clean 
#下面的规则说明，如何生成当前目录下的子目标(是由当前目录下的.c生成的.o和当前下的子目录下的子目标临时打包生成的)
$(SUB_TGT): $(SRCS:.c=.o) $(SUB_DIR)
	$(LD) $(LDFLAGS)  $(SRCS:.c=.o) $(SUB_DIR:=/$(SUB_TGT)) \
	-r -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -c

%.d:  %.c
	$(CC) $(CFLAGS) $< -MM > $@

ifneq ($(MAKECMDGOALS), clean)
sinclude $(SRCS:.c=.d)
endif

$(SUB_DIR):
	make -C $@
clean:
	-rm -f *.o  *.d  
	for dir in $(SUB_DIR); do  \
	make -C $$dir clean;  \
	done

