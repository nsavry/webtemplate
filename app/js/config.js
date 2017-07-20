mainModule.config(function($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.otherwise('/zTemplate');

	$stateProvider
	.state('zTemplate', {
		url: '/zTemplate',
		templateUrl: 'view/zTemplate/zTemplate.html'
	});
});