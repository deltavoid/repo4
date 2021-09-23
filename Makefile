

BUILD_DIR ?= build
.PHONY: build clean
# default: run


WORK_DIR:=$(CURDIR)/..
REPO1_DIR:=$(WORK_DIR)/repo1
REPO2_DIR:=$(WORK_DIR)/repo2
REPO3_DIR:=$(WORK_DIR)/repo3


build: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make

install: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make install

$(BUILD_DIR)/Makefile: Makefile
	mkdir -p $(BUILD_DIR) \
	&& cmake -S . -B $(BUILD_DIR) 
#		-DCMAKE_PREFIX_PATH="$(REPO3_DIR)/build" 
#		-DCMAKE_PREFIX_PATH="$(REPO1_DIR)/build;$(REPO2_DIR)/build;$(REPO3_DIR)/build" 

clean:	
	rm -rf $(BUILD_DIR)

uninstall:
	-rm -rf /usr/local/lib/repo4
	-rm -rf /usr/local/lib/cmake/repo4
	-rm -rf /usr/local/include/repo4


run: build
	$(BUILD_DIR)/binary4/binary4
