--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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

--
-- Name: v1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA v1;


ALTER SCHEMA v1 OWNER TO postgres;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA v1;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: iso_639; Type: TABLE; Schema: v1; Owner: admin
--

CREATE TABLE v1.iso_639 (
    iso_639_2 character(3) NOT NULL,
    iso_639_english_name character varying NOT NULL,
    iso_639_korean_name character varying NOT NULL,
    iso_639_1 character(2)
);


ALTER TABLE v1.iso_639 OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: v1; Owner: admin
--

CREATE TABLE v1.users (
    user_id uuid DEFAULT v1.uuid_generate_v4() NOT NULL,
    user_invitee_id uuid,
    user_authority_id smallint NOT NULL,
    user_email character varying NOT NULL,
    user_pw character(97) NOT NULL,
    user_name character varying NOT NULL,
    user_phone character varying NOT NULL,
    user_country character(2) NOT NULL,
    user_verified boolean DEFAULT false NOT NULL,
    user_status boolean DEFAULT true NOT NULL,
    user_login_attempts_left smallint DEFAULT 5 NOT NULL,
    user_created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_subnational character varying NOT NULL
);


ALTER TABLE v1.users OWNER TO admin;

--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: v1; Owner: admin
--

ALTER TABLE ONLY v1.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: idx_user_user_authority_id; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_authority_id ON v1.users USING btree (user_authority_id);


--
-- Name: idx_user_user_country; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_country ON v1.users USING btree (user_country);


--
-- Name: idx_user_user_created_at; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_created_at ON v1.users USING btree (user_created_at DESC);


--
-- Name: idx_user_user_email; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_email ON v1.users USING btree (user_email);


--
-- Name: idx_user_user_invitee_id; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_invitee_id ON v1.users USING btree (user_invitee_id);


--
-- Name: idx_user_user_name; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_name ON v1.users USING btree (user_name);


--
-- Name: idx_user_user_phone; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_phone ON v1.users USING btree (user_phone);


--
-- Name: idx_user_user_status; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_status ON v1.users USING btree (user_status);


--
-- Name: idx_user_user_updated_at; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_updated_at ON v1.users USING btree (user_updated_at DESC);


--
-- Name: idx_user_user_verified; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX idx_user_user_verified ON v1.users USING btree (user_verified);


--
-- Name: iso_639_iso_639_1_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX iso_639_iso_639_1_idx ON v1.iso_639 USING btree (iso_639_1);


--
-- Name: iso_639_iso_639_2_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX iso_639_iso_639_2_idx ON v1.iso_639 USING btree (iso_639_2);


--
-- Name: iso_639_iso_639_english_name_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX iso_639_iso_639_english_name_idx ON v1.iso_639 USING btree (iso_639_english_name);


--
-- Name: iso_639_iso_639_korean_name_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX iso_639_iso_639_korean_name_idx ON v1.iso_639 USING btree (iso_639_korean_name);


--
-- Name: users users_users_fk; Type: FK CONSTRAINT; Schema: v1; Owner: admin
--

ALTER TABLE ONLY v1.users
    ADD CONSTRAINT users_users_fk FOREIGN KEY (user_invitee_id) REFERENCES v1.users(user_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

