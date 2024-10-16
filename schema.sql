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
-- Name: countries; Type: TABLE; Schema: v1; Owner: admin
--

CREATE TABLE v1.countries (
    country_iso_3166_1_alpha3 character(3) NOT NULL,
    country_iso_3166_1_alpha2 character(2) NOT NULL,
    country_iso_3166_1_numeric smallint NOT NULL,
    country_name_toki_pona character varying,
    country_name_english character varying,
    country_name_native character varying,
    country_e_164 smallint,
    country_language character varying,
    country_flag_url character varying,
    country_is_independent boolean NOT NULL
);


ALTER TABLE v1.countries OWNER TO admin;

--
-- Name: COLUMN countries.country_iso_3166_1_alpha3; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_iso_3166_1_alpha3 IS '''USA'', ''RUS'', ''KOR'' - three-letter alphanumeric code defined in ISO-3166-1-Alpha-3';


--
-- Name: COLUMN countries.country_iso_3166_1_alpha2; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_iso_3166_1_alpha2 IS '''US'', ''RU'', ''KR'' - two-letter alphanumeric code defined in ISO-3166-1-Alpha-2';


--
-- Name: COLUMN countries.country_iso_3166_1_numeric; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_iso_3166_1_numeric IS '''001'', ''422''';


--
-- Name: COLUMN countries.country_name_toki_pona; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_name_toki_pona IS 'Country name in Toki Pona';


--
-- Name: COLUMN countries.country_name_english; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_name_english IS 'Country name in English';


--
-- Name: COLUMN countries.country_name_native; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_name_native IS 'Country name in native language as defined in country_language column';


--
-- Name: COLUMN countries.country_e_164; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_e_164 IS 'Country''s phone number code as defined in E.164';


--
-- Name: COLUMN countries.country_language; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_language IS 'Country''s official or de facto majority language';


--
-- Name: COLUMN countries.country_flag_url; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_flag_url IS 'URL to a SVG of the country''s flag';


--
-- Name: COLUMN countries.country_is_independent; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON COLUMN v1.countries.country_is_independent IS 'Boolean for whether a country is independent or not';


--
-- Name: languages; Type: TABLE; Schema: v1; Owner: admin
--

CREATE TABLE v1.languages (
);


ALTER TABLE v1.languages OWNER TO admin;

--
-- Name: TABLE languages; Type: COMMENT; Schema: v1; Owner: admin
--

COMMENT ON TABLE v1.languages IS 'Languages as defined by ISO-639.';


--
-- Name: users; Type: TABLE; Schema: v1; Owner: admin
--

CREATE TABLE v1.users (
    user_id uuid DEFAULT v1.uuid_generate_v4() NOT NULL,
    user_invitee_id uuid,
    user_authority_id smallint DEFAULT 0 NOT NULL,
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
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: v1; Owner: admin
--

ALTER TABLE ONLY v1.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (country_iso_3166_1_alpha3);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: v1; Owner: admin
--

ALTER TABLE ONLY v1.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: countries_country_e_164_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX countries_country_e_164_idx ON v1.countries USING btree (country_e_164);


--
-- Name: countries_country_is_independent_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX countries_country_is_independent_idx ON v1.countries USING btree (country_is_independent);


--
-- Name: countries_country_iso_3166_1_numeric_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX countries_country_iso_3166_1_numeric_idx ON v1.countries USING btree (country_iso_3166_1_numeric);


--
-- Name: countries_country_iso_639_1_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX countries_country_iso_639_1_idx ON v1.countries USING btree (country_iso_3166_1_alpha2);


--
-- Name: countries_country_language_idx; Type: INDEX; Schema: v1; Owner: admin
--

CREATE INDEX countries_country_language_idx ON v1.countries USING btree (country_language);


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
-- Name: users users_users_fk; Type: FK CONSTRAINT; Schema: v1; Owner: admin
--

ALTER TABLE ONLY v1.users
    ADD CONSTRAINT users_users_fk FOREIGN KEY (user_invitee_id) REFERENCES v1.users(user_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

