# 📘 Diccionario de Datos

## Tabla: `dim_fecha`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_fecha` | `INT` | Identificador único de la fecha |
| `fecha` | `DATE` | Fecha completa |
| `anio` | `INT` | Año de la fecha |
| `mes` | `INT` | Mes de la fecha |
| `dia` | `INT` | Día de la fecha |

## Tabla: `dim_hora`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_hora` | `INT` | Identificador único de la hora |
| `hora` | `INT` | Hora en formato 12 |
| `minuto` | `INT` | Minutos |
| `am` | `BOOLEAN` | Indica si es AM (1) o PM (0) |

## Tabla: `dim_pago`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_pago` | `INT` | Identificador del método de pago |
| `metodo` | `VARCHAR(16)` | Tipo de método de pago |
| `banco_dest` | `VARCHAR(32)` | Nombre del banco destino |
| `num_cuenta` | `VARCHAR(16)` | Número de cuenta del cliente |
| `concepto` | `VARCHAR(32)` | Concepto del pago |
| `titular` | `VARCHAR(64)` | Nombre del titular del pago |

## Tabla: `dim_producto`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `codigo_producto` | `VARCHAR(16)` | Código único del producto |
| `descripcion` | `VARCHAR(128)` | Nombre o descripción del producto |
| `marca` | `VARCHAR(64)` | Marca del producto |
| `categoria` | `VARCHAR(64)` | Categoría general |
| `subcategoria` | `VARCHAR(64)` | Subcategoría específica |
| `unidad` | `VARCHAR(30)` | Unidad de medida del producto |
| `peso_lb` | `DECIMAL(6, 3)` | Peso en libras |
| `color` | `VARCHAR(30)` | Color del producto |
| `tamanio` | `VARCHAR(30)` | Tamaño del producto |

## Tabla: `dim_cliente`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_cliente` | `INT` | Identificador único del cliente |
| `nombres` | `VARCHAR(64)` | Nombres del cliente |
| `apellidos` | `VARCHAR(64)` | Apellidos del cliente |
| `correo` | `VARCHAR(64)` | Correo electrónico |
| `dui` | `CHAR(10)` | Documento Único de Identidad |
| `nit` | `VARCHAR(17)` | Número de Identificación Tributaria |
| `giro` | `VARCHAR(64)` | Giro comercial del cliente |

## Tabla: `dim_promocion`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_promocion` | `INT` | Identificador único de la promoción |
| `nommbre` | `VARCHAR(64)` | Nombre de la promoción |
| `tipo` | `VARCHAR(32)` | Tipo de promoción |
| `presupuesto` | `DECIMAL(10,2)` | Presupuesto asignado |
| `fecha_inicio` | `DATE` | Fecha de inicio de la promoción |
| `fecha_fin` | `DATE` | Fecha de finalización |

## Tabla: `dim_ubicacion`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_ubicacion` | `INT` | Identificador de ubicación |
| `departamento` | `VARCHAR(16)` | Departamento |
| `municipio` | `VARCHAR(24)` | Municipio |
| `direccion` | `VARCHAR(128)` | Dirección del cliente |
| `referencia` | `VARCHAR(128)` | Punto de referencia |

## Tabla: `dim_almacen`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_almacen` | `INT` | Identificador único del almacén |
| `nombre` | `VARCHAR(24)` | Nombre del almacén |
| `sucursal` | `VARCHAR(24)` | Nombre de la sucursal |
| `departamento` | `VARCHAR(16)` | Departamento |
| `municipio` | `VARCHAR(24)` | Municipio |

## Tabla: `fact_ventas`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_venta` | `INT` | ID único de la venta |
| `num_orden` | `INT` | Número de orden |
| `corr_detalle` | `INT` | Detalle de orden |
| `cantidad` | `DECIMAL(12,3)` | Cantidad vendida |
| `monto` | `DECIMAL(10,2)` | Monto total |
| `monto_descuento` | `DECIMAL(10,2)` | Descuento aplicado |
| `monto_impuesto` | `DECIMAL(10,2)` | Impuesto agregado |
| `monto_envio` | `DECIMAL(10,2)` | Costo de envío |
| `id_fecha` | `INT` | Fecha de la venta |
| `id_hora` | `INT` | Hora de la venta |
| `id_cliente` | `INT` | Cliente asociado |
| `codigo_producto` | `VARCHAR(16)` | Producto vendido |
| `id_ubicacion` | `INT` | Ubicación del cliente |
| `id_promocion` | `INT` | Promoción aplicada |
| `id_pago` | `INT` | Método de pago |

## Tabla: `fact_movimientos_inventario`

| Campo | Tipo de Dato | Descripción |
|-------|---------------|-------------|
| `id_movimiento` | `INT` | ID del movimiento |
| `tipo_movimiento` | `VARCHAR(24)` | Tipo de movimiento |
| `cantidad` | `DECIMAL(12,3)` | Cantidad movida |
| `stock_resultante` | `DECIMAL(12,3)` | Stock después del movimiento |
| `id_fecha` | `INT` | Fecha del movimiento |
| `id_hora` | `INT` | Hora del movimiento |
| `codigo_producto` | `VARCHAR(16)` | Producto afectado |
| `id_almacen` | `INT` | Almacén correspondiente |
