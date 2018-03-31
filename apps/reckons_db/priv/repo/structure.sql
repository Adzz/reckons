--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: loans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.loans (
    id bigint NOT NULL,
    principal integer,
    interest_rate double precision,
    duration integer,
    repayment_amount integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deal_id bigint NOT NULL
);


--
-- Name: COLUMN loans.principal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.loans.principal IS 'The amount borrowed';


--
-- Name: COLUMN loans.interest_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.loans.interest_rate IS 'the inerest rate as a decimal for the loan';


--
-- Name: COLUMN loans.duration; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.loans.duration IS 'The length of the loan in months';


--
-- Name: COLUMN loans.repayment_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.loans.repayment_amount IS 'The amount in £ that each repayment costs. It is assumed repayments are monthly';


--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.loans_id_seq OWNED BY public.loans.id;


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.portfolios (
    id bigint NOT NULL,
    name text,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: COLUMN portfolios.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.portfolios.name IS 'the name of the portfolio';


--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.portfolios_id_seq OWNED BY public.portfolios.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.properties (
    id bigint NOT NULL,
    portfolio_id bigint NOT NULL,
    number_of_bedrooms integer,
    rent_per_room integer,
    contract_length integer DEFAULT 48,
    stamp_duty integer,
    mortgage_fees integer,
    solicitors_fees integer,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: COLUMN properties.rent_per_room; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.properties.rent_per_room IS '  The £ amount we can charge for rent per room, per month.
';


--
-- Name: COLUMN properties.contract_length; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.properties.contract_length IS 'This is the length of the contract in weeks. This defaults to 48 weeks, giving us a month
to do maintenance on the property
';


--
-- Name: COLUMN properties.mortgage_fees; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.properties.mortgage_fees IS 'The cost of any mortgage fees for the initial purchase of the property';


--
-- Name: COLUMN properties.solicitors_fees; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.properties.solicitors_fees IS 'The cost of solicitors fees in £ for the purchase of the property';


--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


--
-- Name: loans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans ALTER COLUMN id SET DEFAULT nextval('public.loans_id_seq'::regclass);


--
-- Name: portfolios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN id SET DEFAULT nextval('public.portfolios_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: loans loans_deal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_deal_id_fkey FOREIGN KEY (deal_id) REFERENCES public.properties(id);


--
-- Name: properties properties_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20180330221839), (20180331095048), (20180331095054), (20180331105318);

