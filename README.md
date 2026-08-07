# debian-pywebdriver

Package PyWebDriver for Debian 13 (Trixie)

- <https://github.com/pywebdriver/pywebdriver.git>
- <https://github.com/pywebdriver/py-xml-escpos>
- <https://github.com/akretion/pypostelium>
- <https://github.com/python-escpos/python-escpos>

Local build

```sh
docker build -t pywebdriver-builder .github/build
docker run --rm --user (id -u):(id -g) -v .:/build pywebdriver-builder make
```

Local test

```sh
docker run --rm -it -v ./pkg:/pkg -w /pkg -p 8069:8069 debian:trixie-slim bash
# apt update && apt install -y --no-install-recommends ./pywebdriver_*.deb
# sed -i 's+^;*\(host=\).*+\10.0.0.0+' /etc/pywebdriver/config.ini && pywebdriverd
```
