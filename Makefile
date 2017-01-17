# Makefile for cqfd

PREFIX?=/usr/local

.PHONY: all help doc install uninstall test tests check clean

all:	help

help:
	@echo "Available make targets:"
	@echo "   help:      This help message"
	@echo "   doc:       Generate documentation"
	@echo "   install:   Install script, doc and resources"
	@echo "   uninstall: Remove script, doc and resources"
	@echo "   tests:     Run functional tests"
	@echo "   clean:     Clean temporary files"

doc: cqfd.1.gz cqfdrc.5.gz

install: cqfd.1.gz cqfdrc.5.gz
	install -d $(DESTDIR)$(PREFIX)/bin/
	install -m 0755 cqfd $(DESTDIR)$(PREFIX)/bin/
	install -d $(DESTDIR)$(PREFIX)/share/doc/cqfd/
	install -d $(DESTDIR)$(PREFIX)/share/man/man1/
	install -m 644 cqfd.1.gz $(DESTDIR)$(PREFIX)/share/man/man1/
	install -d $(DESTDIR)$(PREFIX)/share/man/man5/
	install -m 644 cqfdrc.5.gz $(DESTDIR)$(PREFIX)/share/man/man5/
	install -d $(DESTDIR)$(PREFIX)/share/cqfd/samples/
	install -m 0644 samples/* $(DESTDIR)$(PREFIX)/share/cqfd/samples/
	completionsdir=$${COMPLETIONSDIR:-$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                                                --define-variable=datadir=$(PREFIX)/share \
	                                                --variable=completionsdir \
	                                                bash-completion)}; \
	if [ -n "$$completionsdir" ]; then \
		install -d $(DESTDIR)$$completionsdir/; \
		install -m 644 bash-completion $(DESTDIR)$$completionsdir/cqfd; \
	fi

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/bin/cqfd \
		$(DESTDIR)$(PREFIX)/share/man/man1/cqfd.1.gz \
		$(DESTDIR)$(PREFIX)/share/man/man5/cqfdrc.5.gz \
		$(DESTDIR)$(PREFIX)/share/doc/cqfd \
		$(DESTDIR)$(PREFIX)/share/cqfd
	completionsdir=$${COMPLETIONSDIR:-$$(pkg-config --define-variable=prefix=$(PREFIX) \
	                                                --define-variable=datadir=$(PREFIX)/share \
	                                                --variable=completionsdir \
	                                                bash-completion)}; \
	if [ -n "$$completionsdir" ]; then \
		rm -rf $(DESTDIR)$$completionsdir/cqfd; \
	fi

user-install user-uninstall:
user-%:
	$(MAKE) $* PREFIX=$$HOME/.local

test tests:
	@$(MAKE) -C tests GIT_DIR=$(CURDIR)/.git

check:
	shellcheck cqfd
	@$(MAKE) -C tests check

clean:
	rm -f cqfd.1.gz cqfdrc.5.gz

%.1: %.1.adoc
	asciidoctor -b manpage -o $@ $<

%.5: %.5.adoc
	asciidoctor -b manpage -o $@ $<

%.gz: %
	gzip -c $^ >$@
