(function () {
	'use strict';
	// module de recherhe
	angular.module('searchEngine', [
		'ngAnimate', 
		'ngTouch', 
		'ngSanitize', 
		'ngResource',
		'angucomplete-alt'
	]);

})();

(function () {

  	function searchController($http, $location) {

	    var model = this;

	    model.aides = [];
	    model.etiquettes = [];

	    model.isSomethingLoading = true;
	    model.method = 'GET';
	    model.aides.url = $location.absUrl() + 'wp-json/wp/v2/aide?per_page=100&filter[orderby]=rand';
	    model.etiquettes.url = $location.absUrl() + 'wp-json/wp/v2/tags?per_page=100';
	    model.loading = true;

	    $http({method: model.method, url: model.aides.url}).
	        then(function(response) {
	          model.aides.status = response.status;
	          model.aides.data = response.data;
	          model.aides.isSomethingLoading = false;
	        }, function(response) {
	          model.aides.data = response.data || 'Request failed';
	          model.aides.status = response.status;
	    });

	    $http({method: model.method, url: model.etiquettes.url}).
	        then(function(response) {
	          model.etiquettes.status = response.status;
	          model.etiquettes.data = response.data;
	          model.etiquettes.isSomethingLoading = false;
	        }, function(response) {
	          model.etiquettes.data = response.data || 'Request failed';
	          model.etiquettes.status = response.status;
	    });


	}


	searchController.$inject = ['$http', '$location'];

	angular
		.module('searchEngine')
  		.controller('searchController', searchController);

})();
