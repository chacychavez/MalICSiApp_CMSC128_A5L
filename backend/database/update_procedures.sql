use malicsi;

drop procedure if exists update_account;
delimiter //
    create procedure update_account (
        IN _account_id          int(11),
        IN _firstname           varchar(256),
        IN _middlename          varchar(256),
        IN _lastname            varchar(256),
        IN _email               varchar(256),
        IN _username            varchar(256),
        IN _password            varchar(256),
        IN _course              varchar(256),
        IN _birthday            date,
        IN _college             enum('CA','CAS','CDC','CEAT','CEM','CFNR','CHE','CPAf','CVM','SESAM','GS'),
        IN _position            varchar(256),
        IN _is_player           boolean,
        IN _player_jersey_num   int(11),
        IN _player_role         varchar(256)
    )
    BEGIN
        UPDATE account set
            firstname = _firstname,
            middlename = _middlename,
            lastname = _lastname,
            email = _email,
            username = _username,
            password = _password,
            course = _course,
            birthday = _birthday,
            college = _college,
            position = _position,
            is_player = _is_player,
            player_jersey_num = _player_jersey_num,
            player_role = _player_role
        where account_id = _account_id;
    END;
// 
delimiter ;

drop procedure if exists approve_account;
delimiter //
    create procedure approve_account (
        IN _account_id            int(11)
    )
    BEGIN
        UPDATE account SET
            is_approved = true
        WHERE account_id = _account_id;
    END;
// 
delimiter ;

drop procedure if exists update_court;
delimiter //
    create procedure update_court (
        IN _court_id            int(11),
        IN _court_name          varchar(256),
        IN _court_location      varchar(256),
        IN _court_type          varchar(256)
    )
    BEGIN
        UPDATE court SET
            court_name = _court_name,
            court_location = _court_location,
            court_type = _court_type
        WHERE court_id = _court_id;
    END;
// 
delimiter ;

drop procedure if exists update_game_event;
delimiter //
    create procedure update_game_event (
        IN _game_id                     int(11),
        IN _game_name                   varchar(256),
        IN _game_starting_time_date     datetime,
        IN _game_ending_time_date       datetime
    )
    BEGIN
        UPDATE game_event SET
            game_name = _game_name, 
            game_starting_time_date = _game_starting_time_date,
            game_ending_time_date = _game_ending_time_date
        WHERE game_id = _game_id;
    END;
// 
delimiter ;


drop procedure if exists update_match_event;
delimiter //
    create procedure update_match_event (
        IN _match_id            int(11),
        IN _match_date_time     datetime,
        IN _series              enum('elimination','semi-finals','finals'),
        IN _court_id            int(11)
    )
    BEGIN
        UPDATE match_event SET
            match_date_time = _match_date_time,
            sport_id = _series,
            court_id = _court_id
        WHERE match_id = _match_id;
    END;
// 
delimiter ;

drop procedure if exists approve_match_event;
delimiter //
    create procedure approve_match_event (
        IN _match_id            int(11)
    )
    BEGIN
        UPDATE match_event SET
            status = true
        WHERE match_id = _match_id;
    END;
// 
delimiter ;

drop procedure if exists update_sponsor;
delimiter //
    create procedure update_sponsor (
        IN _sponsor_id          int(11),
        IN _sponsor_name        varchar(256),
        IN _sponsor_logo        varchar(256),
        IN _sponsor_affiliation varchar(256)
    )
    BEGIN
        UPDATE sponsor SET
            sponsor_name = _sponsor_name,
            sponsor_logo = _sponsor_logo,
            sponsor_affiliation = _sponsor_affiliation
        WHERE sponsor_id = _sponsor_id;
    END;
//
delimiter ;

drop procedure if exists update_sport;
delimiter //
    create procedure update_sport (
        IN _sport_id            int(11),
        IN _sport_type          varchar(256),
        IN _division            enum('men','women','mixed')
    )
    BEGIN
        UPDATE sport SET
            sport_type = _sport_type,
            division = _division
        WHERE sport_id = _sport_id;
    END;
//
delimiter ;