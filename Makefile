# Makefile 
#
#     make clean
#     make
#     make exec
#
#-----------------------------------------  

#####
TARGET = final 
OPT = 4

OBJ     = 
OBJ    += final.o


# Optimaze Option
# 
CFLAGOPT  = 
CFLAGOPT += -O0

#
#
# cc options:
CFLAGS =
CFLAGS += -Wall 
CFLAGS += -g 
CFLAGS += $(CFLAGOPT)


#
# Link-time cc options:
LDFLAGS =

CC  = gcc
CPP = g++

#----------------------------- Command
#                                       file deletion command
RM= rm -f
#                                       linker
LN= $(CC)

#----------------------------------------------
all: $(TARGET)

.c.o:
	#----------------------------------------------------- [$<]
	$(CC)  $(CFLAGS)  -c $*.c

.cpp.o:
	#----------------------------------------------------- [$<]
	$(CPP) $(CFLAGS)  -c $*.cpp

$(TARGET) : $(OBJ) 
	#------------------------------------------------------ LINK
	$(LN) -o $(TARGET) $(OBJ)  $(LDFLAGS)  


clean:
	$(RM) *.o $(TARGET)

exec:
	./$(TARGET) $(OPT)