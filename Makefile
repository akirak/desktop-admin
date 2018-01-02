INSTALL = bash ./install.bash

# Makefiles for the user
MAINTENANCE = make -f maint.mk

# Makefiles for testing
ARCHLINUX = make -f test-archlinux.mk
TEST_EMACS = docker build -f test-emacs.dockerfile .

install:
				$(INSTALL) $(INSTALL_ARGS)

backup:
				$(MAINTENANCE) backup

backup-dry:
						$(MAINTENANCE) backup-dry

archlinux:
		$(ARCHLINUX)

archlinux-full:
		$(ARCHLINUX) full

test-emacs:
		$(TEST_EMACS)
