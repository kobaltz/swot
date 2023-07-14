#!/bin/bash
git pull
git submodule update --init --recursive
rm -rf academic_data
cp -R data academic_data
rm -rf academic_data/.git
current_date=$(date +%Y%m%d)
file_path="swot.gemspec"
sed -i '' -E "s/(s\.version = \"[0-9\.]+\.)[0-9]{8}/\1$current_date/g" $file_path

version_number=$(grep -o -E "s\.version = \"[0-9\.]+$current_date\"" $file_path | grep -o -E "[0-9\.]+$current_date")

git add -A .
git commit -m "Updated academic list - $current_date"
git push
gem build swot.gemspec

gem push swot-ruby-$version_number.gem
