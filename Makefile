.PHONY: build run build-tagger build-tray lint

LDFLAGS := -ldflags="$(shell . ./packaging/release-env.sh && printf '%s' "$$LDFLAGS")"

build:
	go build $(LDFLAGS) ./cmd/monbooru

run:
	go run $(LDFLAGS) ./cmd/monbooru

build-tagger:
	go build -tags tagger $(LDFLAGS) ./cmd/monbooru

build-tray:
	go build -tags tray $(LDFLAGS) ./cmd/monbooru

lint:
	golangci-lint run
