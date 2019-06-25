--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)

-- Started on 2019-06-24 21:18:27 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE servicedesk;
--
-- TOC entry 2917 (class 1262 OID 40961)
-- Name: servicedesk; Type: DATABASE; Schema: -; Owner: dimitri
--

CREATE DATABASE servicedesk WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE servicedesk OWNER TO dimitri;

\connect servicedesk

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13041)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 196 (class 1259 OID 40965)
-- Name: seq_user; Type: SEQUENCE; Schema: public; Owner: dimitri
--

CREATE SEQUENCE public.seq_user
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE public.seq_user OWNER TO dimitri;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 40967)
-- Name: user; Type: TABLE; Schema: public; Owner: dimitri
--

CREATE TABLE public."user" (
    id_user bigint DEFAULT nextval('public.seq_user'::regclass) NOT NULL,
    username character varying(35) NOT NULL,
    password character varying(80) NOT NULL,
    profile integer NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    api_token character varying(80)
);


ALTER TABLE public."user" OWNER TO dimitri;

--
-- TOC entry 2911 (class 0 OID 40967)
-- Dependencies: 197
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dimitri
--

INSERT INTO public."user" (id_user, username, password, profile, email, created_at, updated_at, api_token) VALUES (3, 'devuser', '$2y$10$EJhmz7ovquWB3jmIw1yLeu9AG4HFMGodIxcPlNyal91IthfVtaOya', 1, 'mafer@example.com', '2019-06-23 21:37:23', '2019-06-24 21:10:11', 'DVQ8qcxVZf9YKupE1S46UNWcnxpRVX1twnjNWFfGn7T5JCDbR8fZEBcfRg5s');


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 196
-- Name: seq_user; Type: SEQUENCE SET; Schema: public; Owner: dimitri
--

SELECT pg_catalog.setval('public.seq_user', 3, true);


--
-- TOC entry 2788 (class 2606 OID 40972)
-- Name: user paws_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dimitri
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT paws_user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-06-24 21:18:27 -05

--
-- PostgreSQL database dump complete
--

