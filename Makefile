#作用是制定规则来说明当前目录下生成终极目标文件test
TGT = test
#指定子目录
SUB_DIR = main tst
#指定当前目录
export TOP_PATH = $(shell pwd)
#指定头文件目录
export HEAD_PATH = $(TOP_PATH)/head
#指定子目标
export SUB_TGT = bulit_in.o
#CROSS_COMPILER = arm-linux-
export CC = $(CROSS_COMPILER)gcc
#编译选项,指定编译时的头文件路径
export CFLAGS = -I$(HEAD_PATH) -Wall
#指定链接器
export LD = ld
#指定链接器选项
export LDFLAGS = 
#终极目标 (后面表示包括子目录的所有.o)

.PHONY: all clean $(SUB_DIR)

all:$(TGT)
$(TGT): $(SUB_DIR)
	$(CC) $(CFLAGS)  $(^:=/$(SUB_TGT)) -o $@

#下面规则说明进入到生成a.out所需要依赖的子目录

$(SUB_DIR): 
	make -C $@ 

#-C选项，可以让make进入到后面指定的目录

clean:
	-rm -f $(TGT)
	for dir in $(SUB_DIR); do \
	make -C $$dir clean;	\
	done
