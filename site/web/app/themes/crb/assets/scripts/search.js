(function () {
	'use strict';
	// module de recherhe
	angular.module('searchEngine', [
		'ngAnimate', 
		'ngTouch', 
		'ngSanitize',
		'ngResource',
		'angucomplete-alt',
		'checklist-model'
	]);

})();

(function () {

  	function searchController(dataSrv) {

	    var model = this;
	    model.aides;
	    model.etiquettes;
	    model.thematiques;
	    model.profils;
	    model.message;
	    model.search = {};

	    getAides();
	    getEtiquettes();
	    getProfils();
	    getThematiques();

	    function getClass(object) {
	   		var slugs = [];

			for (var i = 0; i < object.length; i++) {
			    // expecting string array
			    var slug = object[i].slug;
			    slugs.push(slug);
			}

			return slugs;
	   	}

	    function getAides() {
	    	dataSrv.data('aide')
	    		.success(function(data) {
	    			model.aides = data;
	    		})
	    		.error(function(error) {
	    			model.message.aides = error.message;
	    		});
	    }

	    function getEtiquettes() {
	    	dataSrv.data('tags')
	    		.success(function(data) {
	    			model.etiquettes = data;
	    		})
	    		.error(function(error) {
	    			model.message.etiquettes = error.message;
	    		});
	    }

	    function getProfils() {
	    	dataSrv.data('profil')
	    		.success(function(data) {
	    			model.profils = data;
	    		})
	    		.error(function(error) {
	    			model.message.profils = error.message;
	    		});
	    }

	    function getThematiques() {
	    	dataSrv.data('thematique')
	    		.success(function(data) {
	    			model.thematiques = data;
	    		})
	    		.error(function(error) {
	    			model.message.thematiques = error.message;
	    		});
	    }
	   
	    model.loading = true;
	    model.getClass = getClass;

	}

	function dataSrv($http, $location) {

		var urlBase = $location.absUrl() + 'wp-json/wp/v2/';
		var page = 100;

		this.data = function (type) {
			return $http.get(urlBase + type + '?per_page=' + page);
		}
	}

	function arrayFilter($filter) {
		
		var comparator = function (actual, expected) {
	        if (angular.isUndefined(actual)) {
	          // No substring matching against `undefined`
	          return false;
	        }
	        
	        if ((actual === null) || (expected === null)) {
	          // No substring matching against `null`; only match against `null`
	          return actual === expected;
	        }
	        
	        if ((angular.isObject(expected) && !angular.isArray(expected)) || (angular.isObject(actual) && !hasCustomToString(actual))) {
	          // Should not compare primitives against objects, unless they have custom `toString` method
	          return false;
	        }

	        actual = angular.lowercase('' + actual);
	        
	        if (angular.isArray(expected)) {

	        	if (expected.length === 0) {

	        		return true;

	        	} else {
	          
	          	var match = false;
	          
		        expected.forEach(function (e) {
		            e = angular.lowercase('' + e);
		            if (angular.equals(e, actual)) {
		              match = true;
		            }
		        });
	          
	          	return match;

	          	}

	        } else {
	          
	          expected = angular.lowercase('' + expected);
	          return actual.indexOf(expected) !== -1;

	        }
	    };
      
      	return function (campaigns, filters) {

        	return $filter('filter')(campaigns, filters, comparator);

      	};
	}

	searchController.$inject = ['dataSrv'];
	dataSrv.$inject = ['$http', '$location'];
	arrayFilter.$inject = ['$filter'];

	angular
		.module('searchEngine')
		.service('dataSrv', dataSrv)
		.filter('arrayFilter', arrayFilter)
  		.controller('searchController', searchController);

})();
