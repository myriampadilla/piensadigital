-- Generado por Oracle SQL Developer Data Modeler 18.2.0.179.0756
--   en:        2018-09-05 00:05:17 COT
--   sitio:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



CREATE TABLE centro_acopio (
    id_centro            NUMBER(10) NOT NULL,
    nit                  NUMBER(10),
    razon_social         VARCHAR2(30),
    direccion            VARCHAR2(30),
    nombre_contacto      VARCHAR2(30),
    correo_electronico   VARCHAR2(20),
    fecha_creacion       DATE
);

ALTER TABLE centro_acopio ADD CONSTRAINT centro_acopio_pk PRIMARY KEY ( id_centro );

CREATE TABLE cliente (
    id_cliente              NUMBER(10) NOT NULL,
    tipo_identificacion     NUMBER(10),
    numero_identificacion   NUMBER(10),
    primer_nombre           VARCHAR2(20),
    segundo_nombre          VARCHAR2(20),
    primer_apellido         VARCHAR2(20),
    segundo_apellido        VARCHAR2(20),
    correo_electronico      VARCHAR2(20),
    numero_telefonico       VARCHAR2(20),
    direccion               VARCHAR2(30),
    puntos_por_redimir      NUMBER(10),
    puntos_redimidos        NUMBER(10),
    fecha_creacion          DATE
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE compra (
    id_compra             NUMBER(10) NOT NULL,
    id_centro             NUMBER(10) NOT NULL,
    id_tipo_material      NUMBER(10) NOT NULL,
    id_unidad_medida      NUMBER(10) NOT NULL,
    valor                 NUMBER(10) NOT NULL,
    fecha_actualizacion   DATE NOT NULL
);

CREATE UNIQUE INDEX compra_idx ON
    compra (
        id_centro
    ASC,
        id_tipo_material
    ASC,
        id_unidad_medida
    ASC );

CREATE INDEX compra_centro_idx ON
    compra (
        id_centro
    ASC );

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( id_compra );

CREATE TABLE dominio (
    id_dominio   NUMBER(10) NOT NULL,
    nombre       VARCHAR2(20) NOT NULL
);

ALTER TABLE dominio ADD CONSTRAINT dominio_pk PRIMARY KEY ( id_dominio );

CREATE TABLE patrocinador (
    id_patrocinador      NUMBER(10) NOT NULL,
    nit                  NUMBER(10),
    razon_social         NVARCHAR2(30),
    telefonos            VARCHAR2(30),
    nombre_contacto      NVARCHAR2(30),
    correo_electronico   VARCHAR2(20),
    fecha_creacion       DATE
);

ALTER TABLE patrocinador ADD CONSTRAINT patrocinador_pk PRIMARY KEY ( id_patrocinador );

CREATE TABLE planificador (
    id_planificador         NUMBER(10) NOT NULL,
    fecha_creacion          DATE,
    estado                  VARCHAR2(10),
    fecha_cambio_estado     DATE,
    tipo_identificacion     NUMBER(10),
    numero_identificacion   NUMBER(10),
    primer_nombre           VARCHAR2(20),
    segundo_nombre          VARCHAR2(20),
    primer_apellido         VARCHAR2(20),
    segundo_apelldio        VARCHAR2(20),
    numero_telefonico       VARCHAR2(20),
    correo_electronico      VARCHAR2(20),
    direccion               VARCHAR2(30)
);

ALTER TABLE planificador ADD CONSTRAINT planificador_pk PRIMARY KEY ( id_planificador );

CREATE TABLE puntos (
    id_puntos          NUMBER(10) NOT NULL,
    id_cliente         NUMBER(10) NOT NULL,
    fecha_redencion    DATE NOT NULL,
    puntos_redimidos   NUMBER(10) NOT NULL,
    almacen            VARCHAR2(30),
    id_patrocinador    NUMBER(10) NOT NULL
);

CREATE INDEX puntos_cliente_idx ON
    puntos (
        id_cliente
    ASC );

CREATE INDEX puntos_patrocinador_idx ON
    puntos (
        id_patrocinador
    ASC );

ALTER TABLE puntos ADD CONSTRAINT redencion_puntos_pk PRIMARY KEY ( id_puntos );

CREATE TABLE servicio (
    id_servicio                       NUMBER(10) NOT NULL,
    id_solicitud                      NUMBER(10) NOT NULL,
    id_transportador                  NUMBER(10) NOT NULL,
    tipo_vehiculo                     NUMBER(10),
    placa_vehiculo                    NVARCHAR2(10),
    fecha_creacion_servicio           DATE,
    fecha_hora_estimada_recoleccion   VARCHAR2(20),
    recoleccion_efectiva_sn           VARCHAR2(1),
    puntos_otorgados_cliente          NUMBER(10),
    fecha_hora_recoleccion            VARCHAR2(20),
    observaciones_calificacion        VARCHAR2(200),
    nota_calificacion                 NUMBER(1),
    observaciones_informe             VARCHAR2(200)
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( id_servicio );

CREATE TABLE solicitud (
    numero_solicitud      NUMBER(10) NOT NULL,
    fecha_solicitud       DATE,
    estado                VARCHAR2(10),
    fecha_cambio_estado   DATE,
    id_tipo_material      NUMBER(10),
    id_unidad_medida      NUMBER(10),
    cantidad              NUMBER(10,2),
    observaciones         VARCHAR2(200),
    id_cliente            NUMBER(10) NOT NULL,
    id_ultimo_servicio    NUMBER(10)
);

CREATE INDEX solicitud_cleinte_idx ON
    solicitud (
        id_cliente
    ASC );

CREATE INDEX solicitud_servicio_idx ON
    solicitud (
        id_ultimo_servicio
    ASC );

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( numero_solicitud );

CREATE TABLE transportador (
    id_transportador             NUMBER(10) NOT NULL,
    fecha_creacion               DATE,
    estado                       VARCHAR2(10),
    fecha_cambio_estado          DATE,
    planificador_cambio_estado   NUMBER(10),
    tipo_identificacion          NUMBER(10),
    numero_identificacion        NUMBER(10),
    primer_nombre                VARCHAR2(20),
    segundo_nombre               VARCHAR2(20),
    primer_apellido              VARCHAR2(20),
    segundo_apellido             VARCHAR2(20),
    numero_telefonico            VARCHAR2(20),
    correo_electronico           VARCHAR2(20),
    direccion                    NVARCHAR2(20),
    tipo_vehiculo                NUMBER(10),
    marca_vehiculo               VARCHAR2(10),
    placa_vehiculo               VARCHAR2(10),
    id_servicio_actual           NUMBER(10)
);

CREATE INDEX transportador_servicio_idx ON
    transportador (
        id_servicio_actual
    ASC );

ALTER TABLE transportador ADD CONSTRAINT transportador_pk PRIMARY KEY ( id_transportador );

CREATE TABLE usuario (
    id_usuario        NUMBER(10) NOT NULL,
    username          VARCHAR2(10) NOT NULL,
    contraseña        VARCHAR2(10) NOT NULL,
    id_tipo_usuario   NUMBER(10) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE valor_dominio (
    id_valor_dominio   NUMBER(10) NOT NULL,
    valor              VARCHAR2(30) NOT NULL,
    id_dominio         NUMBER(10) NOT NULL
);

CREATE INDEX valor_dominio_idx ON
    valor_dominio (
        id_dominio
    ASC );

ALTER TABLE valor_dominio ADD CONSTRAINT valor_dominio_pk PRIMARY KEY ( id_valor_dominio );

ALTER TABLE centro_acopio
    ADD CONSTRAINT centro_acopio_usuario_fk FOREIGN KEY ( id_centro )
        REFERENCES usuario ( id_usuario );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( id_cliente )
        REFERENCES usuario ( id_usuario );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_valor_dominio_fk FOREIGN KEY ( tipo_identificacion )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE compra
    ADD CONSTRAINT compra_centro_acopio_fk FOREIGN KEY ( id_centro )
        REFERENCES centro_acopio ( id_centro );

ALTER TABLE patrocinador
    ADD CONSTRAINT patrocinador_usuario_fk FOREIGN KEY ( id_patrocinador )
        REFERENCES usuario ( id_usuario );

ALTER TABLE planificador
    ADD CONSTRAINT planificador_usuario_fk FOREIGN KEY ( id_planificador )
        REFERENCES usuario ( id_usuario );

ALTER TABLE planificador
    ADD CONSTRAINT planificador_valor_dominio_fk FOREIGN KEY ( tipo_identificacion )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE puntos
    ADD CONSTRAINT puntos_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE puntos
    ADD CONSTRAINT puntos_patrocinador_fk FOREIGN KEY ( id_patrocinador )
        REFERENCES patrocinador ( id_patrocinador );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_solicitud_fk FOREIGN KEY ( id_solicitud )
        REFERENCES solicitud ( numero_solicitud );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_transportador_fk FOREIGN KEY ( id_transportador )
        REFERENCES transportador ( id_transportador );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_valor_dominio_fk FOREIGN KEY ( tipo_vehiculo )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_servicio_fk FOREIGN KEY ( id_ultimo_servicio )
        REFERENCES servicio ( id_servicio );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_valor_dominio_fk FOREIGN KEY ( id_tipo_material )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_valor_dominio_fkv2 FOREIGN KEY ( id_unidad_medida )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE transportador
    ADD CONSTRAINT transportador_planificador_fk FOREIGN KEY ( planificador_cambio_estado )
        REFERENCES planificador ( id_planificador );

ALTER TABLE transportador
    ADD CONSTRAINT transportador_servicio_fk FOREIGN KEY ( id_servicio_actual )
        REFERENCES servicio ( id_servicio );

ALTER TABLE transportador
    ADD CONSTRAINT transportador_usuario_fk FOREIGN KEY ( id_transportador )
        REFERENCES usuario ( id_usuario );

ALTER TABLE transportador
    ADD CONSTRAINT transportador_valor_dominio_fk FOREIGN KEY ( tipo_vehiculo )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE transportador
    ADD CONSTRAINT transportador_valor_dominio_fkv2 FOREIGN KEY ( tipo_identificacion )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_valor_dominio_fk FOREIGN KEY ( id_tipo_usuario )
        REFERENCES valor_dominio ( id_valor_dominio );

ALTER TABLE valor_dominio
    ADD CONSTRAINT valor_dominio_dominio_fk FOREIGN KEY ( id_dominio )
        REFERENCES dominio ( id_dominio );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             8
-- ALTER TABLE                             35
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
