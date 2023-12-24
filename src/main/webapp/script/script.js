var app = angular.module('blog', ['ngRoute']);

app.config(function($routeProvider,$locationProvider) {
			$routeProvider
			.when("/about", {
				templateUrl : "Templates/about.html"
			})
			.when("/contact", {
				templateUrl : "Templates/contact.html"
			})
		});
