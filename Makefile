VERSION ?= 3.0.2-0

DEVICE ?= marlin

ZIP_PREFIX ?= twrp-installer-pixel-

ZIP := $(ZIP_PREFIX)$(DEVICE)-$(VERSION).zip

EXCLUDE := Makefile README.md *.git* signzip

all: $(ZIP)

$(ZIP):
	@echo "Setting version to $(VERSION)"
	@echo "$(VERSION)" > VERSION
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@./signzip "$(ZIP)"
	@echo "Done."

clean:
	@rm -vf "$(ZIP_PREFIX)"*.zip VERSION
	@echo "Done."
