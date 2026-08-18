# debian-pywebdriver

Package PyWebDriver for Debian 13 (Trixie)

- <https://github.com/pywebdriver/pywebdriver.git> (patched to prevent crash on missing usb device and support jpeg receipt with odoo v13+)
- <https://github.com/pywebdriver/py-xml-escpos> (patched for python3 compatibility)
- <https://github.com/akretion/pypostelium>
- <https://github.com/python-escpos/python-escpos>

Local build

```sh
docker build -t pywebdriver-builder .github/build
docker run --rm --user (id -u):(id -g) -v .:/build pywebdriver-builder
```

Local test

```sh
docker run --rm -it -v ./pkg:/pkg -w /pkg -p 8069:8069 debian:trixie-slim bash
# apt update && apt install -y --no-install-recommends ./pywebdriver_*.deb usbutils
# python3 -m xmlescpos.test_capture
# python3 -m pywebdriver.plugins.escpos_driver_test
# sed -i 's+^;*\(host=\).*+\10.0.0.0+' /etc/pywebdriver/config.ini && pywebdriverd
```
