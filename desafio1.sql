DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.user_plan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(255) NOT NULL,
    price DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.user(
    id INT PRIMARY KEY AUTO_INCREMENT,
	  name VARCHAR (100) NOT NULL,
    age INT NOT NULL,
    signature_date  TIMESTAMP DEFAULT NOW(),
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES user_plan(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(255) NOT NULL,
    realease_date INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history_play(
    history_date DATETIME NOT NULL,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(id),
    FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(id),
    PRIMARY KEY (history_date, user_id, song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow_artist(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id),
    PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.user_plan(id, plan, price)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.artists(name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.user( name, age, signature_date, plan_id)
VALUES
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 2),
  ('Bill', 20, '2019-06-05', 3),
  ('Roger', 45, '2020-05-13', 4),
  ('Norman', 58, '2017-02-17', 4),
  ('Patrick', 33, '2017-01-06', 2),
  ('Vivian', 26, '2018-01-05', 3),
  ('Carol', 19, '2018-02-14', 3),
  ('Angelina', 42, '2018-04-29', 2),
  ('Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.albums(id, album_name, realease_date, artist_id)
VALUES
  (1, 'Envious', 1990, 1),
  (2, 'Exuberant', 1993, 1),
  (3, 'Hallowed Steam', 1995, 2),
  (4, 'Incandescent', 1998, 3),
  (5, 'Temporary Culture', 2001, 4),
  (6, 'Library of liberty', 2003, 4),
  (7, 'Chained Down', 2007, 5),
  (8, 'Cabinet of fools', 2012, 5),
  (9, 'No guarantees', 2015, 5),
  (10, 'Apparatus', 2015, 6);

INSERT INTO SpotifyClone.songs(id, song_name, duration, album_id)
VALUES
  (1, "Soul For Us", 200, 1),
  (2, "Reflections Of Magic", 163, 1),
  (3, "Dance With Her Own", 116, 1),
  (4, "Troubles Of My Inner Fire", 203, 2),
  (5, "Time Fireworks", 152, 2),
  (6, "Magic Circus", 105, 3),
  (7, "Honey, So Do I", 207, 3),
  (8, "Sweetie, Let's Go Wild", 139, 3),
  (9, "She Knows", 244, 3),
  (10, "Fantasy For Me", 100, 4),
  (11, "Celebration Of More", 146, 4),
  (12, "Rock His Everything", 223, 4),
  (13, "Home Forever", 231, 4),
  (14, "Diamond Power", 241, 4),
  (15, "Let's Be Silly", 132, 4),
  (16, "Thang Of Thunder", 240, 5),
  (17, "Words Of Her Life", 185, 5),
  (18, "Without My Streets", 176, 5),
  (19, "Need Of The Evening", 190, 6),
  (20, "History Of My Roses", 222, 6),
  (21, "Without My Love", 111, 6),
  (22, "Walking And Game", 123, 6),
  (23, "Young And Father", 197, 6),
  (24, "Finding My Traditions", 179, 7),
  (25, "Walking And Man", 229, 7),
  (26, "Hard And Time", 135, 7),
  (27, "Honey, I'm A Lone Wolf", 150, 7),
  (28, "She Thinks I Won't Stay Tonight", 166, 8),
  (29, "He Heard You're Bad For Me", 154, 8),
  (30, "He Hopes We Can't Stay", 210, 8),
  (31, "I Know I Know", 117, 8),
  (32, "He's Walking Away", 159, 9),
  (33, "He's Trouble", 138, 9),
  (34, "I Heard I Want To Bo Alone", 120, 9),
  (35, "I Ride Alone", 151, 9),
  (36, "Honey", 79, 10),
  (37, "You Cheated On Me", 95, 10),
  (38, "Wouldn't It Be Nice", 213, 10),
  (39, "Baby", 136, 10),
  (40, "You Make Me Feel So..", 83, 10);

INSERT INTO SpotifyClone.history_play(history_date, user_id, song_id)
VALUE
  ("2020-02-28 10:45:55", 1, 36),
  ("2020-05-02 05:30:35", 1, 25),
  ("2020-03-06 11:22:33", 1, 23),
  ("2020-08-05 08:05:17", 1, 14),
  ("2020-09-14 16:32:22", 1, 15),
  ("2020-01-02 07:40:33", 2, 34),
  ("2020-05-16 06:16:22", 2, 24),
  ("2020-10-09 12:27:48", 2, 21),
  ("2020-09-21 13:14:46", 3, 39),
  ("2020-11-13 16:55:13", 3, 6),
  ("2020-12-05 18:38:30", 3, 2),
  ("2020-07-30 10:00:00", 4, 26),
  ("2021-08-15 17:10:10", 4, 2),
  ("2021-07-10 15:20:30", 4, 35),
  ("2021-01-09 01:44:33", 4, 27),
  ("2020-07-03 19:33:28", 5, 7),
  ("2017-02-24 21:14:22", 5, 12),
  ("2020-08-06 15:23:43", 5, 14),
  ("2020-11-10 13:52:27", 5, 1),
  ("2019-02-07 20:33:48", 6, 38),
  ("2017-01-24 00:31:17", 6, 29),
  ("2017-10-12 12:35:20", 6, 30),
  ("2018-05-29 14:56:41", 6, 25),
  ("2018-05-09 22:30:49", 7, 5),
  ("2020-07-27 12:52:58", 7, 4),
  ("2018-01-16 18:40:43", 7, 11),
  ("2018-03-21 16:56:40", 8, 39),
  ("2020-10-18 13:38:05", 8, 40),
  ("2019-05-25 08:14:03", 8, 32),
  ("2021-08-15 21:37:09", 8, 33),
  ("2021-05-24 17:23:45", 9, 16),
  ("2018-12-07 22:48:52", 9, 17),
  ("2021-03-14 06:14:26", 9, 8),
  ("2020-04-01 03:36:00", 9, 9),
  ("2017-02-06 08:21:34", 10, 20),
  ("2017-12-04 05:33:43", 10, 21),
  ("2017-07-27 05:24:49", 10, 12),
  ("2017-12-25 01:03:57", 10, 13);

INSERT INTO SpotifyClone.follow_artist(user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 3),
  (2, 1),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

