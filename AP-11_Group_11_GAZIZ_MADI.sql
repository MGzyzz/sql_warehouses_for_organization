--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: brands; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.brands OWNER TO madi_gaziz;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO madi_gaziz;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO madi_gaziz;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO madi_gaziz;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: contractors; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.contractors (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.contractors OWNER TO madi_gaziz;

--
-- Name: contractors_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.contractors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contractors_id_seq OWNER TO madi_gaziz;

--
-- Name: contractors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.contractors_id_seq OWNED BY public.contractors.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer NOT NULL,
    brand_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO madi_gaziz;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO madi_gaziz;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: transitions; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.transitions (
    id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    product_id integer NOT NULL,
    contractor_id integer NOT NULL,
    warehouse_from_id integer NOT NULL,
    warehouse_to_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT transitions_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.transitions OWNER TO madi_gaziz;

--
-- Name: transitions_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.transitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transitions_id_seq OWNER TO madi_gaziz;

--
-- Name: transitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.transitions_id_seq OWNED BY public.transitions.id;


--
-- Name: warehouse_products; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.warehouse_products (
    id integer NOT NULL,
    warehouse_id integer NOT NULL,
    products_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT warehouse_products_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.warehouse_products OWNER TO madi_gaziz;

--
-- Name: warehouse_products_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.warehouse_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouse_products_id_seq OWNER TO madi_gaziz;

--
-- Name: warehouse_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.warehouse_products_id_seq OWNED BY public.warehouse_products.id;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: madi_gaziz
--

CREATE TABLE public.warehouses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.warehouses OWNER TO madi_gaziz;

--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: madi_gaziz
--

CREATE SEQUENCE public.warehouses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouses_id_seq OWNER TO madi_gaziz;

--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: madi_gaziz
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: contractors id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.contractors ALTER COLUMN id SET DEFAULT nextval('public.contractors_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: transitions id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions ALTER COLUMN id SET DEFAULT nextval('public.transitions_id_seq'::regclass);


--
-- Name: warehouse_products id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouse_products ALTER COLUMN id SET DEFAULT nextval('public.warehouse_products_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.brands (id, name) FROM stdin;
1	Coca-Cola
2	Pepsi-Cola
3	Maxi tea
4	Tassay
5	Без бренда
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.categories (id, name) FROM stdin;
1	Напиток
2	Молочный
3	Табачный
4	Овощи
5	Фрукты
\.


--
-- Data for Name: contractors; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.contractors (id, name) FROM stdin;
1	Contractors 1
2	Contractors 2
3	Contractors 3
4	Contractors 4
5	Contractors 5
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.products (id, name, category_id, brand_id) FROM stdin;
1	Tassay	1	4
2	Coca-cola	1	1
3	Pepsi-cola	1	2
4	Fanta-Cola	1	1
5	Borjomi	1	4
6	Bon aqua	1	5
7	Rich	1	1
8	Maxi tea	1	3
10	Банан	5	5
9	Манго	5	5
\.


--
-- Data for Name: transitions; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.transitions (id, "timestamp", product_id, contractor_id, warehouse_from_id, warehouse_to_id, quantity) FROM stdin;
2	2023-05-20 15:10:20	3	3	2	4	50
4	2023-11-15 20:50:55	5	2	4	2	200
3	2023-10-11 18:35:20	9	5	3	3	100
5	2023-12-12 21:20:25	9	4	5	1	300
1	2023-01-01 12:00:00	10	1	1	5	10
6	2023-01-01 12:00:00	1	1	4	5	2000
7	2023-01-01 12:00:00	2	2	2	3	3000
8	2023-01-01 12:00:00	4	3	1	2	5000
9	2023-01-01 12:00:00	5	5	3	4	10000
10	2023-01-01 12:00:00	7	4	5	1	20000
11	2023-01-01 12:00:00	1	3	2	1	10000
12	2023-01-01 12:00:00	1	2	4	2	20000
13	2023-01-01 12:00:00	1	5	3	4	25000
14	2023-01-01 12:00:00	1	1	1	5	30000
15	2023-01-01 12:00:00	2	4	5	3	35000
16	2023-01-01 12:00:00	2	3	2	1	40000
17	2023-01-01 12:00:00	2	2	4	2	45000
18	2023-01-01 12:00:00	2	5	3	4	50000
19	2023-01-01 12:00:00	3	1	1	5	55000
20	2023-01-01 12:00:00	3	4	5	3	60000
21	2023-01-01 12:00:00	3	3	2	1	75000
22	2023-01-01 12:00:00	3	2	4	2	80000
23	2023-01-01 12:00:00	4	5	3	4	90000
24	2023-01-01 12:00:00	4	1	1	5	100000
25	2023-01-01 12:00:00	4	4	5	3	100500
26	2023-01-01 12:00:00	4	3	2	1	101000
27	2023-01-01 12:00:00	5	1	1	5	55000
28	2023-01-01 12:00:00	5	4	5	3	60000
29	2023-01-01 12:00:00	5	3	2	1	75000
30	2023-01-01 12:00:00	5	2	4	2	80000
31	2023-01-01 12:00:00	6	5	3	4	90000
32	2023-01-01 12:00:00	6	1	1	5	100000
33	2023-01-01 12:00:00	6	4	5	3	100500
34	2023-01-01 12:00:00	7	3	2	1	101000
35	2023-01-01 12:00:00	7	1	1	5	55000
36	2023-01-01 12:00:00	7	4	5	3	60000
37	2023-01-01 12:00:00	8	3	2	1	75000
38	2023-01-01 12:00:00	8	2	4	2	80000
\.


--
-- Data for Name: warehouse_products; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.warehouse_products (id, warehouse_id, products_id, quantity) FROM stdin;
1	4	1	50
2	1	5	100
3	5	5	150
4	4	3	200
5	3	2	500
6	2	4	1000
7	5	5	1500
8	1	5	2000
9	2	8	2500
10	3	1	3000
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: madi_gaziz
--

COPY public.warehouses (id, name) FROM stdin;
1	C-1
2	С-2
3	С-3
4	С-4
5	С-5
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.brands_id_seq', 5, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: contractors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.contractors_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.products_id_seq', 10, true);


--
-- Name: transitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.transitions_id_seq', 38, true);


--
-- Name: warehouse_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.warehouse_products_id_seq', 10, true);


--
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: madi_gaziz
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 5, true);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: contractors contractors_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.contractors
    ADD CONSTRAINT contractors_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: transitions transitions_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions
    ADD CONSTRAINT transitions_pkey PRIMARY KEY (id);


--
-- Name: warehouse_products warehouse_products_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouse_products
    ADD CONSTRAINT warehouse_products_pkey PRIMARY KEY (id);


--
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: transitions transitions_contractor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions
    ADD CONSTRAINT transitions_contractor_id_fkey FOREIGN KEY (contractor_id) REFERENCES public.contractors(id);


--
-- Name: transitions transitions_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions
    ADD CONSTRAINT transitions_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: transitions transitions_warehouse_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions
    ADD CONSTRAINT transitions_warehouse_from_id_fkey FOREIGN KEY (warehouse_from_id) REFERENCES public.warehouses(id);


--
-- Name: transitions transitions_warehouse_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.transitions
    ADD CONSTRAINT transitions_warehouse_to_id_fkey FOREIGN KEY (warehouse_to_id) REFERENCES public.warehouses(id);


--
-- Name: warehouse_products warehouse_products_products_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouse_products
    ADD CONSTRAINT warehouse_products_products_id_fkey FOREIGN KEY (products_id) REFERENCES public.products(id);


--
-- Name: warehouse_products warehouse_products_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: madi_gaziz
--

ALTER TABLE ONLY public.warehouse_products
    ADD CONSTRAINT warehouse_products_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);


--
-- PostgreSQL database dump complete
--

