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
	    model.thematiques = [];
	    model.profils = [];

	    model.isSomethingLoading = true;
	    model.method = 'GET';
	    model.aides.url = $location.absUrl() + 'wp-json/wp/v2/aide?per_page=100&filter[orderby]=rand';
	    model.etiquettes.url = $location.absUrl() + 'wp-json/wp/v2/tags?per_page=100';
	    model.thematiques.url = $location.absUrl() + 'wp-json/wp/v2/thematique?per_page=100';
	    model.profils.url = $location.absUrl() + 'wp-json/wp/v2/profil?per_page=100';
	    model.loading = true;

	    model.getClass = getClass;
	    model.Filter = Filter;

	   	function getClass(object) {
	   		var slugs = [];

			for (var i = 0; i < object.length; i++) {
			    // expecting string array
			    var slug = object[i].slug;
			    slugs.push(slug);
			}

			return slugs;
	   	}

	   	function Filter(value) {
	   		return $emit('iso-option', {
	   			filter: '.'+ value
	   			}
	   		);
	   	}

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

	    $http({method: model.method, url: model.thematiques.url}).
	        then(function(response) {
	          model.thematiques.status = response.status;
	          model.thematiques.data = response.data;
	          model.thematiques.isSomethingLoading = false;
	        }, function(response) {
	          model.thematiques.data = response.data || 'Request failed';
	          model.thematiques.status = response.status;
	    });

	    $http({method: model.method, url: model.profils.url}).
	        then(function(response) {
	          model.profils.status = response.status;
	          model.profils.data = response.data;
	          model.profils.isSomethingLoading = false;
	        }, function(response) {
	          model.profils.data = response.data || 'Request failed';
	          model.profils.status = response.status;
	    });


	}


	searchController.$inject = ['$http', '$location'];

	angular
		.module('searchEngine')
  		.controller('searchController', searchController);

})();
