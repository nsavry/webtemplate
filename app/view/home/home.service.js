angular.module('homeRest', [ 'ngResource' ])
.factory('homeRest', function($resource) {	

	var serviceRest = $resource(URL_API, null, 
	{
	});

	return {
	};
})
