'use strict';

(() => {
    angular
        .module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $window, $location, MatchService) {

        $scope.view_profile = () => {
            window.location.href="#!/profile";
            $window.location.reload();
        }
        $scope.view_user = () => {
            window.location.href="#!/user";
            $window.location.reload();
        }

        $scope.logout = () => {
            window.location.href="#!/";
            $window.location.reload();
        }
        
        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
            $window.location.reload();
        }

        $scope.view_team = (team_id) => {
            window.location.href="#!/team/" + team_id;
            $window.location.reload();
        }
        
        let x = $location.path().toString().split("/");
        $scope.match_id = parseInt(x[x.length-1]);
        $scope.court = undefined;
        $scope.match = undefined;
        $scope.match_teams_scores = [];

        $scope.init_match = () => {
            MatchService
                .init_match($scope.match_id)
                .then(function(res) {
                    $scope.match = res[0][0];
                    console.log(res[0]);
                }, function(err) {
                    console.log(err);
                })
        }

        $scope.init_match_teams = () => {
            MatchService
                .init_match_teams_scores($scope.match_id)
                .then(function(res) {
                    $scope.match_teams_scores = res[0];
                    console.log(res[0]);
                    MatchService.determine_winner($scope.match_teams_scores);
                }, function(err) {
                    console.log(err);
                })
        }
    }
})();
