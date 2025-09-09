SHELL := /bin/bash

VIVADO_PRJ_DIR=prj
VIVADO_PRJ_NAME=$(VIVADO_PRJ_DIR)
VIVADO_PRJ_PATH=$(VIVADO_PRJ_DIR)/$(VIVADO_PRJ_NAME).xpr
VIVADO_CHECKPOINT_PATH=$(VIVADO_PRJ_DIR)/$(VIVADO_PRJ_NAME)_checkpoint.dcp

VIVADO_CMD=vivado -mode batch -source

SRC_PATH=src
OUT_DIR=out


$(VIVADO_PRJ_PATH):  
	mkdir -p $(VIVADO_PRJ_DIR)
	$(VIVADO_CMD) setup.tcl -tclargs $(VIVADO_PRJ_DIR) $(VIVADO_PRJ_NAME)

setup: $(VIVADO_PRJ_PATH) 

$(VIVADO_CHECKPOINT_PATH): $(VIVADO_PRJ_PATH) $(wildcard $(SRC_PATH)/*.xdc) $(wildcard $(SRC_PATH)/*.v)
	$(VIVADO_CMD) build.tcl -tclargs $(VIVADO_PRJ_PATH) $(SRC_PATH) $(VIVADO_CHECKPOINT_PATH)

build: $(VIVADO_CHECKPOINT_PATH)

$(OUT_DIR)/$(VIVADO_PRJ_NAME).bit: $(VIVADO_CHECKPOINT_PATH) 
	mkdir -p $(OUT_DIR)
	$(VIVADO_CMD) gen.tcl -tclargs $(VIVADO_CHECKPOINT_PATH) $(OUT_DIR)

gen: $(OUT_DIR)/$(VIVADO_PRJ_NAME).bit

all: setup bulid gen

clean: 
	rm -rf $(VIVADO_PRJ_DIR)
	rm -rf $(OUT_DIR)
	rm -f vivado*{log,jou}
	rm -f webtalk*{log,jou}
	rm -f usage_statistics_webtalk*{html,xml}
	
