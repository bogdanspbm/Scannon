--
-- PostgreSQL database dump
--

-- Dumped from database version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.22 (Ubuntu 10.22-0ubuntu0.18.04.1)

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: errors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.errors (
    id integer NOT NULL,
    type character varying,
    eng character varying,
    rus character varying
);


ALTER TABLE public.errors OWNER TO postgres;

--
-- Name: errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.errors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.errors_id_seq OWNER TO postgres;

--
-- Name: errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.errors_id_seq OWNED BY public.errors.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id integer NOT NULL,
    name character varying,
    levels integer[],
    icon character varying
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO postgres;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_id_seq OWNED BY public."group".id;


--
-- Name: level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level (
    id integer NOT NULL,
    name character varying,
    sequences integer[],
    icon character varying
);


ALTER TABLE public.level OWNER TO postgres;

--
-- Name: level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.level_id_seq OWNER TO postgres;

--
-- Name: level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.level_id_seq OWNED BY public.level.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metrics (
    user_id integer,
    level_id integer,
    expression_id integer,
    event_type character varying,
    error_type character varying,
    hit_expression character varying,
    score integer,
    "time" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.metrics OWNER TO postgres;

--
-- Name: sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sequence (
    id integer NOT NULL,
    expressions character varying
);


ALTER TABLE public.sequence OWNER TO postgres;

--
-- Name: sequence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequence_id_seq OWNER TO postgres;

--
-- Name: sequence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sequence_id_seq OWNED BY public.sequence.id;


--
-- Name: statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistics (
    id integer NOT NULL,
    user_id integer,
    error_id integer,
    pos_amount integer,
    neg_amount integer
);


ALTER TABLE public.statistics OWNER TO postgres;

--
-- Name: statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statistics_id_seq OWNER TO postgres;

--
-- Name: statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistics_id_seq OWNED BY public.statistics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying,
    key character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: errors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.errors ALTER COLUMN id SET DEFAULT nextval('public.errors_id_seq'::regclass);


--
-- Name: group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group" ALTER COLUMN id SET DEFAULT nextval('public.group_id_seq'::regclass);


--
-- Name: level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level ALTER COLUMN id SET DEFAULT nextval('public.level_id_seq'::regclass);


--
-- Name: sequence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence ALTER COLUMN id SET DEFAULT nextval('public.sequence_id_seq'::regclass);


--
-- Name: statistics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics ALTER COLUMN id SET DEFAULT nextval('public.statistics_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: errors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.errors (id, type, eng, rus) FROM stdin;
1	brackets_open_only_for_first_argument	\N	\N
2	negative_first_number	\N	\N
3	minus_on_minus_is_plus	\N	\N
4	multiplication_commutativity	\N	\N
5	additional_operands_reducing	\N	\N
6	big_amount_of_transformations	\N	\N
7	sum_operation_mistake	\N	\N
8	mul_mistake	\N	\N
9	brackets_open_mistake	\N	\N
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."group" (id, name, levels, icon) FROM stdin;
2	Hard Calculations	{4,5,6}	square-root.png
3	Reinforce Calculations	{7}	think.png
1	Calculations	{1,2,3}	bracket.png
\.


--
-- Data for Name: level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level (id, name, sequences, icon) FROM stdin;
1	Level 1	{2,3,4,5,6,7,8}	\N
2	Level 2	{9,10,11}	\N
3	Level 3	{12,13,14,15,16,17}	\N
4	Level 4	{18,19,20,21,22}	\N
5	Level 5	{23,24,25,26,27}	\N
6	Level 6	{28,29,30}	\N
7	Level 7	{31,32,33,34,35,36,37,38}	\N
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metrics (user_id, level_id, expression_id, event_type, error_type, hit_expression, score, "time") FROM stdin;
\.


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sequence (id, expressions) FROM stdin;
2	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"630/(4y-5-9+2y)-56=7"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"630/(4y-5-9+2y)=7 + 56"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"630/(4y-5-9+2y)=61"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"630=61*(4y-5-9+2y)"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"630/61=(4y-5-9+2y)"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"10=(4y-5-9+2y)"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"10=4y-5-9+2y"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"24=6y"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"5=y"}],"id":-1}
3	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"320(78-5x-2x)/2/8-=370/5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"320(78-5x-2x)/16-=370/5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"20(78-5x-2x)=370/5"},{"types":["multiplication_commutativity"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"20/5(78-5x-2x)=370"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"4(78-5x-2x)=370"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"78-5x-2x=370/4"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"78-5x-2x=90"},{"types":["negative_first_number"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"7x = 12"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x = 2"}],"id":-1}
4	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"32*(15-2d+12d-8)/8/2=440"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"32*(15-2d+12d-8)/16=440"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2*(15-2d+12d-8)=440"},{"types":["multiplication_commutativity"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(15-2d+12d-8)=880"},{"types":["additional_operands_reducing"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"15+14d-8=880"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"14d=882"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"d = 63"}],"id":-1}
5	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"144(83-4y+6y-8y)/12/6=17*2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"12(83-4y+6y-8y)/6=17*2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2(83-4y+6y-8y)=17*2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(83-4y+6y-8y)=17"},{"types":["brackets_open_only_for_first_argument"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"83-4y+6y+8y=17"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"83+10y=17"},{"types":["negative_first_number"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"10y=75"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"y=7.5"}],"id":-1}
6	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"4(5x+x+120)/24+3x=660/5"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"20(5x+x+120)/24+3x=660"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(5x+x+120)/24+3x=33"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(5x+x+120)+3x=33*24"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"9x = 33*24-120"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"9x =792-120"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x=74"}],"id":-1}
7	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"84-16a-18a=8a"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"84-34a=8a"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"84=42a"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 84 / 42"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"a = 3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
8	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(7(x + 10) - 23) / 4 - 13 = 30"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(7(x + 10) - 23) / 4 = 16"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"7(x + 10) - 23 = 64"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"7(x + 10) = 91"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x + 10 = 13"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x = 3"}],"id":-1}
9	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((0.5a + 4) / 15 * 3 - 12) * 4 + 14 = 14"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((0.5a + 4) / 15 * 3 - 12) * 4 = 0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(0.5a + 4) / 15 * 3 - 12 = 0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(0.5a + 4) / 15 * 3 = 12"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(0.5a + 4) / 15 = 5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"0.5a + 4 = 75"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"0.5a = 71"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"a = 162"}],"id":-1}
10	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((2y - 23) / 25 + 2) * 11 - 7= 37"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((2y - 23) / 25 + 2) * 11 = 44"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(2y - 23) / 25 + 2 = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(2y - 23) / 25 = 2"},{"types":["brackets_open_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2y + 23 = 50"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2y = 73"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"y = 36"}],"id":-1}
11	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((16b - 1) * 7 + 1) / 100 * 30 = 15"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((16b - 1) * 7 + 1) / 100 = 0.5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(16b - 1) * 7 + 1 = 50"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(16b - 1) * 7 = 50"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"16b - 1 = 7"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"16b = 8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"b = 0.5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
12	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((17(3c - 5) - 3) / 7 * 16 + 8) / 8 = 5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(17(3c - 5) - 3) / 7 * 16 + 8 = 40"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(17(3c - 5) - 3) / 7 * 16 = 32"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(17(3c - 5) - 3) / 7 = 2"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"17(3c - 5) - 3 = 16"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"17(3c - 5) = 17"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3c - 5 = 1"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"3c = -3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"c = -1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
13	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((x * 4 - 7) * 2 - 14) / 7 = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(x * 4 - 7) * 2 - 14 = 28"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(x * 4 - 7) * 2 = 32"},{"types":["brackets_open_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x * 4 + 7 = 16"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x * 4 = 8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x = 2"}],"id":-1}
14	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((2a -5) * 8 + 8) / 60 + 13 - 4 = 19"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((2a -5) * 8 + 8) / 60 + 13 = 15"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"((2a -5) * 8 + 8) / 60 = 28"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(2a -5) * 8 + 8 = 0.5"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(2a -5) * 8 = -8"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2a - 5 = 1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2a = 6"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 3"}],"id":-1}
15	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((y - 6 + 3) * 8 / 6 - 2) * 7 + 15 = 29"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((y - 6 + 3) * 8 / 6 - 2) * 7 = 14"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(y - 6 + 3) * 8 / 6 - 2 = 2"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(y - 6 + 3) * 8 / 6 = 6"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(y - 6 + 3) * 8 = 36"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"y - 6 + 3 = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"y - 6 = 1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"y = 7"}],"id":-1}
16	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(2(a - 3) - 3 + 7) / 13 - 5 + 42 = 39"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(2(a - 3) - 3 + 7) / 13 - 5 = -3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(2(a - 3) - 3 + 7) / 13 = 2"},{"types":["brackets_open_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2(a - 3) + 3 + 7 = 26"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2(a - 3) + 3 = 19"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2(a - 3) = 16"},{"types":["brackets_open_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"a + 3 = 8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
17	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((14(b - 16) - 11) / 3 + 5) / 9 + 2 = 20"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((14(b - 16) - 11) / 3 + 5) / 9 = 2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(14(b - 16) - 11) / 3 + 5 = 18"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(14(b - 16) - 11) / 3 = 13"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"14(b - 16) - 11 = 39"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"14(b - 16) = 28"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"b - 16 = 2"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"b = 17"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
18	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((sqrt((a*20)-1) + 2994) - 276.1)*0.36=982,164"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(sqrt((a*20)-1) + 2994) - 276.1=2729.9"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((a*20)-1) + 2994=3006"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"sqrt((a*20)-1)=13"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(a*20)-21=169"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a*20=180"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 9"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
19	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(396-b*4)*3-279=30"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(396-b*4)*3=315"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"396-b*4=105"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"b*4=210"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"b = 50.25"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
20	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(100+600%(((c*3 + 7)*20)/10))*56=5600"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"600%(((c*3 + 7)*20)/10)+100=100"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"600%(((c*3 + 7)*20)/10)=0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((c*3 + 7)*20)/10=30"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(c*3 + 7)*20=340"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"c*3 + 7=17"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"c*3=10"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"c = 3.12"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
21	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(sqrt((d*2.5+22.5)*2 + 32.5 + 36.5)+34)*0.2=9.7"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((d*2.5+22.5)*2 + 32.5 + 36.5)+34=49"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((d*2.5+22.5)*2 + 32.5 + 36.5)=15"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(d*2.5+22.5)*2 + 32.5 + 36.5=361"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(d*2.5+22.5)*2 + 32.5=324.5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(d*2.5+22.5)*2=292"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"d*2.5+22.5=145"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"d*2.5=122.5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"d = 49"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
22	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(sqrt((((e-8)*sqrt(4)-763)%7)+(-4)) + 56)%23+51=60"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(sqrt((((e-8)*sqrt(4)-763)%7)+(-4)) + 56)%23=9"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((((e-8)*sqrt(4)-763)%7)+(-4)) + 56=55"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"sqrt((((e-8)*sqrt(4)-763)%7)+(-4))=0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((e-8)*sqrt(4)-763)%7)+(-4)=0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((e-8)*sqrt(4)-763)%7=4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(e-8)*sqrt(4)-763=837"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(e-8)*sqrt(4)=1600"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"e-8=900"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"e = 908"}],"id":-1}
23	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((f*10+0.9)%12+34-7)*8=360"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(f*10+0.9)%12+34-7=45"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(f*10+0.9)%12+34=52"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(f*10+0.9)%12=18"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"f*10+0.9=58"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"f*10=57.1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"f=5.71"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
24	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((v+(-49))*100)%200+67-1049)*0.00001=0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((v+(-49))*100)%200+67-1049=-981"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((v+(-49))*100)%200+67=68"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((v+(-49))*100)%200=1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(v+(-49))*100=201"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"v+(-49)=50-48"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"v=50"}],"id":-1}
25	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((f*2)/3+43.05)/0.5-5612+0.0123=-3814.02-1607.9677"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((f*2)/3+43.05)/0.5-5612=-5422"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((f*2)/3+43.05)/0.5=190"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(f*2)/3+43.05=95.5"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(f*2)/3=52"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"f*2=156"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"f=-78"}],"id":-1}
26	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((((q*q)/sqrt(q)*2+81)%10+375)*3+678)/3-274=333"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((((q*q)/sqrt(q)*2+81)%10+375)*3+678)/3=607"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((q*q)/sqrt(q)*2+81)%10+375)*3+678=1821"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(((q*q)/sqrt(q)*2+81)%10+375)*3=1149"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((q*q)/sqrt(q)*2+81)%10+375=383"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((q*q)/sqrt(q)*2+81)%10=8"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(q*q)/sqrt(q)*2+81=89"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(q*q)/sqrt(q)*2=8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(q*q)/sqrt(q)=4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"q*q=16"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"q=4"}],"id":-1}
27	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((((g*0.5+45.05)*23+83)%7+17)*0.1-123+221)+0.9=11"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"sqrt((((g*0.5+45.05)*23+83)%7+17)*0.1-123+221)=10"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((g*0.5+45.05)*23+83)%7+17)*0.1-123+221=10*10"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((g*0.5+45.05)*23+83)%7+17)*0.1-123=-121"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(((g*0.5+45.05)*23+83)%7+17)*0.1=2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((g*0.5+45.05)*23+83)%7+17=20"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"((g*0.5+45.05)*23+83)%7=3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(g*0.5+45.05)*23+83=878"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(g*0.5+45.05)*23=805"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"g*0.5+45.05=35"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"g*0.5=-0.095-1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"g=-0.01"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
28	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2^(x+1)+2^(x-1)=28"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2^(x)*(2-2^(-1)+1)=28"},{"types":["brackets_open_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2^(x)*3.5=28"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2^(x)=8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x=3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
29	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3*9^y=81"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"3^(1+2y)=3^5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"1+2y=4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2y=2"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"y=1.5"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
30	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3^(x+4)+5^(x+3)*3=5^(x+4)+3^(x+3)"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3^(x+4)-3^(x+3)=5^(x+4)-5^(x+3)*3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3^(x)*54=5^(x)*250"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"0.6^(x)*0.216=1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"0.6^(x+3)=0.6^(0)"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x+3=0"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x=-3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":""}],"id":-1}
31	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"23(12p-2)+9(p-2)=1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"23*12p - 23*2 + 9(p-2)=1"},{"types":["brackets_open_only_for_first_argument"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"256p - 46 + 9p - 2 = 1"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"265p = 1 + 2 + 46"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"265p = 50"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"p = 0.2"}],"id":-1}
32	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2(x+3) + 6(p-2) + 3(1-2p) = 15"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2x + 6 + 6p - 12 + 4 - 6p = 15"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2x + 6 - 12 + 4  = 15"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2x = 15 - 4 + 12 - 6"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2x = 17"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x = 8"}],"id":-1}
33	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"13(a+1) + 4(a+x) - 18a = 20 "},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"13 + 13a + 4(a+x) - 18a = 20 "},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"13 + 13a + 4a + 4x - 18a = 20 "},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"13 + 17a + 4a - 18a = 20 "},{"types":["additional_operands_reducing"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"13  + 4a = 20 "},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"4a = 8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 8 /4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"a = 2"}],"id":-1}
34	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"5x + 15a - 5(x+3a) - 12 = 50/2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"5x + 15a - 5x + 15a - 12 = 50/2"},{"types":["big_amount_of_transformations"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"6x + 15a - 5x - 15a - 12 = 25"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"6x - 5x - 12 = 25"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x  - 12 = 25"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x  = 25 + 12"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x = 36"}],"id":-1}
35	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(q+3)2 - 3(q-1) + 5(2+q) = 13"},{"types":["brackets_open_only_for_first_argument"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2q + 3 - 3q +3 + 10 + 5q = 13"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"4q +3 + 3 + 10 = 13"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"4q = 13 -3 - 3 - 10"},{"types":["negative_first_number"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"4q = 3"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"q = 1"}],"id":-1}
36	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(4(t-1) + 15) /2 + t = 2"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"(4(t-1) + 15)  + t = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"(4(t-1) + 15)  + t = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"4(t-1) + 15 + t = 4"},{"types":["brackets_open_only_for_first_argument"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"4t - 1 + 15 + t = 4"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"5t = 4 - 15 + 1"},{"types":["negative_first_number"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"5t = 10"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"t = 2"}],"id":-1}
37	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"2*(3+4(x-2)) / 4 = 3"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"2*(3+4(x-2))  = 13"},{"types":["brackets_open_only_for_first_argument"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"6 + 4(x-2) = 13"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"4(x-2) = 8"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x-2 = 2"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x = 4"}],"id":-1}
38	{"sequence":[{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"x-15 + 2(x-3) + 6 + x / 3 = 3"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"3x-45 + 6(x-3) + 18 + x  = 9"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"3x-45 + 6x-16 + 18 + x  = 9"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"10x -45 -`16 + 18 = 9"},{"types":[],"scoreForHit":-50,"scoreForSkip":30,"unicode":"10x = 9 + 45 + 16 - 18"},{"types":["sum_operation_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"10x = 55"},{"types":["mul_mistake"],"scoreForHit":30,"scoreForSkip":-50,"unicode":"x = 5"}],"id":-1}
\.


--
-- Data for Name: statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistics (id, user_id, error_id, pos_amount, neg_amount) FROM stdin;
3	1	1	3	2
4	1	6	27	1
5	1	5	35	94
6	1	7	54	51
9	1	9	0	0
2	1	4	0	26
1	1	2	2	2
8	1	8	3	0
7	1	3	0	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, key, password) FROM stdin;
\.


--
-- Name: errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.errors_id_seq', 9, true);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_id_seq', 3, true);


--
-- Name: level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_id_seq', 7, true);


--
-- Name: sequence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequence_id_seq', 38, true);


--
-- Name: statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statistics_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 305, true);


--
-- Name: errors errors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.errors
    ADD CONSTRAINT errors_pkey PRIMARY KEY (id);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: level level_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_id_key UNIQUE (id);


--
-- Name: level level_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level
    ADD CONSTRAINT level_pkey PRIMARY KEY (id);


--
-- Name: sequence sequence_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_id_key UNIQUE (id);


--
-- Name: sequence sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequence
    ADD CONSTRAINT sequence_pkey PRIMARY KEY (id);


--
-- Name: statistics statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics
    ADD CONSTRAINT statistics_pkey PRIMARY KEY (id);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

