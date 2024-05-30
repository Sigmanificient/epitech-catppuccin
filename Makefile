.SUFFIXES:

SRC = style.scss
OUT = style.css

SFLAGS = -s compressed

$(OUT): $(SRC)
	$(eval tmp-file=$(shell mktemp -t XXXX.css))
	@ sass $(SFLAGS) $< $(tmp-file)
	@ cat $(tmp-file)                   \
		| python inject.py template.css \
			| tee $@

.PHONY: clean
clean:
	@ $(RM) $(OUT)

.PHONY: re
.NOTPARALLEL: re
re: clean $(OUT)
