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
-- Name: crater; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.crater (
    crater_id integer NOT NULL,
    name character varying NOT NULL,
    number numeric
);


ALTER TABLE public.crater OWNER TO freecodecamp;

--
-- Name: crater_crater_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.crater_crater_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crater_crater_id_seq OWNER TO freecodecamp;

--
-- Name: crater_crater_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.crater_crater_id_seq OWNED BY public.crater.crater_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    form text,
    type character varying(10)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    crater_id integer,
    spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    moon_id integer,
    spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    galaxy_id integer,
    type character varying(10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: crater crater_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater ALTER COLUMN crater_id SET DEFAULT nextval('public.crater_crater_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: crater; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.crater VALUES (1, 'Son', 3);
INSERT INTO public.crater VALUES (2, 'of', 1);
INSERT INTO public.crater VALUES (3, 'Me', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', NULL, 'Spiral', 'Pulse');
INSERT INTO public.galaxy VALUES (2, 'Bounty', NULL, 'Stick', 'Green');
INSERT INTO public.galaxy VALUES (3, 'Mars', NULL, 'Stick', 'Red');
INSERT INTO public.galaxy VALUES (4, 'Twix', NULL, 'Two Sticks', 'Yellow');
INSERT INTO public.galaxy VALUES (5, 'Kitkat', NULL, 'Sphere', 'Orange');
INSERT INTO public.galaxy VALUES (6, 'Chupik', NULL, 'Icon', 'Blue');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Milanor', NULL, true, 1);
INSERT INTO public.moon VALUES (2, 'Moon', NULL, true, 1);
INSERT INTO public.moon VALUES (3, 'Fobos', NULL, true, 1);
INSERT INTO public.moon VALUES (4, 'Deimos', NULL, true, 1);
INSERT INTO public.moon VALUES (5, 'Calisto', NULL, true, 1);
INSERT INTO public.moon VALUES (6, 'Milanor', NULL, true, 2);
INSERT INTO public.moon VALUES (7, 'Moon', NULL, true, 2);
INSERT INTO public.moon VALUES (8, 'Fobos', NULL, true, 2);
INSERT INTO public.moon VALUES (9, 'Deimos', NULL, true, 2);
INSERT INTO public.moon VALUES (10, 'Calisto', NULL, true, 2);
INSERT INTO public.moon VALUES (11, 'Milanor', NULL, true, 3);
INSERT INTO public.moon VALUES (12, 'Moon', NULL, true, 3);
INSERT INTO public.moon VALUES (13, 'Fobos', NULL, true, 3);
INSERT INTO public.moon VALUES (14, 'Deimos', NULL, true, 3);
INSERT INTO public.moon VALUES (15, 'Calisto', NULL, true, 3);
INSERT INTO public.moon VALUES (16, 'Milanor', NULL, true, 4);
INSERT INTO public.moon VALUES (17, 'Moon', NULL, true, 4);
INSERT INTO public.moon VALUES (18, 'Fobos', NULL, true, 4);
INSERT INTO public.moon VALUES (19, 'Deimos', NULL, true, 4);
INSERT INTO public.moon VALUES (20, 'Calisto', NULL, true, 4);
INSERT INTO public.moon VALUES (21, 'Milanor', NULL, true, 5);
INSERT INTO public.moon VALUES (22, 'Moon', NULL, true, 5);
INSERT INTO public.moon VALUES (23, 'Fobos', NULL, true, 5);
INSERT INTO public.moon VALUES (24, 'Deimos', NULL, true, 5);
INSERT INTO public.moon VALUES (25, 'Calisto', NULL, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, true, 1);
INSERT INTO public.planet VALUES (2, 'Merqury', NULL, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptunus', NULL, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, true, 1);
INSERT INTO public.planet VALUES (10, 'Voulkan', NULL, true, 1);
INSERT INTO public.planet VALUES (11, 'Watches', NULL, true, 1);
INSERT INTO public.planet VALUES (12, 'Duponos', NULL, true, 1);
INSERT INTO public.planet VALUES (13, 'Milanor', NULL, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, 'Yellow');
INSERT INTO public.star VALUES (2, 'Aldebaran', NULL, 1, 'Green');
INSERT INTO public.star VALUES (3, 'Sirius', NULL, 1, 'Red');
INSERT INTO public.star VALUES (4, 'Vega', NULL, 1, 'Yellow');
INSERT INTO public.star VALUES (5, 'Sorrow', NULL, 2, 'Orange');
INSERT INTO public.star VALUES (6, 'Cat', NULL, 3, 'Blue');


--
-- Name: crater_crater_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.crater_crater_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: crater crater_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater
    ADD CONSTRAINT crater_number_key UNIQUE (number);


--
-- Name: crater crater_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.crater
    ADD CONSTRAINT crater_pkey PRIMARY KEY (crater_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_crater_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_crater_id_key UNIQUE (crater_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_key UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_key UNIQUE (planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

