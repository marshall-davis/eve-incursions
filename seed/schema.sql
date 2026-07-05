CREATE TABLE communities (
  id SERIAL PRIMARY KEY,
  "communityName" varchar(32) NOT NULL,
  "communityTag" varchar(8) NOT NULL,
  channel varchar(32) NOT NULL,
  timezone varchar(32) NOT NULL,
  "activeSpawnID" int NOT NULL,
  "updateTime" int NOT NULL,
  "isHQ" int NOT NULL,
  "isAS" int NOT NULL,
  "isVG" int NOT NULL,
  language varchar(128) NOT NULL DEFAULT '',
  tank varchar(128) NOT NULL DEFAULT '',
  active int NOT NULL DEFAULT 1
);

CREATE TABLE mapconstellations (
  "regionID" int DEFAULT NULL,
  "constellationID" int NOT NULL PRIMARY KEY,
  "constellationName" varchar(100) DEFAULT NULL,
  x double precision DEFAULT NULL,
  y double precision DEFAULT NULL,
  z double precision DEFAULT NULL,
  "xMin" double precision DEFAULT NULL,
  "xMax" double precision DEFAULT NULL,
  "yMin" double precision DEFAULT NULL,
  "yMax" double precision DEFAULT NULL,
  "zMin" double precision DEFAULT NULL,
  "zMax" double precision DEFAULT NULL,
  "factionID" int DEFAULT NULL,
  radius real DEFAULT NULL
);

CREATE TABLE mapregions (
  "regionID" int NOT NULL PRIMARY KEY,
  "regionName" varchar(100) DEFAULT NULL,
  x double precision DEFAULT NULL,
  y double precision DEFAULT NULL,
  z double precision DEFAULT NULL,
  "xMin" double precision DEFAULT NULL,
  "xMax" double precision DEFAULT NULL,
  "yMin" double precision DEFAULT NULL,
  "yMax" double precision DEFAULT NULL,
  "zMin" double precision DEFAULT NULL,
  "zMax" double precision DEFAULT NULL,
  "factionID" int DEFAULT NULL,
  nebula int DEFAULT NULL,
  radius real DEFAULT NULL
);

CREATE TABLE migrations (
  id SERIAL PRIMARY KEY,
  migration varchar(255) NOT NULL,
  batch int NOT NULL
);

CREATE TABLE rat_groups (
  id int NOT NULL PRIMARY KEY,
  name varchar(128) NOT NULL DEFAULT '',
  rats text NOT NULL
);

CREATE TABLE solar_systems (
  "regionID" int DEFAULT NULL,
  "constellationID" int DEFAULT NULL,
  "solarSystemID" int NOT NULL PRIMARY KEY,
  "solarSystemName" varchar(100) DEFAULT NULL,
  x double precision DEFAULT NULL,
  y double precision DEFAULT NULL,
  z double precision DEFAULT NULL,
  "xMin" double precision DEFAULT NULL,
  "xMax" double precision DEFAULT NULL,
  "yMin" double precision DEFAULT NULL,
  "yMax" double precision DEFAULT NULL,
  "zMin" double precision DEFAULT NULL,
  "zMax" double precision DEFAULT NULL,
  luminosity double precision DEFAULT NULL,
  border smallint DEFAULT NULL,
  fringe smallint DEFAULT NULL,
  corridor smallint DEFAULT NULL,
  hub smallint DEFAULT NULL,
  international smallint DEFAULT NULL,
  regional smallint DEFAULT NULL,
  constellation smallint DEFAULT NULL,
  security double precision DEFAULT NULL,
  "factionID" int DEFAULT NULL,
  radius double precision DEFAULT NULL,
  "sunTypeID" int DEFAULT NULL,
  "securityClass" varchar(2) DEFAULT NULL,
  "systemType" varchar(32) DEFAULT NULL,
  "sovereigntyHolderName" varchar(64) DEFAULT NULL,
  "sovereigntyHolderID" int DEFAULT NULL,
  "systemSize" numeric(10,0) DEFAULT NULL,
  "isIsland" int DEFAULT NULL
);

CREATE INDEX ON solar_systems ("regionID");
CREATE INDEX ON solar_systems ("constellationID");

CREATE TABLE spawn_influence_logs (
  id SERIAL PRIMARY KEY,
  spawn_id int NOT NULL,
  influence real NOT NULL,
  date timestamp DEFAULT NULL
);

CREATE TABLE spawn_logs (
  id SERIAL PRIMARY KEY,
  spawn_id int NOT NULL,
  state varchar(32) NOT NULL,
  date timestamp DEFAULT NULL
);

CREATE TABLE spawns (
  id SERIAL PRIMARY KEY,
  "constellationID" int NOT NULL,
  influence real NOT NULL,
  "hasBoss" int NOT NULL,
  state varchar(32) NOT NULL,
  active int NOT NULL,
  type int NOT NULL,
  established_at timestamp DEFAULT NULL,
  ended_at timestamp DEFAULT NULL,
  updated_at timestamp DEFAULT CURRENT_TIMESTAMP,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ON spawns ("constellationID");

CREATE TABLE sta_operation_services (
  "operationID" int NOT NULL,
  "serviceID" int NOT NULL,
  PRIMARY KEY ("operationID", "serviceID")
);

CREATE TABLE sta_stations (
  "stationID" bigint NOT NULL PRIMARY KEY,
  security double precision DEFAULT NULL,
  "dockingCostPerVolume" double precision DEFAULT NULL,
  "maxShipVolumeDockable" double precision DEFAULT NULL,
  "officeRentalCost" int DEFAULT NULL,
  "operationID" int DEFAULT NULL,
  "stationTypeID" int DEFAULT NULL,
  "corporationID" int DEFAULT NULL,
  "solarSystemID" int DEFAULT NULL,
  "constellationID" int DEFAULT NULL,
  "regionID" int DEFAULT NULL,
  "stationName" varchar(100) DEFAULT NULL,
  x double precision DEFAULT NULL,
  y double precision DEFAULT NULL,
  z double precision DEFAULT NULL,
  "reprocessingEfficiency" double precision DEFAULT NULL,
  "reprocessingStationsTake" double precision DEFAULT NULL,
  "reprocessingHangarFlag" int DEFAULT NULL
);

CREATE INDEX ON sta_stations ("solarSystemID");
CREATE INDEX ON sta_stations ("operationID");
CREATE INDEX ON sta_stations ("constellationID");
CREATE INDEX ON sta_stations ("stationTypeID");
CREATE INDEX ON sta_stations ("corporationID");
CREATE INDEX ON sta_stations ("regionID");