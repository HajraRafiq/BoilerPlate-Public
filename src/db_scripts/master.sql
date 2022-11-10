-- Adminer 4.7.6 PostgreSQL dump

DROP TABLE IF EXISTS "countries";
DROP SEQUENCE IF EXISTS countries_id_seq;
CREATE SEQUENCE countries_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."countries" (
    "id" integer DEFAULT nextval('countries_id_seq') NOT NULL,
    "name" character varying(320) NOT NULL,
    "full_name" character varying(640) NOT NULL,
    "national_id_regex" character varying(160) NOT NULL,
    "mobile_number_regex" character varying(160) NOT NULL,
    "currency_code" character varying(6) NOT NULL,
    "country_code" character varying(4) NOT NULL,
    "mcc" character(2) NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "country_icon" text NOT NULL,
    "placeholders" jsonb,
    "highlighted" boolean DEFAULT false NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now() NOT NULL,
    CONSTRAINT "countries_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "countries_country_code" ON "public"."countries" USING btree ("country_code");

CREATE INDEX "countries_currency_code" ON "public"."countries" USING btree ("currency_code");

CREATE INDEX "countries_mcc" ON "public"."countries" USING btree ("mcc");

INSERT INTO "countries" ("id", "name", "full_name", "national_id_regex", "mobile_number_regex", "currency_code", "country_code", "mcc", "enabled", "country_icon", "placeholders", "highlighted", "dt", "dtu") VALUES
(2,	'USA',	'United States Of America',	'^([0-9]{9})(X|V)$',	'^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$',	'USD',	'US',	'1 ',	't',	'https://drive.google.com/uc?export=view&id=1ZJSbCOTonOJrpb8V74v1XFwajxSRtZOx',	NULL,	'f',	'2021-01-07 17:00:02.119982+05',	'2021-01-07 17:00:02.119982+05'),
(1,	'Pakistan',	'Islamic Republic Of Pakistan',	'^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$',	'^(923)\\d{9}$',	'PKR',	'PK',	'92',	't',	'https://drive.google.com/uc?export=view&id=1is-bAw4kqMdIfnE9ElxZCRBprpZu9o3l',	'{"mobile": "034512345678", "national_id": "44201-4890860-7"}',	'f',	'2021-01-07 17:00:02.119982+05',	'2021-01-07 17:00:02.119982+05');

DROP TABLE IF EXISTS "deposit_channels";
DROP SEQUENCE IF EXISTS deposit_channels_id_seq;
CREATE SEQUENCE deposit_channels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."deposit_channels" (
    "id" integer DEFAULT nextval('deposit_channels_id_seq') NOT NULL,
    "channel_name" character varying(160) NOT NULL,
    "channel_validation_regex" character varying(160) NOT NULL,
    "enabled" boolean NOT NULL,
    "channel_icon" text,
    "highlighted" boolean DEFAULT false NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    "channel_min_limit" integer DEFAULT '0' NOT NULL,
    "channel_max_limit" integer DEFAULT '0' NOT NULL,
    "sample_format" character varying(160),
    "field_type" character varying(160),
    CONSTRAINT "deposit_channels_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "deposit_channels_channel_name" ON "public"."deposit_channels" USING btree ("channel_name");

INSERT INTO "deposit_channels" ("id", "channel_name", "channel_validation_regex", "enabled", "channel_icon", "highlighted", "dt", "dtu", "channel_min_limit", "channel_max_limit", "sample_format", "field_type") VALUES
(1,	'Easy Paisa',	'^(03)\d{9}$',	'1',	'https://drive.google.com/uc?export=view&id=1vzRPix0Xro9Le76rSGx_bJqPmX3KrKAR',	'1',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'03412345678',	'number'),
(25,	'Ubank',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1wcgx-1XCn0-k9hI6BxX6p-BuyIzTwQ4s',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(4,	'Al Baraka Bank Limited',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1rvX2iObMQYxtOhKyshoci0UARQzqfaqX',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(30,	'Askari Commercial Bank',	'^(PK\d{2}ASCM[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1Xj18H62MTCCPyYTkyQpUgi99oiONZUIm',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73ASCM0001010100632040',	'alphanumeric'),
(6,	'Apna Microfinance Bank',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=15wfFRqAuP5kLjjD1fvKbLWd0PDM30QsQ',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(8,	'Bank Al Habib Limited',	'^(PK\d{2}BAHL[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=199t_ZwghiaLxwGq-hke8bW4fhymQKeWa',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73BAHL0001010100632040',	'alphanumeric'),
(10,	'Bank Islami Pakistan Limited',	'^(PK\d{2}BKIP[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1JfD7N5lipjZBLT0ovoRcUukR3WFcEvX2',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73BKIP0001010100632040',	'alphanumeric'),
(11,	'Citi Bank',	'^(PK\d{2}CITI[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1jgqcUGc4YlYzl9PsET6HKfcROphPwu7C',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73CITI0001010100632040',	'alphanumeric'),
(12,	'Dubai Islamic Bank Pakistan Limited',	'^(PK\d{2}DUIB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1lprG9CaaoZxwd5OcCoLVteq-S0dbqXiC',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73DUIB0001010100632040',	'alphanumeric'),
(13,	'Faysal Bank Limited',	'^(PK\d{2}FAYS[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1WRR_KMI82GB1IT51rFqk_zKaEqRC8LIA',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73FAYS0001010100632040',	'alphanumeric'),
(14,	'Habib Bank Limited',	'^(PK\d{2}HABB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1VY6YWlaxqAzRrBDYWIIUYEE40qz5Nj3l',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73HABB0001010100632040',	'alphanumeric'),
(17,	'JS Bank',	'^(PK\d{2}JSBL[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1ktY7ZbWzQUyVuIkPgZ8XgtRUDNnRuWEE',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73JSBL0001010100632040',	'alphanumeric'),
(31,	'MCB Islamic Bank',	'^(PK\d{2}MCUB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1iSobEmxMmwdjXiiVB-a42U5-YbqQDGs3',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MCUB0001010100632040',	'alphanumeric'),
(21,	'Silk Bank',	'^(PK\d{2}SAUD[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=124zHwVIJ8IlOTx_ihZSZ547AsM5jMhJk',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73SAUD0001010100632040',	'alphanumeric'),
(18,	'MCB Bank',	'^(PK\d{2}MCUB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1F3BdvwOTl797ruqDMos4ZChytb58SogV',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MCUB0001010100632040',	'alphanumeric'),
(3,	'United Bank Limited',	'^(PK\d{2}UNIL[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=13H3f3yicutYCLNlQQuSgqZwvhccUFCke',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73UNIL0001010100632040',	'alphanumeric'),
(16,	'ICBC',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1Tmc7Oovhg14cgnMZzT81kEuCbiY-zQLX',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(19,	'Mobilink Microfinance',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1EMEQLW3KYixN7gYuQQdRv8AS9cxg9tdd',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(23,	'Soneri Bank',	'^(PK\d{2}SONE[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1Dgi8g5tzv_LOa7A0us2udeJg9zAbwoSp',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73SONE0001010100632040',	'alphanumeric'),
(22,	'Sindh Bank',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1QB4LmusE3MiwzI209Ddori7xLCRBG9_T',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(24,	'Summit Bank',	'^(PK\d{2}SUMB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=14vtezAbvdNvGnc6_4Bpp5fEsqj1cqNvs',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73SUMB0001010100632040',	'alphanumeric'),
(9,	'Bank Of Punjab',	'^(PK\d{2}BPUN[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1xsqtxxUITR_lpn3EHmnyZue4dkVHdz3r',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73BPUN0001010100632040',	'alphanumeric'),
(26,	'National Bank Of Pakistan',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1njbYQFKDQzekGRLS-CB-MeQzXoQaU0t0',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(15,	'Habib Metropolitan Bank Limited',	'^(PK\d{2}MBPL[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1sX3b4UEWdzAr90Gs-xpN1ZVhwFiYyYze',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MBPL0001010100632040',	'alphanumeric'),
(28,	'Telenor Microfinance',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1JvFVkgz3jhjBvYVE9B-rnb5wS214zEYl',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(29,	'NRSP Microfinance',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1Zk24ZrrZ4UM9CWwY7oH5cq_wAEzoZj2l',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(7,	'Bank Alfalah Limited',	'^(PK\d{2}ALFH[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=19svKzX_DaMlB3_Yd7iRRukpEN8vprC-Y',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73ALFH0001010100632040',	'alphanumeric'),
(20,	'Samba Bank',	'^(PK\d{2}SAMB[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1Y1q4A8evHRXGA9_fXme1PVEFikZ4as-e',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73SAMB0001010100632040',	'alphanumeric'),
(32,	'First Women Bank Limited',	'^(PK\d{2}[A-Z]{4}[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=18lSPNfCqudrD_hA68Nbwrtl_3NF-eK40',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(27,	'Standard Chartered',	'^(PK\d{2}SCBL[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1DVK5qJqPmQY0mYY9OFq8p7AMnk8KXa_l',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73SCBL0001010100632040',	'alphanumeric'),
(33,	'Jazz Cash',	'^(03)\d{9}$',	'1',	'https://drive.google.com/uc?export=view&id=1pzB77E3CMjVBLOhg7Ftl7iBgkeoB4j6n',	'1',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'03002345678',	'number'),
(2,	'Meezan Bank',	'^(PK\d{2}MEZN[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1wcgx-1XCn0-k9hI6BxX6p-BuyIzTwQ4s',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73MEZN0001010100632040',	'alphanumeric'),
(5,	'Allied Bank Limited',	'^(PK\d{2}ABPA[A-Z0-9]{16})$',	'1',	'https://drive.google.com/uc?export=view&id=1ra_a6zNF253IHcWnQyxMqld7lBsRiP6H',	'0',	'2020-10-23 07:13:21.284394+00',	'2020-10-23 07:13:21.284394+00',	500,	25000,	'PK73ABPA0001010100632040',	'alphanumeric');

DROP TABLE IF EXISTS "dynamic_content";
DROP SEQUENCE IF EXISTS dynamic_content_id_seq;
CREATE SEQUENCE dynamic_content_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."dynamic_content" (
    "id" integer DEFAULT nextval('dynamic_content_id_seq') NOT NULL,
    "content_group" character varying(24) NOT NULL,
    "content_type" character varying(24) NOT NULL,
    "content_location" character varying(128) NOT NULL,
    "content_title" character varying(256) NOT NULL,
    "content_dom" text NOT NULL,
    "enabled" boolean DEFAULT false NOT NULL,
    "dt" timestamptz NOT NULL,
    "dtu" timestamptz DEFAULT now()
) WITH (oids = false);

INSERT INTO "dynamic_content" ("id", "content_group", "content_type", "content_location", "content_title", "content_dom", "enabled", "dt", "dtu") VALUES
(1,	'static',	'json',	'how_it_works',	'How it works',	'[
{
"title": "Title",
"subtitle": "Subtitle",
"video": "https://www.youtube.com/embed/lqM24RVZmjA?autoplay=0&color=white",
"order":0
},
{
"title": "Title",
"subtitle": "Subtitle",
"video": "https://www.youtube.com/embed/lqM24RVZmjA?autoplay=0&color=white",
"order": 1
}
]',	'1',	'2021-01-05 09:00:48.028982+00',	'2021-01-05 09:00:48.028982+00'),
(2,	'static',	'json',	'home_page',	'Welcome',	'[
{
"video": "https://www.youtube.com/embed/lqM24RVZmjA?autoplay=0&color=white",
"order":0
}
]',	'1',	'2021-01-05 09:00:48.028982+00',	'2021-01-05 09:00:48.028982+00');

DROP TABLE IF EXISTS "payment_channels";
DROP SEQUENCE IF EXISTS payment_channels_id_seq;
CREATE SEQUENCE payment_channels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."payment_channels" (
    "id" integer DEFAULT nextval('payment_channels_id_seq') NOT NULL,
    "title" character varying(160) NOT NULL,
    "channel_config" jsonb NOT NULL,
    "enabled" boolean NOT NULL,
    "channel_icon" text,
    "dt" timestamp DEFAULT now() NOT NULL,
    "dtu" timestamp DEFAULT now(),
    "channel_min_limit" integer DEFAULT '0' NOT NULL,
    "channel_max_limit" integer DEFAULT '0' NOT NULL,
    "highlighted" boolean DEFAULT false NOT NULL,
    "channel_service" character varying(160),
    "channel_fee_config" jsonb,
    CONSTRAINT "payment_channels_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "payment_channels_channel_service" ON "public"."payment_channels" USING btree ("channel_service");

INSERT INTO "payment_channels" ("id", "title", "channel_config", "enabled", "channel_icon", "dt", "dtu", "channel_min_limit", "channel_max_limit", "highlighted", "channel_service", "channel_fee_config") VALUES
(4,	'Topup Balance Transfer',	'[{"path": "topup"}]',	'0',	'https://apprecs.org/ios/images/app-icons/256/24/1227725092.jpg',	'2020-08-26 12:03:14.059395',	'2020-08-26 12:03:14.059395',	10,	200,	'0',	NULL,	'{"sender": {}, "receiver": {"fee": 70, "fare": 80}}'),
(3,	'Cash Pickup',	'{"url": "bykeacash", "paths": {"normal": "/#number/#txid/#url", "customized": "/payer-invoice/#tinyurl/#url"}}',	'1',	'https://drive.google.com/uc?export=view&id=11JgLgdonR2MnULpgXSqJl2qHGWmzsSjS',	'2020-08-26 12:03:14.059395',	'2020-08-26 12:03:14.059395',	200,	25000,	'0',	'svcBykeaCash',	'{"sender": {}, "receiver": {"fee": 70, "fare": 80}}'),
(2,	'VISA/Master Card',	'{"url": "card", "paths": {"normal": "/#number/#txid/#url", "customized": "/payer-invoice/#tinyurl/#url"}}',	'1',	'https://drive.google.com/uc?export=view&id=1p9YkN5Fwdnxvb3e_DfQopP3bMi814_TV',	'2020-08-26 12:03:14.059395',	'2020-08-26 12:03:14.059395',	200,	25000,	'0',	'svcCheckoutJs',	'{"sender": {"mdr": 3, "type": "p"}, "receiver": {"fee": 70}}');

DROP TABLE IF EXISTS "payment_links";
DROP SEQUENCE IF EXISTS payment_links_id_seq;
CREATE SEQUENCE payment_links_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."payment_links" (
    "id" integer DEFAULT nextval('payment_links_id_seq') NOT NULL,
    "payment_request_id" integer NOT NULL,
    "actual_link" character varying(512),
    "new_link" character varying(512),
    "link_hash" double precision,
    "enabled" boolean NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    CONSTRAINT "payment_links_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "payment_links_actual_link" ON "public"."payment_links" USING btree ("actual_link");

CREATE INDEX "payment_links_link_hash" ON "public"."payment_links" USING btree ("link_hash");

CREATE INDEX "payment_links_new_link" ON "public"."payment_links" USING btree ("new_link");

CREATE INDEX "payment_links_payment_request_id" ON "public"."payment_links" USING btree ("payment_request_id");


DROP TABLE IF EXISTS "payment_requests";
DROP SEQUENCE IF EXISTS payment_requests_id_seq;
CREATE SEQUENCE payment_requests_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."payment_requests" (
    "id" integer DEFAULT nextval('payment_requests_id_seq') NOT NULL,
    "receiver_number" character varying(160) NOT NULL,
    "receiver_name" character varying(320) NOT NULL,
    "deposit_channel" character varying(320) NOT NULL,
    "deposit_channel_id" integer NOT NULL,
    "deposit_number" character varying(320) NOT NULL,
    "sender_number" character varying(160),
    "sender_email" character varying(320),
    "receiver_lat" real NOT NULL,
    "receiver_lng" real NOT NULL,
    "tracking_code" character varying NOT NULL,
    "request_verified" boolean DEFAULT false NOT NULL,
    "request_completed" boolean DEFAULT false NOT NULL,
    "extra_params" jsonb,
    "request_amount" real NOT NULL,
    "request_currency" character varying(4) NOT NULL,
    "is_email" boolean DEFAULT false NOT NULL,
    "dt" timestamp DEFAULT now() NOT NULL,
    "dtu" timestamp DEFAULT now(),
    "order_id" character varying(12),
    "receiver_id" integer DEFAULT '0' NOT NULL,
    "sender_id" integer DEFAULT '0' NOT NULL,
    "link_hash" double precision DEFAULT '0',
    "tx_status_id" integer,
    "tx_status_text" character varying(32),
    "request_viewed" boolean DEFAULT false,
    "view_count" integer DEFAULT '0' NOT NULL,
    "bykea_cash_ride" character varying(38),
    "checkoutjs_tid" character varying(256),
    "payment_channel" integer DEFAULT '0',
    "bykea_tracking_code" character varying(12),
    CONSTRAINT "payment_requests_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "payment_requests_bykea_cash_ride" ON "public"."payment_requests" USING btree ("bykea_cash_ride");

CREATE INDEX "payment_requests_bykea_tracking_code" ON "public"."payment_requests" USING btree ("bykea_tracking_code");

CREATE INDEX "payment_requests_deposit_channel_id" ON "public"."payment_requests" USING btree ("deposit_channel_id");

CREATE INDEX "payment_requests_receiver_id" ON "public"."payment_requests" USING btree ("receiver_id");

CREATE INDEX "payment_requests_receiver_number" ON "public"."payment_requests" USING btree ("receiver_number");

CREATE INDEX "payment_requests_sender_email" ON "public"."payment_requests" USING btree ("sender_email");

CREATE INDEX "payment_requests_sender_id" ON "public"."payment_requests" USING btree ("sender_id");

CREATE INDEX "payment_requests_sender_number" ON "public"."payment_requests" USING btree ("sender_number");

CREATE INDEX "payment_requests_tracking_code" ON "public"."payment_requests" USING btree ("tracking_code");

CREATE INDEX "payment_requests_tx_status_id" ON "public"."payment_requests" USING btree ("tx_status_id");

CREATE INDEX "payment_requests_tx_status_text" ON "public"."payment_requests" USING btree ("tx_status_text");


DROP TABLE IF EXISTS "receiver_accounts";
DROP SEQUENCE IF EXISTS receiver_accounts_id_seq;
CREATE SEQUENCE receiver_accounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."receiver_accounts" (
    "id" integer DEFAULT nextval('receiver_accounts_id_seq') NOT NULL,
    "number" character varying(24) NOT NULL,
    "name" character varying(160) NOT NULL,
    "raptor_uuid" character varying(36),
    "talos_oid" character varying(36),
    "opening_balance" real DEFAULT '0' NOT NULL,
    "closing_balance" real DEFAULT '0' NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "dt" timestamp DEFAULT now() NOT NULL,
    "dtu" timestamp DEFAULT now(),
    "google_id" character varying(236),
    "fb_id" character varying(236)
) WITH (oids = false);

CREATE INDEX "receiver_accounts_number" ON "public"."receiver_accounts" USING btree ("number");

CREATE INDEX "receiver_accounts_raptor_uuid" ON "public"."receiver_accounts" USING btree ("raptor_uuid");

CREATE INDEX "receiver_accounts_talos_oid" ON "public"."receiver_accounts" USING btree ("talos_oid");


DROP TABLE IF EXISTS "sender_accounts";
DROP SEQUENCE IF EXISTS sender_accounts_id_seq;
CREATE SEQUENCE sender_accounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."sender_accounts" (
    "id" integer DEFAULT nextval('sender_accounts_id_seq') NOT NULL,
    "number" character varying(24),
    "name" character varying(160),
    "raptor_uuid" character varying(36),
    "talos_oid" character varying(36),
    "opening_balance" real DEFAULT '0' NOT NULL,
    "closing_balance" real DEFAULT '0' NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "dt" timestamp DEFAULT now() NOT NULL,
    "dtu" timestamp DEFAULT now(),
    "google_id" character varying(236),
    "fb_id" character varying(236),
    "email" character varying
) WITH (oids = false);

CREATE INDEX "sender_accounts_email" ON "public"."sender_accounts" USING btree ("email");

CREATE INDEX "sender_accounts_number" ON "public"."sender_accounts" USING btree ("number");

CREATE INDEX "sender_accounts_raptor_uuid" ON "public"."sender_accounts" USING btree ("raptor_uuid");

CREATE INDEX "sender_accounts_talos_oid" ON "public"."sender_accounts" USING btree ("talos_oid");


DROP TABLE IF EXISTS "sender_requests";
DROP SEQUENCE IF EXISTS sender_requests_id_seq;
CREATE SEQUENCE sender_requests_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."sender_requests" (
    "id" integer DEFAULT nextval('sender_requests_id_seq') NOT NULL,
    "receiver_number" character varying(160) NOT NULL,
    "receiver_name" character varying(320) NOT NULL,
    "sender_number" character varying(160),
    "receiver_lat" real NOT NULL,
    "receiver_lng" real NOT NULL,
    "tracking_code" character varying NOT NULL,
    "request_verified" boolean DEFAULT false NOT NULL,
    "request_completed" boolean DEFAULT false NOT NULL,
    "extra_params" jsonb,
    "request_amount" real NOT NULL,
    "request_currency" character varying(4) NOT NULL,
    "request_details" character varying(512),
    "receiver_id" integer DEFAULT '0' NOT NULL,
    "sender_id" integer DEFAULT '0' NOT NULL,
    "tx_status_id" integer,
    "tx_status_text" character varying(32),
    "payment_channel" integer,
    "dt" timestamp DEFAULT now() NOT NULL,
    "dtu" timestamp DEFAULT now(),
    "bykea_cash_ride" character varying(38),
    "checkoutjs_tid" character varying(256),
    "bykea_tracking_code" character varying(12),
    CONSTRAINT "sender_requests_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "sender_requests_bykea_cash_ride" ON "public"."sender_requests" USING btree ("bykea_cash_ride");

CREATE INDEX "sender_requests_bykea_tracking_code" ON "public"."sender_requests" USING btree ("bykea_tracking_code");

CREATE INDEX "sender_requests_payment_channel" ON "public"."sender_requests" USING btree ("payment_channel");

CREATE INDEX "sender_requests_receiver_id" ON "public"."sender_requests" USING btree ("receiver_id");

CREATE INDEX "sender_requests_receiver_number" ON "public"."sender_requests" USING btree ("receiver_number");

CREATE INDEX "sender_requests_sender_id" ON "public"."sender_requests" USING btree ("sender_id");

CREATE INDEX "sender_requests_sender_number" ON "public"."sender_requests" USING btree ("sender_number");

CREATE INDEX "sender_requests_tracking_code" ON "public"."sender_requests" USING btree ("tracking_code");

CREATE INDEX "sender_requests_tx_status_id" ON "public"."sender_requests" USING btree ("tx_status_id");

CREATE INDEX "sender_requests_tx_status_text" ON "public"."sender_requests" USING btree ("tx_status_text");


DROP TABLE IF EXISTS "settings";
DROP SEQUENCE IF EXISTS settings_id_seq;
CREATE SEQUENCE settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."settings" (
    "id" integer DEFAULT nextval('settings_id_seq') NOT NULL,
    "field_group" character varying(512) NOT NULL,
    "field_name" character varying(512) NOT NULL,
    "field_value" text NOT NULL,
    "field_type" character varying(16) NOT NULL,
    "enabled" boolean NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    CONSTRAINT "settings_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "settings_field_group" ON "public"."settings" USING btree ("field_group");

CREATE INDEX "settings_field_name" ON "public"."settings" USING btree ("field_name");

CREATE INDEX "settings_field_type" ON "public"."settings" USING btree ("field_type");

INSERT INTO "settings" ("id", "field_group", "field_name", "field_value", "field_type", "enabled", "dt", "dtu") VALUES
(1,	'sms_apis',	'eocean',	'http://bykea.eocean.us:24555/api?action=sendmessage&username=bykea_9210_api&password=ByKeAqwecd&recipient=#receiver&originator=9210&messagedata=#msg',	'string',	'1',	'2020-11-10 06:07:14.912049+00',	'2020-11-10 06:07:14.912049+00'),
(4,	'sms_apis',	'default',	'm3tech',	'string',	'1',	'2020-11-10 06:08:08.399203+00',	'2020-11-10 06:08:08.399203+00'),
(2,	'sms_apis',	'm3tech',	'https://secure.m3techservice.com/GenericService/WebService_4_0.asmx/SendSMS',	'string',	'1',	'2020-11-10 06:08:08.399203+00',	'2020-11-10 06:08:08.399203+00'),
(3,	'm3tech',	'config',	'{
"Password": "-9TXo@56jPx",
"UserId": "sms@bykea",
"MsgId": "939393",
"MsgHeader": "939393",
"SMSChannel": "Tech",
"SMSType": 0,
"HandsetPort": 0,
"Telco": ""
}',	'json',	'1',	'2020-11-10 06:18:32.802897+00',	'2020-11-10 06:18:32.802897+00'),
(6,	'self_initiate',	'sender_amount_min',	'200',	'number',	'1',	'2020-12-21 12:03:51.046181+00',	'2020-12-21 12:03:51.046181+00'),
(5,	'self_initiate',	'sender_amount_max',	'7700',	'number',	'1',	'2020-12-21 12:03:51.046181+00',	'2020-12-21 12:03:51.046181+00'),
(8,	'ivr_apis',	'default',	'eocean',	'string',	'1',	'2020-11-10 06:08:08.399203+00',	'2020-11-10 06:08:08.399203+00'),
(9,	'ivr_apis',	'eocean',	'http://ivr.eocean.us/cgi-bin/test_eocean_otp/outbound.cgi?number=#receiver&code=#otvc',	'string',	'1',	'2020-11-10 06:08:08.399203+00',	'2020-11-10 06:08:08.399203+00'),
(7,	'bykea_cash',	'tracking_link',	'https://bykea1-tracker-frontend.bykea.dev/',	'string',	'1',	'2020-12-21 12:03:51.046181+00',	'2020-12-21 12:03:51.046181+00');

DROP TABLE IF EXISTS "source_accounts";
DROP SEQUENCE IF EXISTS source_accounts_id_seq;
CREATE SEQUENCE source_accounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."source_accounts" (
    "id" integer DEFAULT nextval('source_accounts_id_seq') NOT NULL,
    "number" character varying(24) NOT NULL,
    "name" character varying(160) NOT NULL,
    "opening_balance" real DEFAULT '0' NOT NULL,
    "closing_balance" real DEFAULT '0' NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "default_source" boolean DEFAULT true NOT NULL,
    "account_tag" character varying(16),
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    CONSTRAINT "source_accounts_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "source_accounts_account_tag" ON "public"."source_accounts" USING btree ("account_tag");

CREATE INDEX "source_accounts_number" ON "public"."source_accounts" USING btree ("number");

INSERT INTO "source_accounts" ("id", "number", "name", "opening_balance", "closing_balance", "enabled", "default_source", "account_tag", "dt", "dtu") VALUES
(1,	'03111234567',	'Bykea Cash',	1444.07,	1520.07,	'1',	'1',	'bykea_cash',	'2020-11-12 12:30:43.502186+00',	'2020-11-12 12:30:43.502186+00');

DROP TABLE IF EXISTS "transaction_states";
CREATE TABLE "public"."transaction_states" (
    "id" integer NOT NULL,
    "system_tag" character varying(36) NOT NULL,
    "state_default" boolean NOT NULL,
    "state_text" character varying NOT NULL,
    "enabled" boolean NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    CONSTRAINT "transaction_states_id" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "transaction_states_state_default" ON "public"."transaction_states" USING btree ("state_default");

CREATE INDEX "transaction_states_state_text" ON "public"."transaction_states" USING btree ("state_text");

CREATE INDEX "transaction_states_system_tag" ON "public"."transaction_states" USING btree ("system_tag");

INSERT INTO "transaction_states" ("id", "system_tag", "state_default", "state_text", "enabled", "dt", "dtu") VALUES
(1,	'pending',	'1',	'Pending',	'1',	'2020-10-29 08:07:57.223687+00',	'2020-10-29 08:07:57.223687+00'),
(2,	'cancelled',	'0',	'Cancelled',	'1',	'2020-11-11 09:27:24.953319+00',	'2020-11-11 09:27:24.953319+00'),
(3,	'complete',	'0',	'Complete',	'1',	'2020-11-11 09:27:24.953319+00',	'2020-11-11 09:27:24.953319+00'),
(4,	'inprogress',	'0',	'In Progress',	'1',	'2020-11-11 09:27:24.953319+00',	'2020-11-11 09:27:24.953319+00'),
(5,	'expired',	'0',	'Expired',	'1',	'2020-11-11 09:27:24.953319+00',	'2020-11-11 09:27:24.953319+00');

DROP TABLE IF EXISTS "transactions";
DROP SEQUENCE IF EXISTS transactions_id_seq;
CREATE SEQUENCE transactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."transactions" (
    "id" integer DEFAULT nextval('transactions_id_seq') NOT NULL,
    "amount_credited" real DEFAULT '0' NOT NULL,
    "amount_debited" real DEFAULT '0' NOT NULL,
    "previous_opening_balance" real DEFAULT '0' NOT NULL,
    "previous_closing_balance" real DEFAULT '0' NOT NULL,
    "account_id" integer NOT NULL,
    "account_type" character varying(160) NOT NULL,
    "txid" integer NOT NULL,
    "txsource" character varying(160) NOT NULL,
    "txhead" character varying(160) NOT NULL,
    "dt" timestamptz DEFAULT now() NOT NULL,
    "dtu" timestamptz DEFAULT now(),
    "comments" character varying(512),
    "tracking_code" character varying(12) NOT NULL
) WITH (oids = false);

CREATE INDEX "transactions_account_id" ON "public"."transactions" USING btree ("account_id");

CREATE INDEX "transactions_tracking_code" ON "public"."transactions" USING btree ("tracking_code");

CREATE INDEX "transactions_txid" ON "public"."transactions" USING btree ("txid");


-- 2021-01-06 09:09:25.188813+00
