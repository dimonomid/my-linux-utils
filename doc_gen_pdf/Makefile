# Path to the documentation files (*.txt and *.rst), something like:
# <linux-source>/Documentation
DOC_SRC_PATH ?=

# Path for output pdf files
OUTPUT_PATH ?= ./output

ifneq ($(MAKECMDGOALS),clean)
# Make sure source path was provided
ifeq ($(DOC_SRC_PATH),)
  $(error Please provide DOC_SRC_PATH: a path to source doc files)
endif
endif

# Font and margins are optimized for my ebook reader (pocketbook pro 902),
ENSCRIPT_FLAGS = --font 'CourierNew-Bold11' --margins=10:10:10:80

ifeq ($(V),1)
  Q =
else
  Q = @
  ENSCRIPT_FLAGS += -q
endif

# Get txt and rst files
TXT_FILES = $(shell find $(DOC_SRC_PATH) -type f -name '*.txt')
RST_FILES = $(shell find $(DOC_SRC_PATH) -type f -name '*.rst')

PHONY += all clean

all: $(patsubst $(DOC_SRC_PATH)/%.txt,$(OUTPUT_PATH)/%.txt.pdf,$(TXT_FILES)) \
     $(patsubst $(DOC_SRC_PATH)/%.rst,$(OUTPUT_PATH)/%.rst.pdf,$(RST_FILES))

# Canned recipe for generation of plain pdf file.
# We could use just a simple command:
#
#   enscript $(ENSCRIPT_FLAGS) -p - $1 | ps2pdf - $2
#
# But the header in pdf file would include the whole absolute path to source
# file, which sucks: I'd like the path to be relative to $(DOC_SRC_PATH).
#
# Getting rid of the header ( --no-header flag to enscript ) is also bad: I like
# that header.
#
# So, we have to make this deliberate dance with absolutizing output file, then
# changing dir to $(DOC_SRC_PATH), then calling enscript for modified source
# path.
define gen_pdf_plain
	@echo "  GEN $(subst $(DOC_SRC_PATH)/,,$1) > $(subst $(OUTPUT_PATH)/,,$2)"
	$(Q) mkdir -p $(dir $2)
	$(Q) DST="$$(readlink -f $2)" && cd $(DOC_SRC_PATH) && \
    enscript $(ENSCRIPT_FLAGS) -p - $(subst $(DOC_SRC_PATH)/,,$1) | ps2pdf - $$DST
endef

$(OUTPUT_PATH)/%.txt.pdf: $(DOC_SRC_PATH)/%.txt
	$(call gen_pdf_plain,$<,$@)

$(OUTPUT_PATH)/%.rst.pdf: $(DOC_SRC_PATH)/%.rst
	$(call gen_pdf_plain,$<,$@)

clean:
	rm -rf $(OUTPUT_PATH)
