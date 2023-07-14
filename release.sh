#!/bin/bash
git pull
rm -rf academic_data
git submodule update --init --recursive
cp -R data/lib/domains academic_data
current_date=$(date +%Y%m%d)
file_path="swot.gemspec"
sed -i '' -E "s/(s\.version = \"[0-9\.]+\.)[0-9]{8}/\1$current_date/g" $file_path

version_number=$(grep -o -E "s\.version = \"[0-9\.]+$current_date\"" $file_path | grep -o -E "[0-9\.]+$current_date")

git add -A .
git commit -m "Updated academic list - $current_date"
git push
gem build swot.gemspec

gem push swot-ruby-$version_number.gem
