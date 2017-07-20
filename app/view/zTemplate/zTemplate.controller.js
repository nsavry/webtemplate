mainModule.controller('zTemplateCtrl', function($scope, zTemplateRest) {
	$scope.getData = function() {
		$scope.load = true;
		$scope.load = false;
	}

	$scope.doRefresh = function() {
		$scope.getData();
	}

	$scope.getData();
});
