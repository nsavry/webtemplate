#!/bin/sh

if [ -z "$1" ]
then
	echo "Error: Missing view name"
else
	mkdir ./app/view/$1
	zTemplate="./app/view/zTemplate/zTemplate"
	feature="./app/view/$1/$1"
	
	cat $zTemplate.controller.js | sed "s/zTemplate/$1/g" > $feature.controller.js
	cat $zTemplate.service.js | sed "s/zTemplate/$1/g" > $feature.service.js
	cat $zTemplate.html | sed "s/zTemplate/$1/g" > $feature.html
	cat $zTemplate.css | sed "s/zTemplate/$1/g" > $feature.css

	cat ./app/index.html | sed "s/<!-- controller\/service -->/<!-- controller\/service -->\n\t\t<script type=\"text\/javascript\" src=\"view\/$1\/$1\.controller\.js\"><\/script>\n\t\t<script type=\"text\/javascript\" src=\"view\/$1\/$1\.service\.js\"><\/script>\n/g" > ./app/index.html
	cat ./app/js/module.js | sed "s/var mainModule \= angular\.module('mainModule', \[/var mainModule \= angular\.module('mainModule', \[\n\t'$1Rest',/g" > ./app/js/module.js
	cat ./app/js/config.js | sed "s/\t\$stateProvider/\t\$stateProvider\n\t\.state('$1', {\n\t\turl: '\/$1',\n\t\ttemplateUrl: 'view\/$1\/$1.html'\n\t})/g" > ./app/js/config.js

	echo -e "the following lines were add in your index.html, make sure that were present"
	echo -e "\t<script type=\"text/javascript\" src=\"view/$1/$1.controller.js\"></script>"
	echo -e "\t<script type=\"text/javascript\" src=\"view/$1/$1.service.js\"></script>"

	echo -e "\nthe following lines were add in your js/module.js, make sure that were present"
	echo -e "\t'$1',"

	echo -e "\nthe following lines were add in your js/config.js, make sure that were present"
	echo -e "\t.state('$1', {"
	echo -e "\t\turl: '/$1',"
	echo -e "\t\ttemplateUrl: 'view/$1/$1.html'"
	echo -e "\t})"
fi
