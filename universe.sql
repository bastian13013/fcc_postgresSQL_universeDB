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
    name character varying(50),
    description text,
    is_periodic boolean NOT NULL,
    orbital_period_years numeric,
    last_seen_year integer NOT NULL
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
    description text NOT NULL,
    galaxy_types character varying(32) NOT NULL,
    age_in_millions_of_years numeric
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
    is_active boolean,
    diameter_km integer NOT NULL,
    moon_types character varying(30)
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
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    planet_types character varying(64) NOT NULL,
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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
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

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'The most famous periodic comet, visible from Earth every 75-76 years.', true, 75.32, 1986);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the most widely observed comets of the 20th century.', true, 2533.0, 1997);
INSERT INTO public.comet VALUES (3, 'Encke', 'Comet with the shortest orbital period of any known comet.', true, 3.3, 2023);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxie spirale barrée contenant notre système solaire et environ 200 milliards d étoiles.', 'Spirales', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'La plus grande galaxy du Groupe local, voisine de la nôtre.', 'Spirales', 10600);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Célèbre pour son noyau brillant et son large disque de poussière.', 'Lenticulaire', 9000);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Galaxie géante située au centre de l amas de la Vierge.', 'Elliptique', 13000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Galaxie massive possdédant un trou noir supermassif actif.', 'Lenticulaire', 12000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Galaxie satellite de la Voie Lactée de forme asymétrique.', 'Irrégulière', 1100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earths only natural satellite.', false, 3474, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Larger Martian moon.', true, 22, 'Potato-shaped');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smallest Martian moon.', false, 12, 'Potato-shaped');
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanically active.', true, 3642, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Subsurface ocean moon.', true, 3121, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in solar system.', false, 5268, 'Icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered.', false, 4820, 'Icy');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Has a dense atmosphere.', true, 5150, 'Atmospheric');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Reflects almost all light.', true, 504, 'Icy');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Looks like the Death Star.', false, 396, 'Rocky');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Composed primarily of ice.', false, 1122, 'Icy');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Highly cratered surface.', false, 1527, 'Icy');
INSERT INTO public.moon VALUES (13, 'Titania', 7, 'Largest moon of Uranus.', false, 1577, 'Icy');
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 'Outermost major moon of Uranus.', false, 1522, 'Icy');
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Darkest large moon of Uranus.', false, 1169, 'Icy');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Brightest Uranian moon.', false, 1157, 'Icy');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Extreme geologic features.', true, 471, 'Icy');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 'Retrograde orbit moon.', true, 2706, 'Icy');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 'Highly eccentric orbit.', false, 340, 'Icy');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 'Irregularly shaped moon.', false, 420, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, true, 4503, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, true, 4503, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 4543, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 4603, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 4503, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 4503, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 4503, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 4503, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', true, true, 4800, 'Super Earth', 3);
INSERT INTO public.planet VALUES (10, 'Sirius Bb', false, true, 250, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, 'Osiris', false, true, 1000, 'Hot Jupiter', 4);
INSERT INTO public.planet VALUES (12, 'Corot-7b', false, true, 1500, 'Super Earth', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Etoile de type naine jaune au centre de notre système.', true, 0.000015, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'L etoile la plus brillante visible depuis la Terre.', true, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'L etoile la plus proche du système solaire.', true, 4.24, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Supergeante rouge situé dans la constellation d Orion.', true, 642.5, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Etoile bleue utilisee comme reference de magnitude.', true, 25.0, 1);
INSERT INTO public.star VALUES (6, 'Altair', 'Etoile tournant très rapidement sur elle-même.', true, 16.7, 1);


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
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

