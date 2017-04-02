'use strict';

(() => {
    angular
        .module('app')
        .controller('header-controller', header_controller);

    header_controller.$inject = ['$scope', '$location', '$routeParams', '$rootScope', 'ProfileService'];

    function header_controller($scope, $location, $routeParams, $rootScope, ProfileService) {
    /*
        $scope.info = 1
        $scope.profile = {}
        $scope.user_upcoming_events = {}
        $scope.user_past_events = {}
    */
        ProfileService
        .get_profile()
            .then((data) => {
            if (data[0].length != 0) {
                $scope.profile = data[0][0];
            }
        });

        ProfileService
            .get_user_upcoming_events()
            .then((data) => {
            if (data[0].length != 0) {
                $scope.user_upcoming_events = data[0];
            }
        });

        ProfileService
            .get_user_past_events()
            .then((data) => {
            if (data[0].length != 0) {
                $scope.user_past_events = data[0];
            }
        });

        $scope.view_profile = () => {
            window.location.href="#!/profile/";
        }


        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }
    }
})();
