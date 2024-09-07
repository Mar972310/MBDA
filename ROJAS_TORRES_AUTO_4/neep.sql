/*Tablas*/
CREATE TABLE staff(
    id_s        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE modle(
    id_m        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE event(
    id_e        VARCHAR(20) NOT NULL,
    modle       VARCHAR(20),
    kind        CHAR(1),
    dow         VARCHAR(15),
    tod         CHAR(5),
    duration    NUMBER(11), 
    room        VARCHAR(20)
);

CREATE TABLE teaches(
    staff       VARCHAR(20) NOT NULL,
    event       VARCHAR(20) NOT NULL
);
CREATE TABLE occurs (
    event       VARCHAR(20) NOT NULL, 
    week        VARCHAR(20) NOT NULL
);




TRUNCATE TABLE occurs;
TRUNCATE TABLE teaches;
TRUNCATE TABLE event;
TRUNCATE TABLE staff;
TRUNCATE TABLE modle;

/*XTablas*/ 

DROP TABLE occurs;
DROP TABLE teaches;
DROP TABLE event;
DROP TABLE staff;
DROP TABLE modle;


