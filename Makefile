.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS_EN = $(shell find $(RESUME_DIR)/en -name '*.tex')
RESUME_SRCS_ES = $(shell find $(RESUME_DIR)/es -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, resume resume_es, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS_EN)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

resume_es.pdf: $(EXAMPLES_DIR)/resume_es.tex $(RESUME_SRCS_ES)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
