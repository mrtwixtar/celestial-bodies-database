--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    orbital_period_years numeric(8,2),
    is_active boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    diameter_km integer,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric(10,2)
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_star numeric(10,2)
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL,
    mass numeric(10,2)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Periodic comet', 75.30, true);
INSERT INTO public.comet VALUES (2, 'Encke', 'Short-period comet', 3.30, true);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 'Long-period comet', 2533.00, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Prime', 'Spiral galaxy', 10000, 2.54, false);
INSERT INTO public.galaxy VALUES (2, 'Solaria', 'Home of several civilizations', 13000, 0.00, true);
INSERT INTO public.galaxy VALUES (3, 'Nebuloria', 'Distant elliptical galaxy', 8500, 15.50, false);
INSERT INTO public.galaxy VALUES (4, 'Centauria', 'Massive spiral galaxy', 12000, 4.20, false);
INSERT INTO public.galaxy VALUES (5, 'Orionis', 'Young galaxy', 3000, 8.75, false);
INSERT INTO public.galaxy VALUES (6, 'Vespera', 'Ancient galaxy', 13500, 25.30, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Auralis', 1, 'Rocky moon', 1200, true, 150000.50);
INSERT INTO public.moon VALUES (2, 'Aurion', 1, 'Small icy moon', 800, true, 220000.00);
INSERT INTO public.moon VALUES (3, 'Boreon', 2, 'Frozen moon', 1400, true, 180000.00);
INSERT INTO public.moon VALUES (4, 'Boreia', 2, 'Ice-covered moon', 950, true, 270000.00);
INSERT INTO public.moon VALUES (5, 'Celion', 3, 'Oceanic moon', 2100, true, 310000.00);
INSERT INTO public.moon VALUES (6, 'Celestra', 3, 'Rocky moon', 1100, true, 190000.00);
INSERT INTO public.moon VALUES (7, 'Drakos', 4, 'Volcanic moon', 1700, true, 230000.00);
INSERT INTO public.moon VALUES (8, 'Dravia', 4, 'Dark moon', 600, false, 120000.00);
INSERT INTO public.moon VALUES (9, 'Elyon', 5, 'Forest moon', 1600, true, 290000.00);
INSERT INTO public.moon VALUES (10, 'Elyria', 5, 'Icy moon', 900, true, 350000.00);
INSERT INTO public.moon VALUES (11, 'Ferion', 6, 'Desert moon', 1300, true, 210000.00);
INSERT INTO public.moon VALUES (12, 'Feris', 6, 'Rocky moon', 700, false, 160000.00);
INSERT INTO public.moon VALUES (13, 'Gaios', 7, 'Large icy moon', 3200, true, 450000.00);
INSERT INTO public.moon VALUES (14, 'Gaiara', 7, 'Rocky moon', 1800, true, 380000.00);
INSERT INTO public.moon VALUES (15, 'Hyron', 8, 'Frozen moon', 2500, true, 520000.00);
INSERT INTO public.moon VALUES (16, 'Hyria', 8, 'Small icy moon', 1000, true, 280000.00);
INSERT INTO public.moon VALUES (17, 'Icaron', 9, 'Hot rocky moon', 850, true, 140000.00);
INSERT INTO public.moon VALUES (18, 'Jovion', 10, 'Stormy moon', 2200, true, 420000.00);
INSERT INTO public.moon VALUES (19, 'Kryos', 11, 'Frozen moon', 1900, true, 310000.00);
INSERT INTO public.moon VALUES (20, 'Lunaris', 12, 'Bright moon', 1500, true, 240000.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Auria', 1, 'Rocky planet', 4500, true, true, 1.20);
INSERT INTO public.planet VALUES (2, 'Borealis', 1, 'Frozen planet', 3800, false, true, 5.40);
INSERT INTO public.planet VALUES (3, 'Celestia', 2, 'Ocean planet', 4200, true, true, 2.10);
INSERT INTO public.planet VALUES (4, 'Draconis', 2, 'Volcanic planet', 3100, false, true, 0.80);
INSERT INTO public.planet VALUES (5, 'Elysia', 3, 'Forest planet', 5000, true, true, 3.60);
INSERT INTO public.planet VALUES (6, 'Feron', 3, 'Desert planet', 2900, false, true, 4.20);
INSERT INTO public.planet VALUES (7, 'Gaiana', 4, 'Gas giant', 6000, false, true, 8.50);
INSERT INTO public.planet VALUES (8, 'Hyperion', 4, 'Ice giant', 4700, false, true, 12.30);
INSERT INTO public.planet VALUES (9, 'Icaris', 5, 'Hot rocky planet', 1500, false, true, 0.50);
INSERT INTO public.planet VALUES (10, 'Jovara', 5, 'Storm planet', 2300, false, true, 6.70);
INSERT INTO public.planet VALUES (11, 'Kryon', 6, 'Frozen world', 7500, false, true, 15.20);
INSERT INTO public.planet VALUES (12, 'Lumina', 6, 'Habitable planet', 6800, true, true, 2.80);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Asterion', 1, 'Bright blue star', 4500, true, 2.50);
INSERT INTO public.star VALUES (2, 'Helion', 2, 'Yellow dwarf star', 4600, true, 1.00);
INSERT INTO public.star VALUES (3, 'Velaris', 3, 'Red giant star', 3000, true, 8.20);
INSERT INTO public.star VALUES (4, 'Caelus', 4, 'Massive white star', 5500, true, 4.70);
INSERT INTO public.star VALUES (5, 'Novera', 5, 'Young blue star', 1200, true, 3.10);
INSERT INTO public.star VALUES (6, 'Elaris', 6, 'Ancient orange star', 9000, true, 0.85);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

