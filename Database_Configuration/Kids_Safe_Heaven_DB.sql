-- Table: public.parkapi_park

-- DROP TABLE public.parkapi_park;

CREATE TABLE public.parkapi_park
(
    id integer NOT NULL DEFAULT nextval('parkapi_park_id_seq'::regclass),
    park_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    park_facility character varying(60)[] COLLATE pg_catalog."default",
    park_equipment character varying(60)[] COLLATE pg_catalog."default",
    park_score numeric(4,2) NOT NULL,
    location geometry(Point,4326),
    CONSTRAINT parkapi_park_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.parkapi_park
    OWNER to postgresql;
-- Index: parkapi_park_location_id

-- DROP INDEX public.parkapi_park_location_id;

CREATE INDEX parkapi_park_location_id
    ON public.parkapi_park USING gist
    (location)
    TABLESPACE pg_default;