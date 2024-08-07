.PHONY: build dev launch up

build:
	ddev npm run build
dev: up
	ddev npm run dev
launch: up
	ddev launch
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
		ddev start; \
	fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
