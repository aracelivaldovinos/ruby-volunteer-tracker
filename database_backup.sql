--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 13.3

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
-- Name: projects; Type: TABLE; Schema: public; Owner: aracelivaldovinos
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.projects OWNER TO aracelivaldovinos;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: aracelivaldovinos
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO aracelivaldovinos;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aracelivaldovinos
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: aracelivaldovinos
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    hours double precision,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO aracelivaldovinos;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: aracelivaldovinos
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO aracelivaldovinos;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aracelivaldovinos
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: aracelivaldovinos
--

COPY public.projects (id, name) FROM stdin;
713	Teaching Kids to Code
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: aracelivaldovinos
--

COPY public.volunteers (id, name, hours, project_id) FROM stdin;
368	Bob Hope	2.5	713
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aracelivaldovinos
--

SELECT pg_catalog.setval('public.projects_id_seq', 713, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aracelivaldovinos
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 368, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: aracelivaldovinos
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

