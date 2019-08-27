# Note that we only include xkas.cpp in the build command because
# that file #includes all the other cpp files

all : debug release

clean :
	$(RM) xkas xkas-asan xkas-debug

.PHONY: debug
debug : xkas-debug xkas-asan

.PHONY: release
release : xkas

xkas : CXXFLAGS += -O3
xkas : xkas.cpp libstr.cpp libstr_math.cpp libstr_replace.cpp libstr_split.cpp libvlist.cpp support.cpp base.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $< -o $@ $(LOADLIBES) $(LDLIBS)

xkas-debug : CXXFLAGS += -g -O0
xkas-debug : xkas.cpp libstr.cpp libstr_math.cpp libstr_replace.cpp libstr_split.cpp libvlist.cpp support.cpp base.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $< -o $@ $(LOADLIBES) $(LDLIBS)

xkas-asan : CXXFLAGS += -g -O0 -fsanitize=address
xkas-asan : xkas.cpp libstr.cpp libstr_math.cpp libstr_replace.cpp libstr_split.cpp libvlist.cpp support.cpp base.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $< -o $@ $(LOADLIBES) $(LDLIBS)
