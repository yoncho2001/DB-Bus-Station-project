CREATE TABLE АВТОГАРА(
    МЕСТОПОЛОЖЕНИЕ CHAR(50) NOT NULL PRIMARY KEY ,
    АДРЕС CHAR(100)
);

CREATE TABLE КАСИЕРИ(
    СЛУЖЕБЕН№ CHAR(10) NOT NULL PRIMARY KEY ,
    ТЕЛЕФОН CHAR(10) ,--CONSTRAINT ТЕЛЕФОН CHECK ( ТЕЛЕФОН LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    ИМЕ CHAR(50)
);

CREATE TABLE КАСИ(
    СЛУЖЕБЕН№_НА_КАСИЕР CHAR(10) NOT NULL REFERENCES КАСИЕРИ(СЛУЖЕБЕН№),
    МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА CHAR(50) NOT NULL REFERENCES АВТОГАРА(МЕСТОПОЛОЖЕНИЕ),
    НОМЕР_НА_КАСА INTEGER NOT NULL,
    PRIMARY KEY (СЛУЖЕБЕН№_НА_КАСИЕР,МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА,НОМЕР_НА_КАСА )
);
--drop table РАЗПИСАНИЕ;
CREATE TABLE АВТОБУСИ(
    АВТОБУСЕН№ CHAR(10) UNIQUE NOT NULL ,
    МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА_ТРЪГВА CHAR(50) NOT NULL REFERENCES АВТОГАРА(МЕСТОПОЛОЖЕНИЕ),
    МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА_ПРИСТИГА CHAR(50) NOT NULL REFERENCES АВТОГАРА(МЕСТОПОЛОЖЕНИЕ),
    НАЛРАВЛЕНИЕ CHAR(50) NOT NULL ,
    МЕСТА INTEGER CHECK ( МЕСТА < 60),
    ДАТА_ТРЪГВА DATE DEFAULT CURRENT_DATE ,
    ЧАС_ТРЪГВА TIME DEFAULT  CURRENT_TIME ,
    ДАТА_ПРИСТИГА DATE DEFAULT CURRENT_DATE ,
    ЧАС_ПРИСТИГА TIME DEFAULT  CURRENT_TIME,
    CHECK ( НАЛРАВЛЕНИЕ = МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА_ПРИСТИГА ),
    PRIMARY KEY(АВТОБУСЕН№, МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА_ТРЪГВА, МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА_ПРИСТИГА)
);

CREATE TABLE ШОФЬОРИ(
    СЛУЖЕБЕН№ CHAR(10) NOT NULL PRIMARY KEY ,
    ТЕЛЕФОН VARCHAR(10) ,--CHECK ( ТЕЛЕФОН LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' ),
    ИМЕ CHAR(50)
);
CREATE  TABLE УПРАВЛЯВА(
    СЛУЖЕБЕН№_НА_ШОФЬОРА CHAR(10) NOT NULL REFERENCES ШОФЬОРИ(СЛУЖЕБЕН№),
    АВТОБУСА_КОЙТО_УПРАВЛЯВА CHAR(10) NOT NULL REFERENCES АВТОБУСИ(АВТОБУСЕН№),
    PRIMARY KEY(АВТОБУСА_КОЙТО_УПРАВЛЯВА, СЛУЖЕБЕН№_НА_ШОФЬОРА)
);
CREATE TABLE ПЪТНИЦИ(
    ИМЕ CHAR(50) NOT NULL PRIMARY KEY
);

CREATE TABLE БИЛЕТИ(
    БИЛЕТ_ЗА_АВТОБУС CHAR(10) NOT NULL REFERENCES АВТОБУСИ(АВТОБУСЕН№),
    СЛУЖЕБЕН№_НА_КАСИЕР CHAR(10) NOT NULL REFERENCES КАСИЕРИ(СЛУЖЕБЕН№),
    ИМЕ_НА_ПЪТНИК CHAR(50) NOT NULL REFERENCES ПЪТНИЦИ(ИМЕ),
    МЯСТО INTEGER,
    НАПРАВЛЕНИЕ CHAR(50) NOT NULL  REFERENCES АВТОГАРА(МЕСТОПОЛОЖЕНИЕ),
    ДАТА_ТРЪГВА DATE DEFAULT CURRENT_DATE ,
    ЧАС_ТРЪГВА TIME DEFAULT  CURRENT_TIME ,
    ВИД CHAR(1) DEFAULT 'A' CHECK ( ВИД in ('A', 'Y')),
    PRIMARY KEY(БИЛЕТ_ЗА_АВТОБУС,СЛУЖЕБЕН№_НА_КАСИЕР,ИМЕ_НА_ПЪТНИК)
);
CREATE TABLE РАЗПИСАНИЕ(
    МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА CHAR(50) NOT NULL REFERENCES АВТОГАРА(МЕСТОПОЛОЖЕНИЕ),
    ДАТА DATE DEFAULT CURRENT_DATE,
    СПИСЪК_ЗАМИНАВАЩИ CHAR(10) CHECK ( СПИСЪК_ЗАМИНАВАЩИ in ('има', 'няма')),
    СПИСЪК_ПРИСТИГАЩИ CHAR(10) CHECK ( СПИСЪК_ПРИСТИГАЩИ  in ('има', 'няма')),
    PRIMARY KEY (МЕСТОПОЛОЖЕНИЕ_НА_АВТОГАРА)
);



