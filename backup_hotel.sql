--
-- PostgreSQL database dump
--

\restrict fis0cbc7FrUHF8qMgknvVmFKViLuy0dAAYODLJkRqXPQoLtg2yavUdewSw9qmeA

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-25 16:30:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 17104)
-- Name: categoria_hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria_hotel (
    id_categoria integer NOT NULL,
    iva_categoria numeric(4,2) NOT NULL,
    descripcion text
);


ALTER TABLE public.categoria_hotel OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17103)
-- Name: categoria_hotel_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_hotel_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_hotel_id_categoria_seq OWNER TO postgres;

--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 219
-- Name: categoria_hotel_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_hotel_id_categoria_seq OWNED BY public.categoria_hotel.id_categoria;


--
-- TOC entry 226 (class 1259 OID 17146)
-- Name: habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion (
    id_habitacion integer NOT NULL,
    hotel_id integer NOT NULL,
    tipo_habitacion_id integer NOT NULL,
    piso_habitacion character(1) NOT NULL,
    num_habitacion character varying(3) NOT NULL
);


ALTER TABLE public.habitacion OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17145)
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitacion_id_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNER TO postgres;

--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 225
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitacion_id_habitacion_seq OWNED BY public.habitacion.id_habitacion;


--
-- TOC entry 222 (class 1259 OID 17115)
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    id_hotel integer NOT NULL,
    nombre_hotel character varying(50) NOT NULL,
    direccion_hotel text NOT NULL,
    tel_hotel character varying(15) NOT NULL,
    ano_construccion integer NOT NULL,
    categoria_hotel_id integer NOT NULL,
    CONSTRAINT hotel_ano_construccion_check CHECK (((ano_construccion)::numeric <= EXTRACT(year FROM CURRENT_DATE)))
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17114)
-- Name: hotel_id_hotel_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_id_hotel_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotel_id_hotel_seq OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 221
-- Name: hotel_id_hotel_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_id_hotel_seq OWNED BY public.hotel.id_hotel;


--
-- TOC entry 228 (class 1259 OID 17170)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id_reserva integer NOT NULL,
    id_habitacion_reserva integer NOT NULL,
    tipo_reserva character varying(20) NOT NULL,
    nom_cliente_reserva character varying(35) NOT NULL,
    dir_reserva text NOT NULL,
    tel_reserva character varying(15) NOT NULL,
    fecha_inicio_reserva date NOT NULL,
    fecha_fin_reserva date NOT NULL,
    precio_reserva numeric(8,2) NOT NULL,
    CONSTRAINT reserva_check CHECK ((fecha_fin_reserva > fecha_inicio_reserva)),
    CONSTRAINT reserva_fecha_inicio_reserva_check CHECK ((fecha_inicio_reserva >= CURRENT_DATE))
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17169)
-- Name: reserva_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reserva_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reserva_id_reserva_seq OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 227
-- Name: reserva_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;


--
-- TOC entry 224 (class 1259 OID 17136)
-- Name: tipo_habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_habitacion (
    id_tipo_habitacion integer NOT NULL,
    nombre_tipo_habitacion character varying(30) NOT NULL,
    precio_tipo_habitacion numeric(7,2) NOT NULL
);


ALTER TABLE public.tipo_habitacion OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17135)
-- Name: tipo_habitacion_id_tipo_habitacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_habitacion_id_tipo_habitacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_habitacion_id_tipo_habitacion_seq OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 223
-- Name: tipo_habitacion_id_tipo_habitacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_habitacion_id_tipo_habitacion_seq OWNED BY public.tipo_habitacion.id_tipo_habitacion;


--
-- TOC entry 4876 (class 2604 OID 17107)
-- Name: categoria_hotel id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_hotel ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_hotel_id_categoria_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 17149)
-- Name: habitacion id_habitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion ALTER COLUMN id_habitacion SET DEFAULT nextval('public.habitacion_id_habitacion_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 17118)
-- Name: hotel id_hotel; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN id_hotel SET DEFAULT nextval('public.hotel_id_hotel_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 17173)
-- Name: reserva id_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva ALTER COLUMN id_reserva SET DEFAULT nextval('public.reserva_id_reserva_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 17139)
-- Name: tipo_habitacion id_tipo_habitacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitacion ALTER COLUMN id_tipo_habitacion SET DEFAULT nextval('public.tipo_habitacion_id_tipo_habitacion_seq'::regclass);


--
-- TOC entry 5048 (class 0 OID 17104)
-- Dependencies: 220
-- Data for Name: categoria_hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria_hotel VALUES (1, 16.00, '5 Estrellas - Lujo');
INSERT INTO public.categoria_hotel VALUES (2, 16.00, '3 Estrellas - Estándar');


--
-- TOC entry 5054 (class 0 OID 17146)
-- Dependencies: 226
-- Data for Name: habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.habitacion VALUES (1, 1, 3, '1', '101');
INSERT INTO public.habitacion VALUES (2, 1, 2, '1', '102');
INSERT INTO public.habitacion VALUES (3, 2, 1, '2', '201');
INSERT INTO public.habitacion VALUES (4, 2, 2, '2', '202');


--
-- TOC entry 5050 (class 0 OID 17115)
-- Dependencies: 222
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hotel VALUES (1, 'Grand Hotel Palace', 'Av. Central 123', '555-1000', 2015, 1);
INSERT INTO public.hotel VALUES (2, 'Hotel Express', 'Calle Comercio 45', '555-2000', 2020, 2);


--
-- TOC entry 5056 (class 0 OID 17170)
-- Dependencies: 228
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva VALUES (1, 3, 'Persona Fisica', 'Alejandro Gonzalez', 'Palma 342 Col. Insurgentes GDL 4321', '3331234567', '2026-10-12', '2026-10-13', 500.00);
INSERT INTO public.reserva VALUES (2, 1, 'Persona Fisica', 'Carlos Mendoza Ruiz', 'Av. Vallarta 1234, Col Americana, Guadalajara, Jalisco, 44160', '33 1234 5678', '2026-10-12', '2026-10-15', 4500.00);


--
-- TOC entry 5052 (class 0 OID 17136)
-- Dependencies: 224
-- Data for Name: tipo_habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_habitacion VALUES (1, 'Individual', 500.00);
INSERT INTO public.tipo_habitacion VALUES (2, 'Doble', 850.00);
INSERT INTO public.tipo_habitacion VALUES (3, 'Suite', 1500.00);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 219
-- Name: categoria_hotel_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_hotel_id_categoria_seq', 2, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 225
-- Name: habitacion_id_habitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitacion_id_habitacion_seq', 4, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 221
-- Name: hotel_id_hotel_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_id_hotel_seq', 2, true);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 227
-- Name: reserva_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 2, true);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 223
-- Name: tipo_habitacion_id_tipo_habitacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_habitacion_id_tipo_habitacion_seq', 3, true);


--
-- TOC entry 4885 (class 2606 OID 17113)
-- Name: categoria_hotel categoria_hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria_hotel
    ADD CONSTRAINT categoria_hotel_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4891 (class 2606 OID 17158)
-- Name: habitacion habitacion_hotel_id_piso_habitacion_num_habitacion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_hotel_id_piso_habitacion_num_habitacion_key UNIQUE (hotel_id, piso_habitacion, num_habitacion);


--
-- TOC entry 4893 (class 2606 OID 17156)
-- Name: habitacion habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_pkey PRIMARY KEY (id_habitacion);


--
-- TOC entry 4887 (class 2606 OID 17129)
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id_hotel);


--
-- TOC entry 4895 (class 2606 OID 17188)
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 4889 (class 2606 OID 17144)
-- Name: tipo_habitacion tipo_habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitacion
    ADD CONSTRAINT tipo_habitacion_pkey PRIMARY KEY (id_tipo_habitacion);


--
-- TOC entry 4897 (class 2606 OID 17159)
-- Name: habitacion habitacion_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotel(id_hotel);


--
-- TOC entry 4898 (class 2606 OID 17164)
-- Name: habitacion habitacion_tipo_habitacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion
    ADD CONSTRAINT habitacion_tipo_habitacion_id_fkey FOREIGN KEY (tipo_habitacion_id) REFERENCES public.tipo_habitacion(id_tipo_habitacion);


--
-- TOC entry 4896 (class 2606 OID 17130)
-- Name: hotel hotel_categoria_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_categoria_hotel_id_fkey FOREIGN KEY (categoria_hotel_id) REFERENCES public.categoria_hotel(id_categoria);


--
-- TOC entry 4899 (class 2606 OID 17189)
-- Name: reserva reserva_id_habitacion_reserva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_id_habitacion_reserva_fkey FOREIGN KEY (id_habitacion_reserva) REFERENCES public.habitacion(id_habitacion);


-- Completed on 2026-10-25 16:30:19

--
-- PostgreSQL database dump complete
--

\unrestrict fis0cbc7FrUHF8qMgknvVmFKViLuy0dAAYODLJkRqXPQoLtg2yavUdewSw9qmeA

