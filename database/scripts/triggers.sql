use clef_sport;

-- Se eliminan primero por si ya existen (el dump completo trae trg_auditoria_stock)
DROP TRIGGER IF EXISTS trg_auditoria_stock;
DROP TRIGGER IF EXISTS trg_validar_stock;
DROP TRIGGER IF EXISTS trg_total_venta;
-- TRIGGER 1: Auditoría de stock
DELIMITER $$
CREATE TRIGGER trg_auditoria_stock
AFTER UPDATE ON producto
FOR EACH ROW
BEGIN
    IF OLD.stock <> NEW.stock THEN
        INSERT INTO auditoria_stock
        (id_producto, accion, stock_anterior, stock_nuevo, detalle)
        VALUES (
            NEW.id_producto,
            'ACTUALIZACION',
            OLD.stock,
            NEW.stock,
            CONCAT('Stock actualizado para: ', NEW.nombre)
        );
    END IF;
END$$

-- TRIGGER 2: Validar stock antes de venta
CREATE TRIGGER trg_validar_stock
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;
    SELECT stock INTO v_stock
    FROM producto WHERE id_producto = NEW.id_producto;
    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock insuficiente para el producto';
    END IF;
END$$

-- TRIGGER 3: Recalcular total de venta
CREATE TRIGGER trg_total_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE venta
    SET total = (
        SELECT SUM(subtotal)
        FROM detalle_venta
        WHERE id_venta = NEW.id_venta
    )
    WHERE id_venta = NEW.id_venta;
END$$

DELIMITER ;

-- ÍNDICES
CREATE INDEX idx_cliente_cedula ON cliente(cedula);
CREATE INDEX idx_prod_marca_cat ON producto(id_marca, id_categoria);
CREATE INDEX idx_venta_fecha ON venta(fecha);
CREATE INDEX idx_prod_stock ON producto(stock);
-- idx_dv_prod_covering ya viene creado en clef_sport_completo.sql:
-- CREATE INDEX idx_dv_prod_covering ON detalle_venta(id_producto, cantidad, subtotal);