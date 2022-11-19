all: build

clean:

build:

install:
	mkdir --parents $(DESTDIR)/usr/bin/
	
	cp $(CURDIR)/silica-strap $(DESTDIR)/usr/bin/
	
	chown root:root $(DESTDIR)/usr/bin/silica-strap
	
	chmod 0755 $(DESTDIR)/usr/bin/silica-strap
	
	mkdir --parents $(DESTDIR)/usr/share/silica-strap/
	
	cp $(CURDIR)/functions $(DESTDIR)/usr/share/silica-strap/
	
	cp $(CURDIR)/releases $(DESTDIR)/usr/share/silica-strap/
	
	mkdir --parents $(DESTDIR)/var/cache/silica-strap/

uninstall:
	rm $(DESTDIR)/usr/bin/silica-strap
	
	rm --recursive $(DESTDIR)/usr/share/silica-strap/
	
	rm --recursive $(DESTDIR)/var/cache/silica-strap/

