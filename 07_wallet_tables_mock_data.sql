-- =======================================
-- WALLET TABLES MOCK DATA
-- =======================================

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


-- Mock data for customer_wallet
INSERT INTO public.customer_wallet VALUES (30011, 3001, 200.00);
INSERT INTO public.customer_wallet VALUES (30012, 3001, 145.15);
INSERT INTO public.customer_wallet VALUES (30021, 3002, 150.75);
INSERT INTO public.customer_wallet VALUES (30031, 3003, 169.45);
INSERT INTO public.customer_wallet VALUES (30041, 3004, 100.22);
INSERT INTO public.customer_wallet VALUES (30051, 3005, 123.45);
INSERT INTO public.customer_wallet VALUES (30061, 3006, 234.56);
INSERT INTO public.customer_wallet VALUES (30062, 3006, 120.00);
INSERT INTO public.customer_wallet VALUES (30063, 3006, 45.50);
INSERT INTO public.customer_wallet VALUES (30071, 3007, 145.67);
INSERT INTO public.customer_wallet VALUES (30081, 3008, 256.78);
INSERT INTO public.customer_wallet VALUES (30091, 3009, 167.89);
INSERT INTO public.customer_wallet VALUES (30101, 3010, 278.90);
INSERT INTO public.customer_wallet VALUES (30111, 3011, 189.01);
INSERT INTO public.customer_wallet VALUES (30121, 3012, 290.12);
INSERT INTO public.customer_wallet VALUES (30131, 3013, 201.23);
INSERT INTO public.customer_wallet VALUES (30141, 3014, 312.34);
INSERT INTO public.customer_wallet VALUES (30142, 3014, 280.25);
INSERT INTO public.customer_wallet VALUES (30151, 3015, 223.45);
INSERT INTO public.customer_wallet VALUES (30161, 3016, 334.56);
INSERT INTO public.customer_wallet VALUES (30171, 3017, 245.67);
INSERT INTO public.customer_wallet VALUES (30181, 3018, 356.78);
INSERT INTO public.customer_wallet VALUES (30191, 3019, 267.89);
INSERT INTO public.customer_wallet VALUES (30201, 3020, 278.90);
INSERT INTO public.customer_wallet VALUES (30211, 3021, 289.01);
INSERT INTO public.customer_wallet VALUES (30221, 3022, 300.12);
INSERT INTO public.customer_wallet VALUES (30231, 3023, 211.23);
INSERT INTO public.customer_wallet VALUES (30241, 3024, 222.34);
INSERT INTO public.customer_wallet VALUES (30251, 3025, 233.45);
INSERT INTO public.customer_wallet VALUES (30261, 3026, 244.56);
INSERT INTO public.customer_wallet VALUES (30271, 3027, 255.67);
INSERT INTO public.customer_wallet VALUES (30281, 3028, 266.78);
INSERT INTO public.customer_wallet VALUES (30291, 3029, 277.89);
INSERT INTO public.customer_wallet VALUES (30301, 3030, 288.90);
INSERT INTO public.customer_wallet VALUES (30302, 3030, 88.67);
INSERT INTO public.customer_wallet VALUES (30303, 3030, 100.00);
INSERT INTO public.customer_wallet VALUES (30311, 3031, 299.01);
INSERT INTO public.customer_wallet VALUES (30321, 3032, 210.12);
INSERT INTO public.customer_wallet VALUES (30331, 3033, 221.23);
INSERT INTO public.customer_wallet VALUES (30341, 3034, 232.34);
INSERT INTO public.customer_wallet VALUES (30351, 3035, 243.45);
INSERT INTO public.customer_wallet VALUES (30361, 3036, 254.56);
INSERT INTO public.customer_wallet VALUES (30371, 3037, 265.67);
INSERT INTO public.customer_wallet VALUES (30381, 3038, 276.78);
INSERT INTO public.customer_wallet VALUES (30391, 3039, 287.89);
INSERT INTO public.customer_wallet VALUES (30401, 3040, 298.90);
INSERT INTO public.customer_wallet VALUES (30411, 3041, 209.01);
INSERT INTO public.customer_wallet VALUES (30421, 3042, 220.12);
INSERT INTO public.customer_wallet VALUES (30431, 3043, 231.23);
INSERT INTO public.customer_wallet VALUES (30441, 3044, 242.34);
INSERT INTO public.customer_wallet VALUES (30451, 3045, 253.45);
INSERT INTO public.customer_wallet VALUES (30461, 3046, 264.56);
INSERT INTO public.customer_wallet VALUES (30471, 3047, 275.67);
INSERT INTO public.customer_wallet VALUES (30472, 3047, 125.00);
INSERT INTO public.customer_wallet VALUES (30481, 3048, 286.78);
INSERT INTO public.customer_wallet VALUES (30491, 3049, 297.89);
INSERT INTO public.customer_wallet VALUES (30501, 3050, 208.90);


-- Mock data for sales_outlet_wallet
INSERT INTO public.sales_outlet_wallet VALUES (31, 3, 1000.00);
INSERT INTO public.sales_outlet_wallet VALUES (41, 4, 2000.00);
INSERT INTO public.sales_outlet_wallet VALUES (51, 5, 1500.00);
INSERT INTO public.sales_outlet_wallet VALUES (61, 6, 1750.00);
INSERT INTO public.sales_outlet_wallet VALUES (71, 7, 2000.00);
INSERT INTO public.sales_outlet_wallet VALUES (81, 8, 1800.00);
INSERT INTO public.sales_outlet_wallet VALUES (91, 9, 800.00);
INSERT INTO public.sales_outlet_wallet VALUES (101, 10, 2500.00);
