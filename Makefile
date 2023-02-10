setup:
	python3 -m venv ./venv

install: setup
	source ./venv/bin/activate; \
	pip install -r requirements.txt;

install-windows:
	./venv/Scripts/activate; \
	pip install -r requirements.txt;

run:
	source ./venv/bin/activate; \
	python main.py;