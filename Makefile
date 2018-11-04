test:
	NODE_ENV=development NODOS_ENV=test DEBUG=nodos npx jest

setup: install bootstrap build

install:
	yarn

bootstrap:
	npx lerna bootstrap

publish:
	npx lerna publish

build:
	NODE_ENV=production npx lerna exec --parallel -- babel src -d dist

lint:
	npx eslint .

lint-fix:
	npx eslint . --fix

lint-ci:
	npx eslint --ignore-pattern app --ignore-pattern example .

what-to-do:
	git grep FIXME

compose-update:
	docker-compose run app yarn update

compose-setup:
	docker-compose run app yarn install

compose:
	docker-compose up

compose-test:
	docker-compose run app make test

compose-server:
	docker-compose run app make server

compose-bash:
	docker-compose run app bash
