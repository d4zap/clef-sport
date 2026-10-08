# Clef Sport — Sistema de ventas e inventario

Sistema de ventas, compras e inventario para una tienda de calzado deportivo. Tiene una base de datos **MySQL** con procedimientos almacenados y triggers, y una aplicación de escritorio en **Python (Tkinter)** conectada a ella.

Proyecto individual de **Bases de Datos II** · Ingeniería de Sistemas · Institución Universitaria Antonio José Camacho (UNIAJC) · abril a junio de 2026.

> La idea nació de los problemas de inventario que vi trabajando en bodega.

---

## Tecnologías

- **MySQL 8.0**: 11 tablas, procedimientos almacenados, triggers e índices
- **Python 3.13**: `mysql-connector-python`
- **Tkinter**: interfaz gráfica de escritorio con tema oscuro
- Documentación del modelo de datos en los informes de `docs/`

## Qué hace

| Pantalla | Operación | Procedimiento almacenado |
|---|---|---|
| Historial de cliente | Consulta todas las compras de un cliente por su cédula | `sp_historial_cliente` |
| Registrar venta | Registra una venta validando el stock, con transacción (`COMMIT` / `ROLLBACK`) | `sp_registrar_venta` |
| Reporte de ventas | Reporte por rango de fechas con total, número de ventas y promedio | `sp_reporte_ventas_periodo` |

La base de datos incluye además:

- **Procedimientos:** `sp_registrar_compra` (entrada de mercancía de proveedores) y `sp_anular_venta`.
- **Triggers:**
  - `trg_validar_stock`: impide vender más unidades de las disponibles.
  - `trg_total_venta`: calcula el total de la venta.
  - `trg_auditoria_stock`: guarda en `auditoria_stock` cada cambio de inventario.
- **Índices** para las consultas más frecuentes (cédula de cliente, fecha de venta, marca/categoría, stock).

## Modelo de datos

`categoria` · `marca` · `producto` · `proveedor` · `compra` · `detalle_compra` · `cliente` · `venta` · `detalle_venta` · `usuario` · `auditoria_stock`

Los datos de prueba (clientes, productos, ventas) son ficticios.

## Estructura

```
clef-sport/
├── app/
│   ├── app_tkinter.py        # Aplicación con interfaz gráfica
│   └── app_consola.py        # Primera versión, por consola
├── database/
│   ├── clef_sport_completo.sql   # Tablas, datos de prueba y procedimientos
│   └── scripts/
│       ├── triggers.sql          # Triggers e índices
│       ├── sp_historial.sql
│       ├── sp_compra.sql
│       ├── sp_reporte.sql
│       └── sp_anular.sql
├── docs/                     # Informes del proyecto (cortes 1, 2 y 3)
└── requirements.txt
```

## Cómo ejecutarlo

1. Instala la librería de conexión:
   ```
   pip install -r requirements.txt
   ```
2. En MySQL Workbench, ejecuta `database/clef_sport_completo.sql` y después `database/scripts/triggers.sql`.
3. Abre `app/app_tkinter.py` y, en el diccionario `config`, cambia `TU_CONTRASEÑA` por la contraseña de tu MySQL local.
4. Ejecuta:
   ```
   python app/app_tkinter.py
   ```

## Buenas prácticas aplicadas

- Toda la lógica de negocio pasa por procedimientos almacenados (sin SQL directo desde Python).
- Manejo de errores con `try / except / finally` y cierre garantizado de conexiones.
- `COMMIT` explícito en escrituras y `ROLLBACK` ante fallos.
- Validación de stock en dos niveles: procedimiento y trigger.
- Auditoría automática de cada cambio de inventario.

---

**David Salazar Lasso** · [LinkedIn](https://www.linkedin.com/in/davidsalazarlasso) · Cali, Colombia
