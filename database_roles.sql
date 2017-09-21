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
-- PostgreSQL database cluster dump complete
--
