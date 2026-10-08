USE clef_sport;

DELIMITER $$
CREATE PROCEDURE sp_historial_cliente(
    IN p_cedula VARCHAR(20)
)
BEGIN
    SELECT
        v.id_venta,
        v.fecha,
        p.nombre AS producto,
        p.talla,
        dv.cantidad,
        dv.precio_unitario,
        dv.subtotal,
        v.metodo_pago,
        v.estado
    FROM venta v
    INNER JOIN cliente c ON v.id_cliente = c.id_cliente
    INNER JOIN detalle_venta dv ON v.id_venta = dv.id_venta
    INNER JOIN producto p ON dv.id_producto = p.id_producto
    WHERE c.cedula = p_cedula
    ORDER BY v.fecha DESC;
END$$
DELIMITER ;