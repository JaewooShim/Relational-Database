--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

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

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    distance_from_earth integer,
    radius numeric(50,1),
    speed numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    age integer,
    distance_from_earth integer,
    radius numeric(50,1),
    speed numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    moon_planet_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age integer,
    distance_from_earth integer,
    radius numeric(50,1),
    speed numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age integer,
    distance_from_earth integer,
    radius numeric(50,1),
    speed numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Elliptical', 100, 100, 100.5, 23.5, 'idk', false, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 50, 100, 123423.5, 42.3, 'familiar', false, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 235, 12345, 12341234.5, 45.6, 'never heard', false, false);
INSERT INTO public.galaxy VALUES (4, 'Dwarf', 123, 4355, 23412412.5, 75.6, 'funny', false, true);
INSERT INTO public.galaxy VALUES (5, 'Irregular', 123, 456, 45234532456.6, 78.3, 'irregular', false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 123, 63645, 123412312.2, 73.2, 'pool', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 1, 1, 1.0, 1.0, 'aa', false, false, 1);
INSERT INTO public.moon VALUES (2, 'b', 2, 2, 2.0, 2.0, 'bb', false, false, 1);
INSERT INTO public.moon VALUES (3, 'c', 3, 3, 3.0, 3.0, 'cc', false, false, 2);
INSERT INTO public.moon VALUES (4, 'd', 4, 4, 4.0, 4.0, 'dd', false, false, 2);
INSERT INTO public.moon VALUES (5, 'e', 5, 5, 5.0, 5.0, 'ee', false, false, 3);
INSERT INTO public.moon VALUES (6, 'f', 6, 6, 6.0, 6.0, 'ff', false, false, 3);
INSERT INTO public.moon VALUES (7, 'g', 6, 6, 6.0, 6.0, 'gg', false, false, 4);
INSERT INTO public.moon VALUES (8, 'h', 7, 7, 7.0, 7.0, 'hh', false, false, 4);
INSERT INTO public.moon VALUES (9, 'i', 8, 8, 8.0, 8.0, 'ii', false, false, 4);
INSERT INTO public.moon VALUES (10, 'j', 9, 9, 9.0, 9.0, 'jj', false, false, 5);
INSERT INTO public.moon VALUES (11, 'k', 10, 10, 10.0, 10.0, 'kk', false, false, 6);
INSERT INTO public.moon VALUES (12, 'l', 11, 11, 11.0, 11.0, 'll', false, false, 6);
INSERT INTO public.moon VALUES (13, 'm', 12, 12, 12.0, 12.0, 'mm', false, false, 7);
INSERT INTO public.moon VALUES (14, 'n', 13, 13, 13.0, 13.0, 'nn', false, false, 7);
INSERT INTO public.moon VALUES (15, 'o', 14, 14, 14.0, 14.0, 'oo', false, false, 8);
INSERT INTO public.moon VALUES (16, 'p', 15, 15, 15.0, 15.0, 'pp', false, false, 8);
INSERT INTO public.moon VALUES (17, 'q', 16, 16, 16.0, 16.0, 'qq', false, false, 9);
INSERT INTO public.moon VALUES (18, 'r', 17, 17, 17.0, 17.0, 'rr', false, false, 10);
INSERT INTO public.moon VALUES (19, 's', 18, 18, 18.0, 18.0, 'ss', false, false, 11);
INSERT INTO public.moon VALUES (20, 't', 19, 19, 19.0, 19.0, 'tt', false, false, 12);
INSERT INTO public.moon VALUES (21, 'u', 20, 20, 20.0, 20.0, 'uu', false, true, 12);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 1, true, 1, 'a');
INSERT INTO public.moon_planet VALUES (2, 2, false, 2, 'b');
INSERT INTO public.moon_planet VALUES (3, 3, true, 3, 'c');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1234, 0, 151231241.2, 35.1, 'where we live in', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 56434, 23623, 1233512.2, 56.3, 'Saturday', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Neptune', 1523, 4456, 14147.3, 93.1, 'blue', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Uranus', 4567, 235234, 3522345.3, 74.2, 'cool', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Mercury', 4123, 44567, 235845.4, 84.8, 'grey', false, true, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 35673, 53324, 436352.2, 85.5, 'ML', false, true, 3);
INSERT INTO public.planet VALUES (7, 'Super-Earth', 347457, 23525, 23452345.7, 93.1, 'fake earth', false, true, 4);
INSERT INTO public.planet VALUES (8, 'Gas giant', 1235, 45745, 2252342.2, 24.6, 'giant', false, true, 4);
INSERT INTO public.planet VALUES (9, 'Mega-Earth', 76734, 32623, 234237623.3, 92.3, 'mega fake earth', false, true, 5);
INSERT INTO public.planet VALUES (10, 'Ice giant', 34573, 21256, 34554363.3, 35.4, 'icy', false, true, 5);
INSERT INTO public.planet VALUES (11, 'Mini-Neptune', 2456, 23463, 235235.3, 73.6, 'mini', false, true, 6);
INSERT INTO public.planet VALUES (12, 'Protoplanet', 45636, 24242, 25242.1, 86.3, 'weird', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'White dwarf', 1231, 234234, 13152452.2, 2.2, 'white', false, false, 5);
INSERT INTO public.star VALUES (2, 'Red dwarf', 123, 354, 123123.3, 2.1, 'red', false, false, 4);
INSERT INTO public.star VALUES (3, 'Protostar', 567, 562, 56855.2, 6.1, 'rainbow', false, true, 2);
INSERT INTO public.star VALUES (4, 'Red giant', 12, 5865, 1733.3, 3.1, 'huge', false, true, 3);
INSERT INTO public.star VALUES (5, 'Supergiant', 83, 56784, 624.3, 7.1, 'super huge', false, true, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 121, 34636, 14124.2, 6.2, 'like clouds', false, false, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_planet_id_key UNIQUE (moon_planet_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_planet moon_planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_planet moon_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_types_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_types_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_types_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

