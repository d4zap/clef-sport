USE clef_sport;

DELIMITER $$
CREATE PROCEDURE sp_registrar_compra(
    IN p_id_proveedor INT,
    IN p_id_usuario INT,
    IN p_fecha DATE,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL(12,2)
)
BEGIN
    DECLARE v_id_compra INT;
    DECLARE v_total DECIMAL(14,2);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SET v_total = p_cantidad * p_precio_unitario;

    INSERT INTO compra (id_proveedor, id_usuario, fecha, total, estado)
    VALUES (p_id_proveedor, p_id_usuario, p_fecha, v_total, 'Recibida');

    SET v_id_compra = LAST_INSERT_ID();

    INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario)
    VALUES (v_id_compra, p_id_producto, p_cantidad, p_precio_unitario);

    UPDATE producto SET stock = stock + p_cantidad
    WHERE id_producto = p_id_producto;

    COMMIT;
END$$
DELIMITER ;