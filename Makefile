help:   ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

test:		## Test ansible role with molecule
	VIRTUAL_ENV_DISABLE_PROMPT=true source ./.venv/bin/activate;\
	cd scaladev && molecule test; cd ..
