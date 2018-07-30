PQ1_DIR ?= pq1
AGISTUDIO ?= AGIStudio

PATCHED_LOGIC = \
	logic.044.patched \
	logic.052.patched \
	logic.117.patched




PATCH_DIR = patches
BUILD_DIR = build
EPQ1_DIR = $(BUILD_DIR)/epq1
PQ1_BASE_DIR = $(BUILD_DIR)/pq1

all: $(EPQ1_DIR)

$(EPQ1_DIR): $(addprefix $(BUILD_DIR)/,$(PATCHED_LOGIC))
	rm -rf $@
	cp -r $(PQ1_DIR) $@
	rename 'y/A-Z/a-z/' $@/*
	$(foreach f,$^, \
		cat $(f) \
		| $(AGISTUDIO) \
			-dir $@ \
			-compile $(subst .,$(empty),$(suffix $(basename $(f)))) \
		&& $(AGISTUDIO) \
			-dir $@ \
			-rebuildvol \
		&& mv $@/vol.0.new $@/vol.0 \
		&& rm -rf $@/vol.1 \
		&& rm -rf $@/vol.2 \
		; \
	)

$(PQ1_BASE_DIR):
	rm -rf $(PQ1_BASE_DIR)
	mkdir -p $(PQ1_BASE_DIR)
	cp -r $(PQ1_DIR)/* $(PQ1_BASE_DIR)/
	rename 'y/A-Z/a-z/' $(PQ1_BASE_DIR)/*

$(BUILD_DIR)/logic.%.patched: $(BUILD_DIR)/logic.%.original $(PATCH_DIR)/logic.%.patch
	patch $(BUILD_DIR)/logic.$*.original --ed -i $(PATCH_DIR)/logic.$*.patch -o $@

$(BUILD_DIR)/logic.%.original: $(PQ1_BASE_DIR)
	mkdir -p $(BUILD_DIR)
	$(AGISTUDIO) -dir $(PQ1_BASE_DIR) -decode $* > $@.tmp
	mv $@.tmp $@

clean:
	rm -rf $(BUILD_DIR)
