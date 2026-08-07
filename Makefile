PYWEBDRIVER      ?= v3.0.22
PYESCPOS         ?= 3.1
PYXMLESCPOS      ?= 0.1.0
PYPOSTELIUM      ?= 0.0.5
PYPOSTELIUM_HASH  = fddcc5ff84b12fcc88bb8c13049fe73702f7a0fb

DEPS  = src/pyxmlescpos-$(PYXMLESCPOS).dist-info
DEPS += src/pypostelium-$(PYPOSTELIUM).dist-info
DEPS += src/python_escpos-$(PYESCPOS).dist-info

PIPINST = python3 -m pip install --no-deps --upgrade --break-system-packages --target src/

build: $(DEPS)
	mkdir -p src/debian pkg
	cp -r debian/* src/debian/
	rm -f src/debian/compat
	dpkg-buildpackage \
	  --build=binary \
	  --unsigned-changes \
	  --unsigned-source \
	  -- src
	mv pywebdriver_* pkg/

src:
	rm -rf src/
	git clone \
	  --depth 1 \
	  --branch $(PYWEBDRIVER) \
	  https://github.com/pywebdriver/pywebdriver.git src

src/pyxmlescpos-$(PYXMLESCPOS).dist-info: src
	$(PIPINST) git+https://github.com/pywebdriver/py-xml-escpos@tags/$(PYXMLESCPOS)

src/pypostelium-$(PYPOSTELIUM).dist-info: src
	$(PIPINST) git+https://github.com/akretion/pypostelium.git@$(PYPOSTELIUM_HASH)

src/python_escpos-$(PYESCPOS).dist-info: src
	$(PIPINST) git+https://github.com/python-escpos/python-escpos@tags/v$(PYESCPOS)
