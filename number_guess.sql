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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'Test1', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1668829212593', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1668829212592', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1668831449124', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1668831449123', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1668993189161', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1668993189160', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1668993742271', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1668993742270', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1668993798020', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1668993798019', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1668998039415', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1668998039414', 0, NULL);
INSERT INTO public.users VALUES (15, '50', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1668998338533', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1668998338532', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1668998373811', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1668998373810', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1668999209155', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1668999209154', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1669001133341', 0, NULL);
INSERT INTO public.users VALUES (23, 'user_1669001133340', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1669001587888', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1669001587887', 0, NULL);
INSERT INTO public.users VALUES (27, 'user_1669001678620', 0, NULL);
INSERT INTO public.users VALUES (28, 'user_1669001678619', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1669001771320', 0, NULL);
INSERT INTO public.users VALUES (30, 'user_1669001771319', 0, NULL);
INSERT INTO public.users VALUES (32, 'user_1669001910759', 0, NULL);
INSERT INTO public.users VALUES (33, 'user_1669001910758', 0, NULL);
INSERT INTO public.users VALUES (1, 'Frank Xia', 1, 9);
INSERT INTO public.users VALUES (36, 'user_1669009019304', 2, 187);
INSERT INTO public.users VALUES (35, 'user_1669009019305', 5, 54);
INSERT INTO public.users VALUES (31, 'Mike', 2, 9);
INSERT INTO public.users VALUES (38, 'user_1669009459447', 2, 522);
INSERT INTO public.users VALUES (37, 'user_1669009459448', 5, 130);
INSERT INTO public.users VALUES (40, 'user_1669009524631', 2, 723);
INSERT INTO public.users VALUES (39, 'user_1669009524633', 5, 44);
INSERT INTO public.users VALUES (42, 'user_1669009548866', 2, 37);
INSERT INTO public.users VALUES (41, 'user_1669009548867', 5, 168);
INSERT INTO public.users VALUES (24, 'Jim', 1, 4);
INSERT INTO public.users VALUES (44, 'user_1669009863326', 2, 21);
INSERT INTO public.users VALUES (43, 'user_1669009863327', 5, 346);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 44, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

