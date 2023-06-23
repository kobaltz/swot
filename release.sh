#!/bin/bash
git pull
git submodule update --init --recursive

current_date=$(date +%Y%m%d)
file_path="swot.gemspec"
sed -i '' -E "s/(s\.version = \"[0-9\.]+\.)[0-9]{8}/\1$current_date/g" $file_path

git commit -am "Updated academic list - $current_date"
gem build swot.gemspec
