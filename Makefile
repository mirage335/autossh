MKDIR_P = mkdir -p
DESTDIR ?= ${HOME}/

all:

directories:
	${MKDIR_P} $(DESTDIR)core/net
	${MKDIR_P} $(DESTDIR)core/net/hacdcInternal
	chmod 700 $(DESTDIR)core/net/hacdcInternal
	
	${MKDIR_P} /lib/systemd/system

install: directories

	install -Dm600 hacdcInternal/* $(DESTDIR)core/net/hacdcInternal
	install -Dm700 autosshhacdc $(DESTDIR)core/net/
	
	install -Dm644 autosshhacdc.service /lib/systemd/system/
	