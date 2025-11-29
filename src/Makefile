all:
	python3 compiler.py
	@cd exo; for f in `find -name '*.list'` ; do echo "Copying $$f over"; cp $$f ../site/$$f ; done

docker: all
	rm -rf dockersite && cp -r site dockersite	
	for f in `find dockersite -name '*setup.sh'`; do echo "Changing location of shtrl-check in $$f"; sed -i 's|usr/lib/shutorial/bin|shutorial/bin|' $$f; chmod +rx $$f; done
	cp shutorial.sh dockersite/
	docker build -t mquinson/shutorial -f Dockerfile dockersite
	rm -rf dockersite

clean:
	rm -rf site shutorial-$(VERSION) shutorial_$(VERSION)*
	find -name __pycache__ | xargs rm -rf
	find -name '*~' | xargs rm -rf
	rm -f shutorial
	rm -f usr
