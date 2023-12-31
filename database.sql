CREATE TABLE public."Subjects"
(
    "subID" smallint NOT NULL DEFAULT nextval('"Subjects_subID_seq"'::regclass),
    "subName" character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT "Subjects_pkey" PRIMARY KEY ("subID")
)
CREATE TABLE public."bookMaster"
(
    "accNumber" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "bookTitle" character varying(100) COLLATE pg_catalog."default",
    "SubID" integer,
    "authorName" character varying(50) COLLATE pg_catalog."default",
    "PublisherName" character varying(50) COLLATE pg_catalog."default",
    pages smallint NOT NULL DEFAULT nextval('"bookMaster_pages_seq"'::regclass),
    price integer,
    status character varying(1) COLLATE pg_catalog."default",
    CONSTRAINT "bookMaster_pkey" PRIMARY KEY ("accNumber"),
    CONSTRAINT "FK_SubID" FOREIGN KEY ("SubID")
        REFERENCES public."Subjects" ("subID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE public."IssueReturn"
(
    "transID" smallint NOT NULL DEFAULT nextval('"IssueReturn_transID_seq"'::regclass),
    "userID" integer,
    "AccNumber" character varying(10) COLLATE pg_catalog."default",
    "IssueDate" date,
    "ExpRetDate" date,
    "ActRetDate" date,
    "OverdueDays" integer,
    CONSTRAINT "IssueReturn_pkey" PRIMARY KEY ("transID"),
    CONSTRAINT fk_accno FOREIGN KEY ("AccNumber")
        REFERENCES public."bookMaster" ("accNumber") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_userID" FOREIGN KEY ("userID")
        REFERENCES public.users ("userID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
CREATE TABLE public.users
(
    "userID" smallint NOT NULL DEFAULT nextval('"users_userID_seq"'::regclass),
    "userName" character varying(50) COLLATE pg_catalog."default",
    "userType" character varying(10) COLLATE pg_catalog."default",
    password character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY ("userID")
)