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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL
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
    planet_id integer NOT NULL,
    albedo numeric NOT NULL,
    diameter_km integer NOT NULL
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
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    mass numeric NOT NULL,
    is_habitable boolean NOT NULL
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
-- Name: research_facility; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.research_facility (
    research_facility_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    established_year integer NOT NULL
);


ALTER TABLE public.research_facility OWNER TO freecodecamp;

--
-- Name: research_facility_research_facility_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.research_facility_research_facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_facility_research_facility_id_seq OWNER TO freecodecamp;

--
-- Name: research_facility_research_facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.research_facility_research_facility_id_seq OWNED BY public.research_facility.research_facility_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    is_main_sequence boolean NOT NULL,
    magnitude integer NOT NULL
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
-- Name: research_facility research_facility_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research_facility ALTER COLUMN research_facility_id SET DEFAULT nextval('public.research_facility_research_facility_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy', true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', true, 10000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', true, 9000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral galaxy', true, 13000, 28000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting galaxy', true, 400, 23000000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Lenticular galaxy', false, 12000, 13000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 0.12, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.07, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.065, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.63, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.64, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.43, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.22, 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 0.22, 5149);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 0.94, 1527);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 0.05, 1469);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 0.55, 1122);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1.22, 1062);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 1.38, 504);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 0.96, 396);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 0.32, 471);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 0.39, 1157);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 0.20, 1169);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 0.27, 1578);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 0.23, 1522);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 0.76, 2706);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.000, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 95.16, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 14.54, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 17.15, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf Planet', 0.002, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 'Dwarf Planet', 0.0002, false);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 'Dwarf Planet', 0.003, false);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 'Dwarf Planet', 0.0007, false);


--
-- Data for Name: research_facility; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.research_facility VALUES (1, 'Mauna Kea', 'Hawaii', 1967);
INSERT INTO public.research_facility VALUES (2, 'VLA', 'New Mexico', 1980);
INSERT INTO public.research_facility VALUES (3, 'ALMA', 'Chile', 2011);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', true, 4);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-M2', false, 0);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'B8Ia', false, 0);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0V', true, 0);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G2V', true, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: research_facility_research_facility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.research_facility_research_facility_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: research_facility research_facility_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research_facility
    ADD CONSTRAINT research_facility_name_key UNIQUE (name);


--
-- Name: research_facility research_facility_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.research_facility
    ADD CONSTRAINT research_facility_pkey PRIMARY KEY (research_facility_id);


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

