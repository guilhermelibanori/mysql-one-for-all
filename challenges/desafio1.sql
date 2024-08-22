DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_name VARCHAR(20) PRIMARY KEY,
  plan_value DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, plan_value) VALUES
	('free', 0.00),
	('family', 7.99),
	('student', 5.99),
	('personal', 6.99);

CREATE TABLE SpotifyClone.users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  user_age INT NOT NULL,
  user_plan VARCHAR(20) NOT NULL,
  plan_date DATE NOT NULL,
  FOREIGN KEY (user_plan) REFERENCES SpotifyClone.plans(plan_name)
) engine = InnoDB;  

INSERT INTO SpotifyClone.users (user_name, user_age, user_plan, plan_date) VALUES
	('Barbara Liskov', 82, 'free', '2019-10-20'),
	('Robert Cecil Martin', 58, 'free', '2017-01-06'),
	('Ada Lovelace', 37, 'family', '2017-12-30'),
	('Martin Fowler', 46, 'family', '2017-01-17'),
	('Sandi Metz', 58, 'family', '2018-04-29'),
	('Paulo Freire', 19, 'student', '2018-02-14'),
	('Bell Hooks', 26, 'student', '2018-01-05'),
	('Christopher Alexander', 85, 'personal', '2019-06-05'),
	('Judith Butler', 45, 'personal', '2020-05-13'),
	('Jorge Amado', 58, 'personal', '2017-02-17');

CREATE TABLE SpotifyClone.artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(100) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artist_name) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albums (album_name, artist_id, release_year) VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  song_duration INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs (song_name, album_id, song_duration) VALUES
  ('Break My Soul', '1', '279'),
  ('Virgos Groove', '1', '369'),
  ('Alien Superstar', '1', '116'),
  ('Dont Stop Me Now', '2', '203'),
  ('Under Pressure', '3', '152'),
  ('Como Nossos Pais', '4', '105'),
  ('O Medo de Amar é o Medo de Ser Livre', '5', '207'),
  ('Samba em Paris', '6', '267'),
  ('The Bards Song', '7', '244'),
  ('Feeling Good', '8', '100');

CREATE TABLE SpotifyClone.follows(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.follows (user_id, artist_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

CREATE TABLE SpotifyClone.history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  played_at DATETIME NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id)
) engine = InnoDB;

INSERT INTO
  SpotifyClone.history (user_id, song_id, played_at) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');
