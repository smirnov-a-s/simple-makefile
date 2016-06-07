SOURCES = $(wildcard *.cpp)
OBJECTS = $(SOURCES:%.cpp=%.o)
TARGET = main

CXX = g++
# CPPFLAGS = -I/usr/local/Cellar/boost/1.60.0_2/include
CPPFLAGS =
CXXFLAGS = -MMD -MP -Wall -g -std=c++1y

LD = g++
# LDFLAGS = -L/usr/lib/i386-linux-gnu
LDFLAGS =
LDLIBS  = -lm

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

ifneq ($(MAKECMDGOALS),clean)
-include $(SOURCES:%.cpp=%.d)
endif

clean:
	rm $(OBJECTS) $(TARGET) *.d
