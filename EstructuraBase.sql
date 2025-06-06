CREATE DATABASE code_runners;
USE code_runners;
CREATE TABLE dim_hora(
    id_hora INT PRIMARY KEY IDENTITY,
    hora INT NOT NULL,
    minuto INT NOT NULL,
    am BIT NOT NULL
);

CREATE TABLE dim_fecha(
    id_fecha INT PRIMARY KEY IDENTITY,
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL
);

CREATE TABLE dim_pago(
    id_pago INT PRIMARY KEY,
    metodo VARCHAR(16) NOT NULL,
    banco_dest VARCHAR(32),
    num_cuenta VARCHAR(16),
    concepto VARCHAR(32),
    titular VARCHAR(64)
);

CREATE TABLE dim_producto(
    codigo_producto VARCHAR(16) PRIMARY KEY,
    descripcion VARCHAR(128),
    marca VARCHAR(64),
    categoria VARCHAR(64),
    subcategoria VARCHAR(64),
    unidad VARCHAR(30),
    peso_lb DECIMAL(6, 3),
    color VARCHAR(30),
    tamanio VARCHAR(30)
);

CREATE TABLE dim_cliente(
    id_cliente INT PRIMARY KEY,
    nombres VARCHAR(64) NOT NULL,
    apellidos VARCHAR(64) NOT NULL,
    correo VARCHAR(64) NOT NULL,
    dui CHAR(10) NOT NULL,
    nit VARCHAR(17),
    giro VARCHAR(64)
);

CREATE TABLE dim_promocion(
    id_promocion INT PRIMARY KEY,
    nommbre VARCHAR(64) NOT NULL,
    tipo VARCHAR(32) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE dim_ubicacion(
    id_ubicacion INT PRIMARY KEY IDENTITY,
    departamento VARCHAR(16),
    municipio VARCHAR(24),
    direccion VARCHAR(128),
    referencia VARCHAR(128)
);

CREATE TABLE dim_almacen(
    id_almacen INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(24),
    sucursal VARCHAR(24),
    departamento VARCHAR(16),
    municipio VARCHAR(24)
);

CREATE TABLE fact_ventas(
    id_venta INT PRIMARY KEY IDENTITY,
    num_orden INT NOT NULL,
    corr_detalle INT NOT NULL,
    cantidad DECIMAL(12, 3),
    monto DECIMAL (10, 2),
    monto_descuento DECIMAL(10, 2),
    monto_impuesto DECIMAL(10, 2),
    monto_envio DECIMAL(10, 2),
    id_fecha INT FOREIGN KEY REFERENCES dim_fecha(id_fecha),
    id_hora INT FOREIGN KEY REFERENCES dim_hora(id_hora),
    id_cliente INT FOREIGN KEY REFERENCES dim_cliente(id_cliente),
    codigo_producto VARCHAR(16) FOREIGN KEY REFERENCES dim_producto(codigo_producto),
    id_ubicacion INT FOREIGN KEY REFERENCES dim_ubicacion(id_ubicacion),
    id_promocion INT FOREIGN KEY REFERENCES dim_promocion(id_promocion),
    id_pago INT FOREIGN KEY REFERENCES dim_pago(id_pago)
);

CREATE TABLE fact_movimientos_inventario(
    id_movimiento INT PRIMARY KEY IDENTITY,
    tipo_movimiento VARCHAR(24),
    cantidad DECIMAL (12, 3), 
    stock_resultante DECIMAL (12, 3),
    id_fecha INT FOREIGN KEY REFERENCES dim_fecha(id_fecha),
    id_hora INT FOREIGN KEY REFERENCES dim_hora(id_hora),
    codigo_producto VARCHAR(16) FOREIGN KEY REFERENCES dim_producto(codigo_producto),
    id_almacen INT FOREIGN KEY REFERENCES dim_almacen(id_almacen)
);