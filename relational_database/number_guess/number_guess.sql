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
    username character varying(30) NOT NULL,
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

INSERT INTO public.users VALUES (33, 'user_1665320068768', 2, 250);
INSERT INTO public.users VALUES (32, 'user_1665320068769', 5, 213);
INSERT INTO public.users VALUES (35, 'user_1665320073774', 2, 794);
INSERT INTO public.users VALUES (15, 'user_1665319819093', 2, 66);
INSERT INTO public.users VALUES (34, 'user_1665320073775', 5, 85);
INSERT INTO public.users VALUES (14, 'user_1665319819094', 5, 278);
INSERT INTO public.users VALUES (17, 'user_1665319875700', 2, 519);
INSERT INTO public.users VALUES (16, 'user_1665319875701', 5, 112);
INSERT INTO public.users VALUES (37, 'user_1665320077155', 2, 575);
INSERT INTO public.users VALUES (36, 'user_1665320077156', 5, 116);
INSERT INTO public.users VALUES (19, 'user_1665319912020', 2, 26);
INSERT INTO public.users VALUES (18, 'user_1665319912021', 5, 613);
INSERT INTO public.users VALUES (13, 'Martin', 3, 7);
INSERT INTO public.users VALUES (21, 'user_1665319981635', 2, 277);
INSERT INTO public.users VALUES (39, 'user_1665320086945', 2, 170);
INSERT INTO public.users VALUES (20, 'user_1665319981636', 5, 57);
INSERT INTO public.users VALUES (38, 'user_1665320086946', 5, 241);
INSERT INTO public.users VALUES (23, 'user_1665320009603', 2, 29);
INSERT INTO public.users VALUES (22, 'user_1665320009604', 5, 50);
INSERT INTO public.users VALUES (41, 'user_1665320091538', 2, 128);
INSERT INTO public.users VALUES (25, 'user_1665320023102', 2, 556);
INSERT INTO public.users VALUES (24, 'user_1665320023103', 5, 220);
INSERT INTO public.users VALUES (40, 'user_1665320091539', 5, 96);
INSERT INTO public.users VALUES (27, 'user_1665320026003', 2, 199);
INSERT INTO public.users VALUES (26, 'user_1665320026004', 5, 541);
INSERT INTO public.users VALUES (29, 'user_1665320029964', 2, 622);
INSERT INTO public.users VALUES (28, 'user_1665320029965', 5, 105);
INSERT INTO public.users VALUES (31, 'user_1665320035816', 2, 23);
INSERT INTO public.users VALUES (30, 'user_1665320035817', 5, 60);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 41, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

