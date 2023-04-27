#!/usr/bin/env bash

docker run --rm -v $(pwd):/data bosa/writing_doc:latest concat --output README.md
