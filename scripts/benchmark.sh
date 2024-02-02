#!/bin/env bash

sudo apt-get install -y hyperfine

printf "\n\nnvim startup time thingy:\n"
hyperfine "nvim --headless +qa" --warmup 10 || true

echo "------------------------"

echo "nvim no config startup time thingy:"
hyperfine "nvim -u NONE --headless +qa" --warmup 10 || true

