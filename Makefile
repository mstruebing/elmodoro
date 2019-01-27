# node versions
current = $(shell node -v)
wanted = $(shell cat .nvmrc)

git_branch = $(shell git rev-parse --abbrev-ref HEAD)

# check if create-elm-app is in your $PATH
# and node version matches wanted version
check-requirements:
ifneq ($(current), $(wanted))
	@echo your node verion does not match the wanted one
	@echo 'your version:' $(current)
	@echo 'wanted version:' $(wanted)
	@false
endif
	@which elm-app >/dev/null || echo please create-elm-app

.PHONY: build
build:
	elm-app build

start:
	elm-app start

test:
	elm-app test

deploy: clean build test
ifneq ($(git_branch),master)
	@echo You are not on the master branch.
	@echo please check out the master and try to deploy again
	@false
endif
	rsync -ravz ./build/* maexBox:/home/maex/projects/pomodoro.maex.me/

.PHONY: clean
clean:
	rm -Rf {build,elm-stuff,tests/elm-stuff}
