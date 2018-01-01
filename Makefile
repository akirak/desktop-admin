INSTALL = bash ./install.bash

# Makefiles for the user
MAINTENANCE = make -f maint.mk

# Makefiles for testing
ARCHLINUX = make -f test-archlinux.mk

install:
				$(INSTALL) $(INSTALL_ARGS)

backup:
				$(MAINTENANCE) backup

backup-dry:
						$(MAINTENANCE) backup-dry

test-archlinux:
		$(ARCHLINUX)

archlinux-full:
		$(ARCHLINUX) full
