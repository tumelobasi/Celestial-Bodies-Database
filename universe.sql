--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    region text,
    brightest_star character varying(100),
    visible_season text,
    number_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter_light_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    description text,
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
    name character varying(100) NOT NULL,
    diameter_km integer NOT NULL,
    surface_temperature_celsius integer NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_liquid_water boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    orbital_period_days integer NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    luminosity integer NOT NULL,
    mass_kg integer NOT NULL,
    is_visible boolean NOT NULL,
    galaxy_id integer
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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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

INSERT INTO public.constellation VALUES (1, 'Orion', 'Northern Hemisphere', 'Rigel', 'Winter', 7);
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'Northern Hemisphere', 'Alioth', 'Spring', 7);
INSERT INTO public.constellation VALUES (3, 'Leo', 'Northern Hemisphere', 'Regulus', 'Spring', 9);
INSERT INTO public.constellation VALUES (4, 'Crux', 'Southern Hemisphere', 'Acrux', 'Summer', 5);
INSERT INTO public.constellation VALUES (5, 'Pegasus', 'Northern Hemisphere', 'Markab', 'Autumn', 5);
INSERT INTO public.constellation VALUES (6, 'Centaurus', 'Southern Hemisphere', 'Alpha Centauri', 'Summer', 11);
INSERT INTO public.constellation VALUES (7, 'Cassiopeia', 'Northern Hemisphere', 'Schedar', 'Autumn', 5);
INSERT INTO public.constellation VALUES (8, 'Canis Major', 'Southern Hemisphere', 'Sirius', 'Winter', 5);
INSERT INTO public.constellation VALUES (9, 'Cygnus', 'Northern Hemisphere', 'Deneb', 'Summer', 7);
INSERT INTO public.constellation VALUES (10, 'Scorpius', 'Southern Hemisphere', 'Antares', 'Winter', 18);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 100000, 26000.00, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 4500, 220000, 2200000.00, 'Closest spiral galaxy to Milky Way', true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 6000, 120000, 54000000.00, 'Giant elliptical galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 13000, 50000, 29000000.00, 'Edge-on spiral galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 13000, 60000, 3000000.00, 'Small spiral galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 13000, 70000, 23000000.00, 'Spiral galaxy undergoing interaction with a smaller companion', false);
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 22000, 70000, 25000000.00, 'Grand-design spiral galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3475, -153, false, false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, -60, false, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, -40, false, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 3121, -160, false, false, true, 9);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5268, -163, false, false, false, 9);
INSERT INTO public.moon VALUES (6, 'Callisto', 4821, -153, false, false, false, 9);
INSERT INTO public.moon VALUES (7, 'Titan', 5150, -179, false, true, true, 7);
INSERT INTO public.moon VALUES (8, 'Enceladus', 504, -201, false, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Triton', 2707, -235, false, false, false, 8);
INSERT INTO public.moon VALUES (10, 'Charon', 1212, -220, false, false, false, 11);
INSERT INTO public.moon VALUES (11, 'Phoebe', 213, -150, false, false, false, 5);
INSERT INTO public.moon VALUES (12, 'Io', 3643, -163, false, false, false, 8);
INSERT INTO public.moon VALUES (13, 'Rhea', 1529, -202, false, false, false, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1123, -186, false, false, false, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 1062, -187, false, false, false, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 396, -186, false, false, false, 6);
INSERT INTO public.moon VALUES (17, 'Hyperion', 270, -180, false, false, false, 7);
INSERT INTO public.moon VALUES (18, 'Iapetus', 1468, -143, false, false, false, 6);
INSERT INTO public.moon VALUES (19, 'Miranda', 471, -187, false, false, false, 10);
INSERT INTO public.moon VALUES (20, 'Ariel', 1158, -213, false, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 88, 0.39, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 225, 0.72, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 365, 1.00, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 687, 1.52, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 4333, 5.20, true, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 10759, 9.58, true, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 30687, 19.22, true, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 60190, 30.05, true, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 500, 130, 0.35, true, 3);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 500, 4, 0.05, true, 4);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 1000, 13, 0.07, true, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 100, 4, 0.03, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 38460, 198900, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 20200, 202000, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 15190, 220000, true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 35300, 160000, true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 95700, 850000, true, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 12360, 380000, true, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

