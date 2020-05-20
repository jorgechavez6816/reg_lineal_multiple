# reg_lineal_multiple
Regresión Lineal Multiple a través de interacción de rutinas de IDEAScript y Python

El presente script tiene como objetivo definir un modelo de regresión lineal múltiple basado en tres de los seis productos que la empresa comercializa. Para ello, la rutina automatizada realiza las siguientes actividades:
1. De la tabla Ejemplo-Detalle de ventas en formato IMD (documento de IDEA) genera una tabla dinámica de comportamiento de los vendedores en las venta de productos de la entidad.
2. La tabla dinámica es exportada en formato excel.
3. En Python se toma la información de tabla dinamica y se genera un modelo de regresión lineal múltiple, sobre tres productos.
4. Se genera en un archivo csv, la ecuación final producto de la regresión: y = ax1 + bx2 + cx3 + k
5. En el caso que se ejecute el archivo python por separado, se tiene una línea de código adicional para consultar por el producto cuando se ingresan los montos de los tres productos.
