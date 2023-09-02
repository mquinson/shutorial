VERSION=0.2
all: dist

dist-dir:
	rm -rf shutorial-$(VERSION) ; mkdir shutorial-$(VERSION)
	cp -r app compiler.py distros exo  Makefile  README.md requirements.txt shutorial.conf shutorial.sh src shutorial-$(VERSION)
	$(MAKE) -C shutorial-$(VERSION) clean

dist-tgz: dist-dir
	tar cfvJ shutorial-$(VERSION).tar.xz shutorial-$(VERSION)
	rm -rf shutorial-$(VERSION)
	@echo; echo "Distribution built"


dist-deb: dist-dir
	tar cfvJ shutorial_$(VERSION).orig.tar.xz shutorial-$(VERSION)
	cd shutorial-$(VERSION) ; cp -r distros/debian . ; dpkg-buildpackage -us -uc

clean:
	rm -rf shutorial-$(VERSION) shutorial_$(VERSION)*
	find -name __pycache__ | xargs rm -rf
	find -name '*~' | xargs rm -rf

