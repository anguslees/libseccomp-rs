# SPDX-License-Identifier: Apache-2.0 or MIT
#
# Copyright 2021 Sony Group Corporation
#

all: build fmt test

#
# Build
#

.PHONY: debug
debug:
	RUSTFLAGS="--deny warnings" cargo build

.PHONY: release
release:
	cargo build --release

.PHONY: build
build:
	cargo build

#
# Tests and linters
#

.PHONY: test
test:
	cargo test -- --color always --nocapture --test-threads 1

.PHONY: check
check: fmt clippy

.PHONY: fmt
fmt:
	cargo fmt --all -- --check

.PHONY: clippy
clippy:
	cargo clippy --all-targets --all-features -- -D warnings

#
# Clean
#

.PHONY: clean
clean:
	rm -rf ./target
