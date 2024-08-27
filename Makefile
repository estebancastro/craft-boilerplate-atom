.PHONY: install up

install:
	@echo "applying patches..."
	cp -a craft-boilerplate/patches/config/. config
	cp -a craft-boilerplate/patches/ddev/. .ddev
	cp -a craft-boilerplate/patches/root/. ./

	@echo "setup craft env..."
	cp .env.example.dev .env
	ddev craft setup/app-id \
		$(filter-out $@,$(MAKECMDGOALS))
	ddev craft setup/security-key \
		$(filter-out $@,$(MAKECMDGOALS))

	@echo "installing craft plugins..."
	ddev composer require "nystudio107/craft-vite:^5.0.1" -W && ddev exec php craft plugin/install vite
	ddev composer require "nystudio107/craft-minify:^5.0.0" -W && ddev exec php craft plugin/install minify

	@echo "installing npm devDependencies..."
	ddev npm install --save-dev @types/node rimraf rollup-plugin-critical vite vite-plugin-compression vite-plugin-live-reload vite-plugin-favicon2 @vitejs/plugin-legacy regenerator-runtime terser tailwindcss autoprefixer postcss postcss-import

	@echo "cleaning project..."
	rm -rf craft-boilerplate .env.example.staging .env.example.production

	@echo "restart ddev..."
	ddev restart

	@echo "ready for takeoff 🚀"
up:
	if [ ! "$$(ddev describe | grep OK)" ]; then \
		ddev start; \
	fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
