VERSION=0.2
all:
	./compiler.py
	@cd exo; for f in `find -name '*.list'` ; do echo "Copying $$f over"; cp $$f ../site/$$f ; done

dist-dir:
	rm -rf shutorial-$(VERSION) ; mkdir shutorial-$(VERSION)
	cp -r app compiler.py distros exo  Makefile  README.md requirements.txt etc\
              shutorial.sh shutorial-admin.sh shutorial-$(VERSION)
	$(MAKE) -C shutorial-$(VERSION) clean

dist-tgz: dist-dir
	tar cfvJ shutorial-$(VERSION).tar.xz shutorial-$(VERSION)
	rm -rf shutorial-$(VERSION)
	@echo; echo "Distribution built"


debian: dist-dir
	tar cfvJ shutorial_$(VERSION).orig.tar.xz shutorial-$(VERSION)
	cd shutorial-$(VERSION) ; cp -r distros/debian . ; dpkg-buildpackage -us -uc

arch-linux: dist-dir
	tar cfvJ shutorial-$(VERSION).tar.xz shutorial-$(VERSION)
	mv shutorial-$(VERSION).tar.xz shutorial-$(VERSION)/shutorial-$(VERSION).tar.xz
	cd shutorial-$(VERSION) ; cp -r distros/archlinux/* .; makepkg -g >> PKGBUILD; makepkg -si

install:
	mkdir -p $(DESTDIR)/usr/share/shutorial
	cp -r site/* $(DESTDIR)/usr/share/shutorial

	mkdir -p $(DESTDIR)/etc/schroot/chroot.d/
	cp etc/shutorial.conf $(DESTDIR)/etc/schroot/chroot.d/
	cp -r etc/shutorial $(DESTDIR)/etc/schroot/

	mkdir -p $(DESTDIR)/usr/bin
	cp shutorial.sh $(DESTDIR)/usr/bin/shutorial
	mkdir -p $(DESTDIR)/usr/sbin
	cp shutorial-admin.sh $(DESTDIR)/usr/sbin/shutorial-admin

install-arch:
	mkdir -p $(DESTDIR)/usr/share/shutorial
	cp -r site/* $(DESTDIR)/usr/share/shutorial

	mkdir -p $(DESTDIR)/etc/schroot/chroot.d/
	cp etc/shutorial.conf $(DESTDIR)/etc/schroot/chroot.d/
	cp -r etc/shutorial $(DESTDIR)/etc/schroot/

	mkdir -p $(DESTDIR)/usr/bin
	cp shutorial.sh $(DESTDIR)/usr/bin/shutorial
	# /usr/sbin is a symlink to /usr/bin on Arch
	cp shutorial-admin.sh $(DESTDIR)/usr/bin/shutorial-admin

	chmod +x $(DESTDIR)/usr/bin/shutorial
	chown root:root $(DESTDIR)/usr/bin/shutorial-admin
	chmod 700 $(DESTDIR)/usr/bin/shutorial-admin

clean:
	rm -rf site shutorial-$(VERSION) shutorial_$(VERSION)*
	find -name __pycache__ | xargs rm -rf
	find -name '*~' | xargs rm -rf

