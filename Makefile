# node versions
current = $(shell node -v)
wanted = $(shell cat .nvmrc)

# check if create-elm-app is in your $PATH
# and node version matches wanted version
check-requirements:
	@which elm-app 1>&/dev/null || echo please install create-elm-app
ifneq ($(current), $(wanted))
	@echo your node verion does not match the wanted one
	@echo 'your version:' $(current)
	@echo 'wanted version:' $(wanted)
	@false
endif

elm-stuff: elm-package.json tests/elm-package.json
	elm-app install -y

install: check-requirements elm-stuff

build: install 
	elm-app build

start: install
	elm-app start

test: install
	elm-app test

deploy: clean install build
	rsync -ravz ./build/* maexBox:/home/maex/projects/pomodoro.maex.me/

.PHONY: clean
clean:
	rm -Rf {build,elm-stuff,tests/elm-stuff}
