---
to: __backstop__/visual_regression_test.sh
sh: "cd <%= cwd %> && chmod +x __backstop__/visual_regression_test.sh && head -n 1"
---
#!/bin/sh

echo "GENERATING REFERENCES FROM PRODUCTION"

backstop reference

echo "\n\nTESTING USING BACKSTOP"

backstop test

echo "\n\nUPLOADING DIFFS FOR GITHUB"

aws s3 cp --region eu-west-1 --recursive backstop_data/bitmaps_test s3://uswitch-assets-eu/<%= app %>/backstop_data/bitmap_test --acl=public-read | grep -oh "s3://.*" > test.txt

aws s3 cp --region eu-west-1 test.txt s3://uswitch-assets-eu/<%= app %>/backstopjs-test-links.txt --acl public-read
