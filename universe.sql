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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    name character varying(10) NOT NULL,
    visible_by_naked_eye boolean,
    number_of_stars integer,
    constellation_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_const_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_const_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_const_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_type character varying(20),
    distance_in_mly numeric,
    observed_by_naked_eye boolean
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
    name character varying(20) NOT NULL,
    has_life boolean,
    description character varying(50),
    age_in_my numeric,
    planet_id integer NOT NULL
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
    description text,
    has_life boolean,
    planet_types character varying(20),
    number_of_moons integer,
    name character varying(20),
    star_id integer NOT NULL
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
    star_type character varying(20),
    constellation character varying(20),
    age_in_my numeric,
    mass_in_sm integer,
    name character varying(20),
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_const_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES ('Ursa Major', true, 740, 1);
INSERT INTO public.constellation VALUES ('Lyra', true, 400, 2);
INSERT INTO public.constellation VALUES ('Centaurus', true, 120, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', ' Spiral', 458, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 7890, false);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Elliptical', 4502, false);
INSERT INTO public.galaxy VALUES (4, 'Butterfly', 'Elliptical', 4140, false);
INSERT INTO public.galaxy VALUES (5, 'Sculptor', 'Irregular', 900, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 90025, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', false, 'Earths moon', 100, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'Named after of Gods of War son in Ancient Rome', 200, 8);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'Another son of Mars, God of War in Ancient Rome', 300, 8);
INSERT INTO public.moon VALUES (4, 'Io', false, 'The most volcanically active in solar system', 4000, 4);
INSERT INTO public.moon VALUES (5, 'Europa', false, 'Might be the best place to look for life', 4000, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 'Largest moon in solar system', 5000, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 'Most heavily cratered body', 5000, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', false, 'Has liquid water under icy shell', 4200, 9);
INSERT INTO public.moon VALUES (9, 'Titan', false, 'Saturns largest moon', 4300, 9);
INSERT INTO public.moon VALUES (10, 'Ariel', false, 'Named after Shakespeare character', 5700, 10);
INSERT INTO public.moon VALUES (11, 'Oberon', false, 'Discovered in 1787', 5700, 10);
INSERT INTO public.moon VALUES (12, 'Rosalind', false, 'Discovered by Voysger 2', 5700, 10);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 'Discovered in 1851', 5700, 10);
INSERT INTO public.moon VALUES (14, 'Hippocamp', false, 'Might be a piece of bigger moon Proteus', 7900, 13);
INSERT INTO public.moon VALUES (15, 'Naiad', false, 'The last moon discovered by Voyager 2', 7900, 13);
INSERT INTO public.moon VALUES (16, 'Proteus', false, 'Discovered in 1989', 7900, 13);
INSERT INTO public.moon VALUES (17, 'Triton', false, 'Has surface made of nitrogen ice', 7900, 13);
INSERT INTO public.moon VALUES (18, 'Charon', false, 'It is so big it makes Pluto wobble', 7900, 14);
INSERT INTO public.moon VALUES (19, 'Kerberos', false, 'Tiny satellite with a reflective surface', 7940, 14);
INSERT INTO public.moon VALUES (20, 'Hydra', false, 'Discovered using Hubble telescope in 2005', 5912, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'IS the planet we all live on, 3rd planet from the Sun, the only planet known to harbour life in the known Universe, over 2/3 covered with liquid water', true, 'Terrestrial', 1, 'Earth', 1);
INSERT INTO public.planet VALUES (4, 'Biggest planet in the Solar System, ridden with violent storm', false, 'Gas giant', 79, 'Jupiter', 1);
INSERT INTO public.planet VALUES (5, 'Closest exoplanet to the Solar System, has two asteroid belts', false, 'Terrestrial', 0, 'Epsilon Eridani b', 3);
INSERT INTO public.planet VALUES (6, 'A gas giant that is residing i the habitable zone of its  star. Might have life on one of its moons', false, 'Gas giant', 3, 'Gliese 876', 2);
INSERT INTO public.planet VALUES (7, 'Closest to the Sun and the second smallest planet with immense surface temperature and no moons', false, 'Terrestrial', 0, 'Mercury', 1);
INSERT INTO public.planet VALUES (8, '4th planet from the Sun, has a thin atmosphere of carbon dioxide and reddish in colour', true, 'Terrestrial', 2, 'Mars', 1);
INSERT INTO public.planet VALUES (9, 'Llike Jupiter consists mostly of hydrogen and helium and is surrounded by a set of 9 whole rings', false, 'Gas giant', 83, 'Saturn', 1);
INSERT INTO public.planet VALUES (10, 'Its called "sideways planet" for its awkward rotaion. Methane atmosphere accoounts for its bluish colour', false, 'Ice giant', 27, 'Uranus', 1);
INSERT INTO public.planet VALUES (11, 'Most Earth-like expoplanet so far', false, 'Terrestrial', 2, 'Gliese 581', 5);
INSERT INTO public.planet VALUES (12, 'Coldest known planet in the universe, reaching 9700 degrees Celsius', false, 'Gas giant', 3, 'Kelt-9b', 4);
INSERT INTO public.planet VALUES (13, 'Windiest planet in Solar system, 8th planet furthest from the Sun', false, 'Ice giant', 14, 'Neptune', 1);
INSERT INTO public.planet VALUES (14, 'Formerly known as the 9th planet in the Solar system is currently a dwarf planet located in the Kuiper belt of bodies', false, 'Dwarf planet', 2, 'Pluto', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Yellow dwarf', 'None', 100, 1, 'Sun', 1);
INSERT INTO public.star VALUES (2, 'Red Dwarf', 'Bootes', 201, 15, 'Arcturus', 2);
INSERT INTO public.star VALUES (3, 'Red Dwarf', 'Southern Cross', 45, 3, 'Crux', 3);
INSERT INTO public.star VALUES (4, 'Red Dwarf', 'Centaurus', 900, 2, 'Proxima Centauri', 4);
INSERT INTO public.star VALUES (5, 'Red Dwarf', 'Ursa Major', 854, 3, 'Lalande 21185', 5);
INSERT INTO public.star VALUES (6, 'Brown Dwarf', 'Lyra', 400, 1, 'LSRJI835', 6);


--
-- Name: constellation_const_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_const_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_const_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_const_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_planet_id_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

