--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: db_users; Type: TABLE; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE TABLE db_users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255)
);


ALTER TABLE public.db_users OWNER TO dropboxapp;

--
-- Name: db_users_id_seq; Type: SEQUENCE; Schema: public; Owner: dropboxapp
--

CREATE SEQUENCE db_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.db_users_id_seq OWNER TO dropboxapp;

--
-- Name: db_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dropboxapp
--

ALTER SEQUENCE db_users_id_seq OWNED BY db_users.id;


--
-- Name: db_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dropboxapp
--

SELECT pg_catalog.setval('db_users_id_seq', 2, true);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    title text,
    description text,
    db_user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.pages OWNER TO dropboxapp;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: dropboxapp
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO dropboxapp;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dropboxapp
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dropboxapp
--

SELECT pg_catalog.setval('pages_id_seq', 1, true);


--
-- Name: resources; Type: TABLE; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    title text,
    description text,
    page_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    resource_file_file_name character varying(255),
    resource_file_content_type character varying(255),
    resource_file_file_size integer,
    resource_file_updated_at timestamp without time zone
);


ALTER TABLE public.resources OWNER TO dropboxapp;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: dropboxapp
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO dropboxapp;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dropboxapp
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dropboxapp
--

SELECT pg_catalog.setval('resources_id_seq', 14, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dropboxapp;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dropboxapp
--

ALTER TABLE ONLY db_users ALTER COLUMN id SET DEFAULT nextval('db_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dropboxapp
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dropboxapp
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Data for Name: db_users; Type: TABLE DATA; Schema: public; Owner: dropboxapp
--

COPY db_users (id, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
2	2013-07-14 01:28:17.427546	2013-07-14 01:28:17.433438	test2@test.test	$2a$10$Y58.aH3jpPZispbl56WL9eQzPI.iWux/338MF2u2/2uS6iru0HamO	\N	\N	\N	1	2013-07-14 01:28:17.43303	2013-07-14 01:28:17.43303	127.0.0.1	127.0.0.1
1	2013-07-13 16:40:35.744665	2013-07-14 01:29:15.465133	test@test.test	$2a$10$Fi8w9seYpqWgLyoDvETMhOjSSx/w.cCfOCTCLoW4gdSJT8LxB01LW	\N	\N	\N	5	2013-07-14 01:29:15.464331	2013-07-14 01:28:06.192702	127.0.0.1	127.0.0.1
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: dropboxapp
--

COPY pages (id, title, description, db_user_id, created_at, updated_at) FROM stdin;
1	\N	\N	1	2013-07-13 17:05:09.204563	2013-07-13 17:05:20.391462
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: dropboxapp
--

COPY resources (id, title, description, page_id, created_at, updated_at, resource_file_file_name, resource_file_content_type, resource_file_file_size, resource_file_updated_at) FROM stdin;
1	\N	\N	1	2013-07-13 17:05:39.383517	2013-07-13 17:05:51.151168	\N	\N	\N	\N
2	goob	\N	\N	2013-07-14 02:08:27.252481	2013-07-14 02:08:27.252481	\N	\N	\N	\N
3	goob	ly	\N	2013-07-14 02:26:02.351205	2013-07-14 02:26:02.351205	\N	\N	\N	\N
4	lob	yist	\N	2013-07-14 02:26:09.451713	2013-07-14 02:26:09.451713	\N	\N	\N	\N
5	goobist	gooboid	\N	2013-07-14 02:37:41.132891	2013-07-14 02:37:41.132891	7-12_7_09_db_dump.sql	application/octet-stream	456353	2013-07-14 02:37:41.131304
6	s3!	bitchez	\N	2013-07-14 03:14:25.120399	2013-07-14 03:14:25.120399	1045210_265601600245261_1878338726_n.jpg	image/jpeg	78526	2013-07-14 03:14:25.118992
7	sdf	sdf	\N	2013-07-14 03:15:55.257563	2013-07-14 03:15:55.257563	\N	\N	\N	\N
8	\N	\N	\N	2013-07-14 05:11:52.363277	2013-07-14 05:11:52.363277	bulb_colored.png	image/png	224415	2013-07-14 05:11:52.358311
9	\N	\N	\N	2013-07-14 05:13:57.973904	2013-07-14 05:13:57.973904	bulb_colored.png	image/png	224415	2013-07-14 05:13:57.971684
10	\N	\N	\N	2013-07-14 05:14:50.330395	2013-07-14 05:14:50.330395	bulb_colored.png	image/png	224415	2013-07-14 05:14:50.32892
11	\N	\N	\N	2013-07-14 05:15:40.111682	2013-07-14 05:15:40.111682	1045210_265601600245261_1878338726_n.jpg	image/jpeg	78526	2013-07-14 05:15:40.11016
12	\N	\N	\N	2013-07-14 05:24:19.299211	2013-07-14 05:24:19.299211	bulb_colored.png	image/png	224415	2013-07-14 05:24:19.29765
13	gg		\N	2013-07-14 05:24:54.379805	2013-07-14 05:24:54.379805	\N	\N	\N	\N
14	\N	\N	\N	2013-07-14 05:25:07.943835	2013-07-14 05:25:07.943835	bulb_colored.png	image/png	224415	2013-07-14 05:25:07.943103
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dropboxapp
--

COPY schema_migrations (version) FROM stdin;
20130713162008
20130713162029
20130713165517
20130713165523
20130714023229
\.


--
-- Name: db_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dropboxapp; Tablespace: 
--

ALTER TABLE ONLY db_users
    ADD CONSTRAINT db_users_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: dropboxapp; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: dropboxapp; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: index_db_users_on_email; Type: INDEX; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE UNIQUE INDEX index_db_users_on_email ON db_users USING btree (email);


--
-- Name: index_db_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE UNIQUE INDEX index_db_users_on_reset_password_token ON db_users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dropboxapp; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: atlantis
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM atlantis;
GRANT ALL ON SCHEMA public TO atlantis;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

