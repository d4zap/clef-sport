USE clef_sport;

DELIMITER $$
CREATE PROCEDURE sp_anular_venta(
    IN p_id_venta INT
)
BEGIN
    DECLARE v_id_producto INT;
    DECLARE v_cantidad INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT id_producto, cantidad INTO v_id_producto, v_cantidad
    FROM detalle_venta WHERE id_venta = p_id_venta LIMIT 1;

    UPDATE venta SET estado = 'Anulada' WHERE id_venta = p_id_venta;

    UPDATE producto SET stock = stock + v_cantidad
    WHERE id_producto = v_id_producto;

    COMMIT;
END$$
DELIMITER ;