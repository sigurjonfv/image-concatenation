#!/bin/bash

mkdir resized
# To convert all files starting with IMG to a jpg with a maximum dimension 3000
# Using ${1%%.*} instead of $1 will result in img2245 rather than img2245.jpg
ls -1 IMG* | xargs -n1 sh -c 'gm convert -size 3000 $1 -resize 3000 resized/${1%%.*}.jpg' sh

cd resized

mkdir concatenated
# To concatenate every two images
# Use -auto-orient so that it does not go to the original orientation but uses your modifications in finder or preview
ls -1 IMG* | xargs -n2 sh -c 'gm convert -auto-orient $1 $2 +append concatenated/${1%%.*}_and_${2%%.*}.jpg' sh

mv concatenated ..
