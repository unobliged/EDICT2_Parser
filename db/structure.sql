--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: words; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE words (
    id integer NOT NULL,
    keys text,
    kanji text,
    kana text,
    definitions text,
    edict_id text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    keys_text text,
    def_array character varying[],
    def_text text
);


--
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE words_id_seq OWNED BY words.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY words ALTER COLUMN id SET DEFAULT nextval('words_id_seq'::regclass);


--
-- Name: words_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- Name: gin_index_words_def_array; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX gin_index_words_def_array ON words USING gin (def_array);


--
-- Name: trgm_gin_index_words_def_text; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX trgm_gin_index_words_def_text ON words USING gin (def_text gin_trgm_ops);


--
-- Name: trgm_gin_index_words_keys_text; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX trgm_gin_index_words_keys_text ON words USING gin (keys_text gin_trgm_ops);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20121003232755');

INSERT INTO schema_migrations (version) VALUES ('20121023210918');

INSERT INTO schema_migrations (version) VALUES ('20121024053301');

INSERT INTO schema_migrations (version) VALUES ('20121024212339');

INSERT INTO schema_migrations (version) VALUES ('20121024233839');

INSERT INTO schema_migrations (version) VALUES ('20121025042137');

INSERT INTO schema_migrations (version) VALUES ('20121025042235');

INSERT INTO schema_migrations (version) VALUES ('20121025042325');