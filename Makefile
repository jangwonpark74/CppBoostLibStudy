.SUFFIXES : .cpp .o
CXX = g++
CXXFLAGS = -g -std=c++17 $(INC)
BOOST_ROOT := /usr/include/boost
LIBS =
INC = -I$(BOOST_ROOT)
TARGET=mp_factorial
OBJS = mp_factorial.o
SRCS = $(OBJS:.o=.cpp)

all: $(TARGET)

$(TARGET):$(OBJS) 
	$(CXX) $(CXXFLAGS) -o $@ $^ 

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $<

dep:
	gcc -M $(INC) $(SRCS) > .depend

clean:
	rm -f *.o
	rm -f $(TARGET)

distclean: clean
	rm -rf .depend
