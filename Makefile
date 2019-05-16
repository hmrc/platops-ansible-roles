help:	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean:	## delete virtual environment
	rm -fr .venv

setup:	## python virtual environment
	python3 -m venv .venv
	VIRTUAL_ENV_DISABLE_PROMPT=true source .venv/bin/activate;\
	pip install --upgrade pip;\
	pip install -r requirements.txt

test:	## Test ansible role with molecule
	VIRTUAL_ENV_DISABLE_PROMPT=true source ./.venv/bin/activate;\
	cd scaladev && molecule test; cd ..
