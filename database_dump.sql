--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "Tyler";
ALTER ROLE "Tyler" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE galvanize_admin;
ALTER ROLE galvanize_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5833e0e0498d058c604274e91012b4d65';






--
-- Database creation
--

CREATE DATABASE galvanize_contacts WITH TEMPLATE = template0 OWNER = "Tyler";
REVOKE CONNECT,TEMPORARY ON DATABASE galvanize_contacts FROM PUBLIC;
GRANT ALL ON DATABASE galvanize_contacts TO galvanize_admin;
CREATE DATABASE movies WITH TEMPLATE = template0 OWNER = "Tyler";
CREATE DATABASE resume_builder WITH TEMPLATE = template0 OWNER = "Tyler";
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE tyler WITH TEMPLATE = template0 OWNER = "Tyler";


\connect galvanize_contacts

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: User; Type: TABLE; Schema: public; Owner: Tyler
--

CREATE TABLE "User" (
    id character varying NOT NULL,
    first_name text,
    last_name text,
    date_of_birth date,
    biography text,
    is_human boolean
);


ALTER TABLE "User" OWNER TO "Tyler";

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: Tyler
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO "Tyler";

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tyler
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: Tyler
--

CREATE TABLE contact (
    id integer NOT NULL,
    type character varying,
    value character varying,
    user_id character varying
);


ALTER TABLE contact OWNER TO "Tyler";

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: Tyler
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_seq OWNER TO "Tyler";

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tyler
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: Tyler
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: Tyler
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: Tyler
--

COPY "User" (id, first_name, last_name, date_of_birth, biography, is_human) FROM stdin;
5	Kyle	Coberly	1961-02-18	Web app developer, business dork, amatuer economist	t
6	CJ	Reynolds	2031-04-08	Does the man have the moustache, or does the moustache have the man?	t
8	Roberto	Ortega	2015-10-17	Llamas age faster than people	t
7	Danny	Fritz	1805-09-15	Definitely a human instructor, not a robot	f
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tyler
--

SELECT pg_catalog.setval('"User_id_seq"', 8, true);


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: Tyler
--

COPY contact (id, type, value, user_id) FROM stdin;
1	email	kyle.coberly@galvanize.com	5
2	cellphone	911	5
3	email	cj.reynolds@galvanize.com	6
4	email	robert.ortega@galvanize.com	8
5	email	danny.fritz@galvanize.com	7
6	homephone	0	7
\.


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tyler
--

SELECT pg_catalog.setval('contact_id_seq', 6, true);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: Tyler
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: Tyler
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: contact fk_user_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: Tyler
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fk_user_contact_id FOREIGN KEY (user_id) REFERENCES "User"(id) ON DELETE CASCADE;


--
-- Name: User; Type: ACL; Schema: public; Owner: Tyler
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE "User" TO galvanize_admin;


--
-- Name: contact; Type: ACL; Schema: public; Owner: Tyler
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE contact TO galvanize_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: Tyler
--

ALTER DEFAULT PRIVILEGES FOR ROLE "Tyler" GRANT SELECT,INSERT,DELETE,UPDATE ON TABLES  TO galvanize_admin;


--
-- PostgreSQL database dump complete
--


--

--
-- PostgreSQL database cluster dump complete
--
