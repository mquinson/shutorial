VERSION=0.2
all: dist

dist-dir:
	rm -rf shutorial-$(VERSION) ; mkdir shutorial-$(VERSION)
	cp -r app compiler.py distros exo  Makefile  README.md requirements.txt shutorial.conf\
              shutorial.sh shutorial-admin.sh src shutorial-$(VERSION)
	$(MAKE) -C shutorial-$(VERSION) clean

dist-tgz: dist-dir
	tar cfvJ shutorial-$(VERSION).tar.xz shutorial-$(VERSION)
	rm -rf shutorial-$(VERSION)
	@echo; echo "Distribution built"


debian: dist-dir
	tar cfvJ shutorial_$(VERSION).orig.tar.xz shutorial-$(VERSION)
	cd shutorial-$(VERSION) ; cp -r distros/debian . ; dpkg-buildpackage -us -uc

install:
	mkdir -p $(DESTDIR)/usr/share/shutorial
	cp -r site $(DESTDIR)/usr/share/shutorial

	mkdir -p $(DESTDIR)/etc/schroot/chroot.d/
	cp shutorial.conf $(DESTDIR)/etc/schroot/chroot.d/

	mkdir -p $(DESTDIR)/usr/bin
	cp shutorial.sh $(DESTDIR)/usr/bin/shutorial
	mkdir -p $(DESTDIR)/usr/sbin
	cp shutorial-admin.sh $(DESTDIR)/usr/sbin/shutorial-admin

clean:
	rm -rf shutorial-$(VERSION) shutorial_$(VERSION)*
	find -name __pycache__ | xargs rm -rf
	find -name '*~' | xargs rm -rf

