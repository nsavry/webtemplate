#!/bin/sh

if [ -z "$1" ]
then
	echo "Error: Missing feature name"
else
	mkdir ./app/view/$1
	zTemplate="./app/view/zTemplate/zTemplate"
	feature="./app/view/$1/$1"
	cat $zTemplate.controller.js | sed "s/zTemplate/$1/g" > $feature.controller.js
	cat $zTemplate.service.js | sed "s/zTemplate/$1/g" > $feature.service.js
	cat $zTemplate.html | sed "s/zTemplate/$1/g" > $feature.html
	cat $zTemplate.css | sed "s/zTemplate/$1/g" > $feature.css
	echo -e "don't forget to add controller/service dependencies in your index.html"
	echo -e "\t<script type=\"text/javascript\" src=\"view/$1/$1.controller.js\"></script>"
	echo -e "\t<script type=\"text/javascript\" src=\"view/$1/$1.service.js\"></script>"
	echo -e "\ndon't forget to add service dependencies in js/module.js"
	echo -e "\t'$1',"
	echo -e "\ndon't forget to add routing dependencies in js/config.js"
	echo -e "\t.state('$1', {"
	echo -e "\t\turl: '/$1',"
	echo -e "\t\ttemplateUrl: 'view/$1/$1.html'"
	echo -e "\t})"
fi
