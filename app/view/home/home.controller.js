mainModule.controller('homeCtrl', function($scope, homeRest) {
	$scope.getData = function() {
		$scope.load = true;
		$scope.load = false;
	}

	$scope.doRefresh = function() {
		$scope.getData();
	}

	$scope.getData();
});
