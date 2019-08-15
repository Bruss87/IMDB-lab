drop table if exists castings;
drop table if exists movies;
drop table if exists stars;

create table stars (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

create table movies (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)
);

create table castings (
  id SERIAL8 PRIMARY KEy,
  fee INT8,
  movie_id INT8 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT8 REFERENCES stars(id) ON DELETE CASCADE
);
