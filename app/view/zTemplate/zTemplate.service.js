angular.module('zTemplateRest', [ 'ngResource' ])
.factory('zTemplateRest', function($resource) {	

	var serviceRest = $resource(URL_API, null, 
	{
	});

	return {
	};
})
