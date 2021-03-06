# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers
#= require_tree ./services

# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', [])

# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post/'
  $routeProvider
    .when('/post/new', { templateUrl: '../assets/CreatePost.html', controller: 'CreatePostCtrl' } )
    .when('/post/:postId', { templateUrl: '../assets/Post.html', controller: 'PostCtrl' } )
    .when('/post/:postId/delete', { controller: 'DeletePostCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/Index.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])