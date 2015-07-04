CMAKE_INSTALL_PREFIX=/opt/boxen/homebrew
CMAKE_ROOT=$(CMAKE_INSTALL_PREFIX)/share/cmake

lib: build/Makefile
	cd build && make

test: lib
	cd build && make && ./test_pointing

build/Makefile:
	@mkdir -p build
	cd build && \
	  cmake -DCMAKE_INSTALL_PREFIX=$(CMAKE_INSTALL_PREFIX) \
	        -DOPTIONAL_CMAKE_ROOT=$(CMAKE_ROOT) \
	        -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..

clean:
	rm -fr build
