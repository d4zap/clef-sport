import mysql.connector

# ── Configuración de conexión ──────────────────────

config = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',
    'password': 'TU_CONTRASEÑA',  # cambia esto por la contraseña de tu MySQL local
    'database': 'clef_sport'
}

def conectar():
    return mysql.connector.connect(**config)

#   Consulta: historial de un cliente

def historial_cliente(cedula):
    conn = conectar()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.callproc('sp_historial_cliente', [cedula])
        print(f"\n📋 Historial del cliente con cédula {cedula}:")
        print("-" * 60)
        for result in cursor.stored_results():
            filas = result.fetchall()
            if not filas:
                print("No se encontraron compras para este cliente.")
            for f in filas:
                print(f"Venta #{f['id_venta']} | {f['fecha']} | {f['producto']} talla {f['talla']} | Cantidad: {f['cantidad']} | Subtotal: ${f['subtotal']:,.0f} | {f['metodo_pago']}")
    except mysql.connector.Error as e:
        print(f"Error: {e.msg}")
    finally:
        cursor.close()
        conn.close()

# — Inserción: registrar una venta

def registrar_venta(id_cliente, id_usuario, fecha, metodo_pago, id_producto, cantidad):
    conn = conectar()
    cursor = conn.cursor()
    try:
        cursor.callproc('sp_registrar_venta', [id_cliente, id_usuario, fecha, metodo_pago, id_producto, cantidad])
        conn.commit()
        print(f"\n✅ Venta registrada correctamente.")
        print(f"   Cliente ID: {id_cliente} | Producto ID: {id_producto} | Cantidad: {cantidad} | Método: {metodo_pago}")
    except mysql.connector.Error as e:
        conn.rollback()
        print(f"\n❌ Error al registrar venta: {e.msg}")
    finally:
        cursor.close()
        conn.close()


#  Reporte: ventas por período

def reporte_ventas(fecha_inicio, fecha_fin):
    conn = conectar()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.callproc('sp_reporte_ventas_periodo', [fecha_inicio, fecha_fin])
        print(f"\n📊 Reporte de ventas del {fecha_inicio} al {fecha_fin}:")
        print("-" * 60)
        total_general = 0
        for result in cursor.stored_results():
            filas = result.fetchall()
            if not filas:
                print("No hay ventas en ese período.")
            for f in filas:
                print(f"{f['fecha']} | {f['cliente']} | {f['producto']} | Cantidad: {f['cantidad']} | Subtotal: ${f['subtotal']:,.0f}")
                total_general += f['subtotal']
        print("-" * 60)
        print(f"TOTAL GENERAL: ${total_general:,.0f}")
    except mysql.connector.Error as e:
        print(f"Error: {e.msg}")
    finally:
        cursor.close()
        conn.close()

# MENÚ PRINCIPAL


def menu():
    while True:
        print("\n╔══════════════════════════════╗")
        print("║      CLEF SPORT — APP        ║")
        print("╠══════════════════════════════╣")
        print("║ 1. Historial de cliente      ║")
        print("║ 2. Registrar venta           ║")
        print("║ 3. Reporte de ventas         ║")
        print("║ 4. Salir                     ║")
        print("╚══════════════════════════════╝")
        opcion = input("Selecciona una opción: ")

        if opcion == '1':
            cedula = input("Ingresa la cédula del cliente: ")
            historial_cliente(cedula)

        elif opcion == '2':
            id_cliente = int(input("ID cliente: "))
            id_usuario = int(input("ID usuario: "))
            fecha = input("Fecha (YYYY-MM-DD): ")
            metodo_pago = input("Método de pago (Efectivo/Tarjeta/Transferencia): ")
            id_producto = int(input("ID producto: "))
            cantidad = int(input("Cantidad: "))
            registrar_venta(id_cliente, id_usuario, fecha, metodo_pago, id_producto, cantidad)

        elif opcion == '3':
            fecha_inicio = input("Fecha inicio (YYYY-MM-DD): ")
            fecha_fin = input("Fecha fin (YYYY-MM-DD): ")
            reporte_ventas(fecha_inicio, fecha_fin)

        elif opcion == '4':
            print("Hasta luego.")
            break
        else:
            print("Opción no válida.")

if __name__ == '__main__':
    menu()