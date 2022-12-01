-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
  (id SERIAL PRIMARY KEY,
  album_title TEXT NOT NULL
);

CREATE TABLE artists
  (id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE producers
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
album_id INTEGER REFERENCES albums ON DELETE SET NULL
);



CREATE TABLE songs
  (id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  albums_id INTEGER REFERENCES albums ON DELETE SET NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date TEXT
);


INSERT INTO albums
  (album_title)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');


INSERT INTO artists 
(name,album_id)
VALUES
('Hanson',1),
('Queen',2),
('Mariah Cary',3),
('Boyz II Men',3),
('Lady Gaga',4),
('Bradley Cooper',4),
('Nickelback',5),
('Jay Z',6),
('Alicia Keys',6),
('Katy Perry',7),
('Juicy J',7),
('Maroon 5',8),
('Christina Aguilera',8),
('Avril Lavigne',9),
('Destiny''s Child',10);


INSERT INTO producers
  (name,album_id)
VALUES
  ('Dust Brothers',1),
  ('Stephen Lironi',1),
  ('Roy Thomas Baker',2),
  ('Walter Afanasieff',3),
  ('Benjamin Rice',4),
  ('Rick Parashar',5),
  ('Al Shux',6),
  ('Max Martin',7),
  ('Cirkut',7),
  ('Shellback',8),
  ('Benny Blanco',8),
  ('The Matrix',9),
  ('Darkchild',10);



INSERT INTO songs
  (title, duration_in_seconds,albums_id, release_date)
VALUES
  ('MMMBop', 238,1,'04-15-1997'),
  ('Bohemian Rhapsody',355,2,'10-31-1975'),
  ('One Sweet Day',282,3,'11-14-1995'),
  ('Shallow', 216,4,'09-27-2018'),
  ('How You Remind Me',223,5,'08-21-2001'),
  ('New York State of Mind',276,6,'10-20-2009'),
  ('Dark Horse', 215,7,'12-17-2013'),
  ('Moves Like Jagger', 201,8,'06-21-2011'),
  ('Complicated', 244,9,'05-14-2002'),
  ('Say My Name', 240,10,'11-07-1999');
