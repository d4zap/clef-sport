USE clef_sport;

DELIMITER $$
CREATE PROCEDURE sp_reporte_ventas_periodo(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    SELECT
        v.id_venta,
        v.fecha,
        CONCAT(c.nombre, ' ', c.apellido) AS cliente,
        p.nombre AS producto,
        dv.cantidad,
        dv.subtotal,
        v.metodo_pago,
        v.estado
    FROM venta v
    INNER JOIN cliente c ON v.id_cliente = c.id_cliente
    INNER JOIN detalle_venta dv ON v.id_venta = dv.id_venta
    INNER JOIN producto p ON dv.id_producto = p.id_producto
    WHERE v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
    ORDER BY v.fecha DESC;
END$$
DELIMITER ;