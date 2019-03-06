DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;
CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars WITH OWNER indexed_cars_user;

\c indexed_cars;

\i scripts/car_models.sql;

\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

\timing

-- SELECT make_title FROM car_models WHERE make_code = 'LAM' LIMIT 1;
    -- 1.841 ms
-- SELECT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R' LIMIT 1;
    -- 2.437 ms
-- SELECT make_code, model_code, model_title, year, now() FROM car_models WHERE make_code = 'LAM';
    -- 26.260 ms
-- SELECT * FROM car_models WHERE year <= 2015 AND year >= 2010;
    -- 103.462 ms
-- SELECT *, now() FROM car_models WHERE year = 2010;
    -- 48.319 ms

-- (make_code, make_title, model_code, model_title, year)
CREATE INDEX make_code_idx ON car_models (make_code);
CREATE INDEX make_title_idx ON car_models (make_title);
CREATE INDEX model_code_idx ON car_models (model_code);
CREATE INDEX model_title_idx ON car_models (model_title);
CREATE INDEX year_idx ON car_models (year);

-- SELECT make_title FROM car_models WHERE make_code = 'LAM' LIMIT 1;
    -- 0.833 ms
-- SELECT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R' LIMIT 1;
    -- 1.344 ms
-- SELECT make_code, model_code, model_title, year, now() FROM car_models WHERE make_code = 'LAM';
    -- 7.270 ms
-- SELECT * FROM car_models WHERE year <= 2015 AND year >= 2010;
    -- 92.756 ms
-- SELECT *, now() FROM car_models WHERE year = 2010;
    -- 28.029 ms