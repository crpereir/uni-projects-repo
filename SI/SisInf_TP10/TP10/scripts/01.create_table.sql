drop table if exists trip;
drop table if exists station;


create table if not exists station(
station_id smallint not null,
station_name text,
lat real,
long real,
dock_count smallint,
city text,
installation_date date,
zip_code text,
PRIMARY KEY (station_id)
);

create table if not exists trip(
id integer not null,
duration integer,
start_time timestamp,
start_station_id smallint,
start_station_name text,
end_time timestamp,
end_station_id smallint,
end_station_name text,
bike_id smallint,
PRIMARY KEY (id),
FOREIGN KEY (start_station_id) REFERENCES  station(station_id),
FOREIGN KEY (end_station_id) REFERENCES  station(station_id)
);
