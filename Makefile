# Makefiles for the user
INSTALL = make -f install.mk
MAINTENANCE = make -f maint.mk

# Makefiles for testing
ARCHLINUX = make -f test-archlinux.mk

install:
				$(INSTALL) install

backup:
				$(MAINTENANCE) backup

backup-dry:
						$(MAINTENANCE) backup-dry

test-archlinux:
								$(ARCHLINUX) all
