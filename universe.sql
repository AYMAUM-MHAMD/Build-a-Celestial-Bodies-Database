
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;


CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;



CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;



CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;




CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    radius integer NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period numeric(8,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;



CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;




CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean,
    diameter integer NOT NULL,
    distance_from_star numeric(12,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;



CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;



CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type text NOT NULL,
    mass numeric(10,2),
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;



CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;



CREATE TABLE public.telescope (
    telescope_id integer NOT NULL,
    name character varying(100) NOT NULL,
    launch_year integer NOT NULL,
    operational boolean NOT NULL,
    description text
);


ALTER TABLE public.telescope OWNER TO freecodecamp;



CREATE SEQUENCE public.telescope_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_telescope_id_seq OWNER TO freecodecamp;



ALTER SEQUENCE public.telescope_telescope_id_seq OWNED BY public.telescope.telescope_id;




ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);




ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);



ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);



ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);




ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescope_telescope_id_seq'::regclass);



INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 11000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Bright central bulge', 9000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous spiral galaxy', 8500, false, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Dust lane across the core', 7800, false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 10000, false, true);



INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, 27.30);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 1.30);
INSERT INTO public.moon VALUES (4, 'Europa', 1, 1560, true, 3.50);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, 2634, true, 7.10);
INSERT INTO public.moon VALUES (6, 'Callisto', 1, 2410, true, 16.70);
INSERT INTO public.moon VALUES (7, 'Io', 1, 1821, true, 1.80);
INSERT INTO public.moon VALUES (8, 'Vega I Moon 1', 9, 1000, true, 2.10);
INSERT INTO public.moon VALUES (9, 'Vega I Moon 2', 9, 800, false, 2.30);
INSERT INTO public.moon VALUES (10, 'Vega II Moon', 10, 900, true, 3.20);
INSERT INTO public.moon VALUES (11, 'Vega III Moon', 11, 950, false, 1.50);
INSERT INTO public.moon VALUES (12, 'Vega IV Moon 1', 12, 1050, true, 4.50);
INSERT INTO public.moon VALUES (13, 'Vega IV Moon 2', 12, 700, false, 5.10);
INSERT INTO public.moon VALUES (14, 'Vega IV Moon 3', 12, 500, false, 2.70);
INSERT INTO public.moon VALUES (15, 'Betelgeuse I Moon', 7, 1200, true, 3.00);
INSERT INTO public.moon VALUES (16, 'Betelgeuse II Moon 1', 8, 1150, true, 2.50);
INSERT INTO public.moon VALUES (17, 'Betelgeuse II Moon 2', 8, 800, false, 3.60);
INSERT INTO public.moon VALUES (18, 'Proxima b Moon', 4, 600, false, 1.20);
INSERT INTO public.moon VALUES (19, 'Alpha Centauri Bb Moon', 6, 750, false, 1.80);
INSERT INTO public.moon VALUES (20, 'Sirius b Moon', 5, 900, true, 2.20);




INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12742, 1.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 6779, 1.52);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 12104, 0.72);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, NULL, 11400, 0.05);
INSERT INTO public.planet VALUES (5, 'Sirius b Planet', 3, false, 13000, 2.50);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 4, false, 10000, 0.04);
INSERT INTO public.planet VALUES (7, 'Betelgeuse I', 5, false, 15000, 3.00);
INSERT INTO public.planet VALUES (8, 'Betelgeuse II', 5, false, 16000, 5.00);
INSERT INTO public.planet VALUES (9, 'Vega I', 6, false, 14000, 2.20);
INSERT INTO public.planet VALUES (10, 'Vega II', 6, false, 13500, 2.80);
INSERT INTO public.planet VALUES (11, 'Vega III', 6, false, 12000, 3.30);
INSERT INTO public.planet VALUES (12, 'Vega IV', 6, false, 11000, 4.00);



INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M-type', 0.12, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 2.02, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 2, 'G-type', 1.10, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 'Red supergiant', 20.00, true);
INSERT INTO public.star VALUES (6, 'Vega', 4, 'A-type', 2.10, true);



INSERT INTO public.telescope VALUES (1, 'Hubble Space Telescope', 1990, true, 'Observes in visible and UV spectrum');
INSERT INTO public.telescope VALUES (2, 'James Webb Space Telescope', 2021, true, 'Infrared space telescope');
INSERT INTO public.telescope VALUES (3, 'Spitzer Space Telescope', 2003, false, 'Infrared telescope retired in 2020');



SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);



SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);




SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);




SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);



SELECT pg_catalog.setval('public.telescope_telescope_id_seq', 3, true);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);



ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);



ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);




ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_name_key UNIQUE (name);




ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_pkey PRIMARY KEY (telescope_id);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);




