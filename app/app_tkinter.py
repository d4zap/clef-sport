import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
 
# ── Configuración ─────────────────────────────────────
config = {
    'host':     'localhost',
    'port':     3306,
    'user':     'root',
    'password': 'TU_CONTRASEÑA',  # cambia esto por la contraseña de tu MySQL local
    'database': 'clef_sport'
}
 
def conectar():
    return mysql.connector.connect(**config)
 
# ── Colores / Tema ────────────────────────────────────
BG       = "#0D1117"
BG2      = "#161B22"
CARD     = "#1F2937"
ORANGE   = "#F97316"
ORANGE2  = "#EA6A0A"
WHITE    = "#F0F6FC"
MUTED    = "#8B949E"
GREEN    = "#22C55E"
RED      = "#EF4444"
FONT     = "Segoe UI"
 
# ══════════════════════════════════════════════════════
# APP PRINCIPAL
# ══════════════════════════════════════════════════════
class ClefSportApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("CLEF SPORT — Gestión de Ventas")
        self.geometry("1100x680")
        self.minsize(900, 580)
        self.configure(bg=BG)
        self.resizable(True, True)
 
        # Estilo ttk
        self._setup_styles()
 
        # Layout principal
        self._build_sidebar()
        self._build_main()
 
        # Frame activo
        self.frames = {}
        for F in (FrameHistorial, FrameVenta, FrameReporte):
            frame = F(self.main_area, self)
            self.frames[F.__name__] = frame
            frame.place(relx=0, rely=0, relwidth=1, relheight=1)
 
        self.show_frame("FrameHistorial")
 
    def _setup_styles(self):
        style = ttk.Style(self)
        style.theme_use("clam")
 
        style.configure("Treeview",
            background=CARD, foreground=WHITE,
            fieldbackground=CARD, rowheight=30,
            font=(FONT, 10))
        style.configure("Treeview.Heading",
            background=BG2, foreground=ORANGE,
            font=(FONT, 10, "bold"), relief="flat")
        style.map("Treeview",
            background=[("selected", ORANGE)],
            foreground=[("selected", WHITE)])
 
        style.configure("Vertical.TScrollbar",
            background=CARD, troughcolor=BG2,
            arrowcolor=ORANGE, bordercolor=BG2)
 
    def _build_sidebar(self):
        self.sidebar = tk.Frame(self, bg=BG2, width=220)
        self.sidebar.pack(side="left", fill="y")
        self.sidebar.pack_propagate(False)
 
        # Logo
        tk.Label(self.sidebar, text="CLEF", bg=BG2,
                 fg=WHITE, font=(FONT, 22, "bold")).pack(pady=(30, 0))
        tk.Label(self.sidebar, text="SPORT", bg=BG2,
                 fg=ORANGE, font=(FONT, 22, "bold")).pack(pady=(0, 4))
        tk.Label(self.sidebar, text="Gestión Empresarial", bg=BG2,
                 fg=MUTED, font=(FONT, 9)).pack(pady=(0, 30))
 
        # Separador
        tk.Frame(self.sidebar, bg=ORANGE, height=2).pack(fill="x", padx=20, pady=(0, 20))
 
        # Botones nav
        self.nav_buttons = {}
        nav_items = [
            ("FrameHistorial", "📋  Historial Cliente"),
            ("FrameVenta",     "🛒  Registrar Venta"),
            ("FrameReporte",   "📊  Reporte de Ventas"),
        ]
        for key, label in nav_items:
            btn = tk.Button(
                self.sidebar, text=label, anchor="w",
                bg=BG2, fg=WHITE, activebackground=CARD,
                activeforeground=ORANGE, relief="flat",
                font=(FONT, 11), padx=20, pady=12,
                cursor="hand2",
                command=lambda k=key: self.show_frame(k)
            )
            btn.pack(fill="x", pady=2)
            self.nav_buttons[key] = btn
 
        # Footer sidebar
        tk.Label(self.sidebar, text="David Salazar Lasso\nBases de Datos II · UNIAJC",
                 bg=BG2, fg=MUTED, font=(FONT, 8),
                 justify="center").pack(side="bottom", pady=20)
 
    def _build_main(self):
        self.main_area = tk.Frame(self, bg=BG)
        self.main_area.pack(side="right", fill="both", expand=True)
 
    def show_frame(self, name):
        # Resaltar botón activo
        for key, btn in self.nav_buttons.items():
            if key == name:
                btn.configure(bg=CARD, fg=ORANGE, font=(FONT, 11, "bold"))
            else:
                btn.configure(bg=BG2, fg=WHITE, font=(FONT, 11))
        self.frames[name].lift()
        self.frames[name].after(10, self.frames[name].on_show)
 
 
# ══════════════════════════════════════════════════════
# HELPERS COMUNES
# ══════════════════════════════════════════════════════
def make_label(parent, text, size=10, color=MUTED, bold=False):
    weight = "bold" if bold else "normal"
    return tk.Label(parent, text=text, bg=BG, fg=color,
                    font=(FONT, size, weight))
 
def make_entry(parent, show=None):
    e = tk.Entry(parent, bg=CARD, fg=WHITE, insertbackground=WHITE,
                 relief="flat", font=(FONT, 11), bd=0)
    e.configure(highlightthickness=1, highlightbackground=MUTED,
                highlightcolor=ORANGE)
    if show:
        e.configure(show=show)
    return e
 
def make_btn(parent, text, command, color=ORANGE, fg=WHITE):
    return tk.Button(parent, text=text, command=command,
                     bg=color, fg=fg, activebackground=ORANGE2,
                     activeforeground=WHITE, relief="flat",
                     font=(FONT, 11, "bold"), padx=20, pady=10,
                     cursor="hand2", bd=0)
 
def make_table(parent, columns, col_widths):
    frame = tk.Frame(parent, bg=BG)
    tree = ttk.Treeview(frame, columns=columns, show="headings",
                        style="Treeview")
    for col, w in zip(columns, col_widths):
        tree.heading(col, text=col)
        tree.column(col, width=w, anchor="center")
    sb = ttk.Scrollbar(frame, orient="vertical",
                       command=tree.yview, style="Vertical.TScrollbar")
    tree.configure(yscrollcommand=sb.set)
    tree.pack(side="left", fill="both", expand=True)
    sb.pack(side="right", fill="y")
    # filas alternadas
    tree.tag_configure("odd",  background=CARD)
    tree.tag_configure("even", background="#263244")
    return frame, tree
 
def status_bar(parent, text, color=GREEN):
    bar = tk.Label(parent, text=text, bg=BG2, fg=color,
                   font=(FONT, 10), anchor="w", padx=12, pady=6)
    bar.pack(fill="x", side="bottom")
    return bar
 
 
# ══════════════════════════════════════════════════════
# FRAME 1 — HISTORIAL DE CLIENTE
# ══════════════════════════════════════════════════════
class FrameHistorial(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, bg=BG)
        self.controller = controller
        self._build()
 
    def on_show(self):
        pass
 
    def _build(self):
        # Título
        tk.Label(self, text="Historial de Cliente", bg=BG,
                 fg=WHITE, font=(FONT, 18, "bold")).pack(anchor="w", padx=30, pady=(25, 2))
        tk.Label(self, text="Consulta todas las compras de un cliente por número de cédula",
                 bg=BG, fg=MUTED, font=(FONT, 10)).pack(anchor="w", padx=30, pady=(0, 20))
        tk.Frame(self, bg=ORANGE, height=2).pack(fill="x", padx=30, pady=(0, 20))
 
        # Formulario
        form = tk.Frame(self, bg=BG)
        form.pack(fill="x", padx=30, pady=(0, 15))
 
        tk.Label(form, text="Cédula del cliente", bg=BG, fg=MUTED,
                 font=(FONT, 10)).grid(row=0, column=0, sticky="w", pady=(0, 4))
        self.entry_cedula = make_entry(form)
        self.entry_cedula.grid(row=1, column=0, sticky="ew", ipady=8, padx=(0, 12))
        self.entry_cedula.bind("<Return>", lambda e: self._buscar())
 
        make_btn(form, "🔍  Buscar", self._buscar).grid(row=1, column=1, ipady=2)
        make_btn(form, "🗑  Limpiar", self._limpiar,
                 color=CARD, fg=MUTED).grid(row=1, column=2, padx=(8, 0), ipady=2)
        form.columnconfigure(0, weight=1)
 
        # Tabla
        cols = ("# Venta", "Fecha", "Producto", "Talla", "Cant.", "Subtotal", "Pago", "Estado")
        widths = (70, 90, 240, 60, 55, 100, 110, 90)
        self.tbl_frame, self.tree = make_table(self, cols, widths)
        self.tbl_frame.pack(fill="both", expand=True, padx=30, pady=(0, 10))
 
        # Status
        self.status = tk.Label(self, text="Ingresa una cédula y presiona Buscar",
                               bg=BG2, fg=MUTED, font=(FONT, 10),
                               anchor="w", padx=12, pady=6)
        self.status.pack(fill="x")
 
    def _buscar(self):
        cedula = self.entry_cedula.get().strip()
        if not cedula:
            messagebox.showwarning("Atención", "Ingresa la cédula del cliente.")
            return
        self.tree.delete(*self.tree.get_children())
        try:
            conn = conectar()
            cursor = conn.cursor(dictionary=True)
            cursor.callproc('sp_historial_cliente', [cedula])
            filas = []
            for result in cursor.stored_results():
                filas = result.fetchall()
            cursor.close()
            conn.close()
            if not filas:
                self.status.configure(text=f"No se encontraron compras para cédula {cedula}.", fg=RED)
                return
            for i, f in enumerate(filas):
                tag = "odd" if i % 2 == 0 else "even"
                self.tree.insert("", "end", values=(
                    f"#{f['id_venta']}", f['fecha'],
                    f['producto'], f['talla'],
                    f['cantidad'], f"${f['subtotal']:,.0f}",
                    f['metodo_pago'], f['estado']
                ), tags=(tag,))
            self.status.configure(
                text=f"✔  {len(filas)} compra(s) encontrada(s) para cédula {cedula}.", fg=GREEN)
        except mysql.connector.Error as e:
            messagebox.showerror("Error de BD", e.msg)
            self.status.configure(text=f"Error: {e.msg}", fg=RED)
 
    def _limpiar(self):
        self.entry_cedula.delete(0, "end")
        self.tree.delete(*self.tree.get_children())
        self.status.configure(text="Ingresa una cédula y presiona Buscar", fg=MUTED)
 
 
# ══════════════════════════════════════════════════════
# FRAME 2 — REGISTRAR VENTA
# ══════════════════════════════════════════════════════
class FrameVenta(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, bg=BG)
        self.controller = controller
        self._build()
 
    def on_show(self):
        pass
 
    def _build(self):
        tk.Label(self, text="Registrar Venta", bg=BG,
                 fg=WHITE, font=(FONT, 18, "bold")).pack(anchor="w", padx=30, pady=(25, 2))
        tk.Label(self, text="Crea una nueva venta validando stock disponible",
                 bg=BG, fg=MUTED, font=(FONT, 10)).pack(anchor="w", padx=30, pady=(0, 20))
        tk.Frame(self, bg=ORANGE, height=2).pack(fill="x", padx=30, pady=(0, 25))
 
        # Formulario 2 columnas
        form = tk.Frame(self, bg=BG)
        form.pack(fill="x", padx=30)
 
        campos = [
            ("ID Cliente",    "entry_id_cliente",  0, 0),
            ("ID Usuario",    "entry_id_usuario",  0, 1),
            ("Fecha (YYYY-MM-DD)", "entry_fecha",  1, 0),
            ("ID Producto",   "entry_id_producto", 1, 1),
            ("Cantidad",      "entry_cantidad",    2, 0),
        ]
        for label, attr, row, col in campos:
            c = col * 2
            tk.Label(form, text=label, bg=BG, fg=MUTED,
                     font=(FONT, 10)).grid(row=row*2, column=c, sticky="w",
                                           pady=(0, 4), padx=(0, 20))
            e = make_entry(form)
            e.grid(row=row*2+1, column=c, sticky="ew", ipady=8,
                   padx=(0, 20), pady=(0, 14))
            setattr(self, attr, e)
 
        # Método de pago
        tk.Label(form, text="Método de Pago", bg=BG, fg=MUTED,
                 font=(FONT, 10)).grid(row=4, column=2, sticky="w", pady=(0, 4))
        self.metodo_var = tk.StringVar(value="Efectivo")
        metodo_menu = ttk.Combobox(form, textvariable=self.metodo_var,
                                   values=["Efectivo", "Tarjeta", "Transferencia"],
                                   state="readonly", font=(FONT, 11), width=18)
        metodo_menu.grid(row=5, column=2, sticky="ew", ipady=4, pady=(0, 14))
 
        form.columnconfigure(0, weight=1)
        form.columnconfigure(2, weight=1)
 
        # Botones
        btn_frame = tk.Frame(self, bg=BG)
        btn_frame.pack(fill="x", padx=30, pady=(5, 20))
        make_btn(btn_frame, "✅  Registrar Venta", self._registrar).pack(side="left", padx=(0, 10))
        make_btn(btn_frame, "🗑  Limpiar", self._limpiar,
                 color=CARD, fg=MUTED).pack(side="left")
 
        # Panel resultado
        self.result_frame = tk.Frame(self, bg=CARD, bd=0)
        self.result_frame.pack(fill="x", padx=30, pady=(0, 10))
        self.result_label = tk.Label(self.result_frame, text="",
                                     bg=CARD, fg=WHITE,
                                     font=(FONT, 11), anchor="w",
                                     padx=16, pady=14, justify="left")
        self.result_label.pack(fill="x")
 
        self.status = tk.Label(self, text="Completa los campos y presiona Registrar Venta",
                               bg=BG2, fg=MUTED, font=(FONT, 10),
                               anchor="w", padx=12, pady=6)
        self.status.pack(fill="x", side="bottom")
 
    def _registrar(self):
        try:
            id_cliente  = int(self.entry_id_cliente.get().strip())
            id_usuario  = int(self.entry_id_usuario.get().strip())
            fecha       = self.entry_fecha.get().strip()
            metodo_pago = self.metodo_var.get()
            id_producto = int(self.entry_id_producto.get().strip())
            cantidad    = int(self.entry_cantidad.get().strip())
        except ValueError:
            messagebox.showwarning("Atención", "Verifica que todos los campos numéricos sean válidos.")
            return
 
        try:
            conn = conectar()
            cursor = conn.cursor()
            cursor.callproc('sp_registrar_venta',
                [id_cliente, id_usuario, fecha, metodo_pago, id_producto, cantidad])
            conn.commit()
            cursor.close()
            conn.close()
            self.result_label.configure(
                text=f"✔  Venta registrada correctamente\n"
                     f"   Cliente ID: {id_cliente}  |  Producto ID: {id_producto}  "
                     f"|  Cantidad: {cantidad}  |  Método: {metodo_pago}",
                fg=GREEN)
            self.status.configure(text="Venta registrada correctamente.", fg=GREEN)
        except mysql.connector.Error as e:
            self.result_label.configure(
                text=f"✖  Error: {e.msg}", fg=RED)
            self.status.configure(text=f"Error: {e.msg}", fg=RED)
 
    def _limpiar(self):
        for attr in ["entry_id_cliente", "entry_id_usuario", "entry_fecha",
                     "entry_id_producto", "entry_cantidad"]:
            getattr(self, attr).delete(0, "end")
        self.metodo_var.set("Efectivo")
        self.result_label.configure(text="")
        self.status.configure(
            text="Completa los campos y presiona Registrar Venta", fg=MUTED)
 
 
# ══════════════════════════════════════════════════════
# FRAME 3 — REPORTE DE VENTAS
# ══════════════════════════════════════════════════════
class FrameReporte(tk.Frame):
    def __init__(self, parent, controller):
        super().__init__(parent, bg=BG)
        self.controller = controller
        self._build()
 
    def on_show(self):
        pass
 
    def _build(self):
        tk.Label(self, text="Reporte de Ventas", bg=BG,
                 fg=WHITE, font=(FONT, 18, "bold")).pack(anchor="w", padx=30, pady=(25, 2))
        tk.Label(self, text="Genera un reporte de ventas entre dos fechas",
                 bg=BG, fg=MUTED, font=(FONT, 10)).pack(anchor="w", padx=30, pady=(0, 20))
        tk.Frame(self, bg=ORANGE, height=2).pack(fill="x", padx=30, pady=(0, 20))
 
        # Formulario
        form = tk.Frame(self, bg=BG)
        form.pack(fill="x", padx=30, pady=(0, 15))
 
        tk.Label(form, text="Fecha inicio (YYYY-MM-DD)", bg=BG, fg=MUTED,
                 font=(FONT, 10)).grid(row=0, column=0, sticky="w", pady=(0, 4))
        self.entry_inicio = make_entry(form)
        self.entry_inicio.grid(row=1, column=0, sticky="ew", ipady=8, padx=(0, 12))
 
        tk.Label(form, text="Fecha fin (YYYY-MM-DD)", bg=BG, fg=MUTED,
                 font=(FONT, 10)).grid(row=0, column=1, sticky="w", pady=(0, 4))
        self.entry_fin = make_entry(form)
        self.entry_fin.grid(row=1, column=1, sticky="ew", ipady=8, padx=(0, 12))
 
        make_btn(form, "📊  Generar Reporte", self._generar).grid(
            row=1, column=2, ipady=2)
        make_btn(form, "🗑  Limpiar", self._limpiar,
                 color=CARD, fg=MUTED).grid(row=1, column=3, padx=(8, 0), ipady=2)
        form.columnconfigure(0, weight=1)
        form.columnconfigure(1, weight=1)
 
        # Total card
        self.total_frame = tk.Frame(self, bg=CARD)
        self.total_frame.pack(fill="x", padx=30, pady=(0, 12))
        self.total_label = tk.Label(self.total_frame, text="TOTAL GENERAL:  —",
                                    bg=CARD, fg=ORANGE,
                                    font=(FONT, 14, "bold"),
                                    anchor="e", padx=20, pady=10)
        self.total_label.pack(fill="x")
 
        # Tabla
        cols = ("# Venta", "Fecha", "Cliente", "Producto", "Cant.", "Subtotal", "Pago", "Estado")
        widths = (70, 90, 150, 200, 55, 100, 110, 90)
        self.tbl_frame, self.tree = make_table(self, cols, widths)
        self.tbl_frame.pack(fill="both", expand=True, padx=30, pady=(0, 10))
 
        self.status = tk.Label(self, text="Ingresa un rango de fechas y presiona Generar Reporte",
                               bg=BG2, fg=MUTED, font=(FONT, 10),
                               anchor="w", padx=12, pady=6)
        self.status.pack(fill="x")
 
    def _generar(self):
        inicio = self.entry_inicio.get().strip()
        fin    = self.entry_fin.get().strip()
        if not inicio or not fin:
            messagebox.showwarning("Atención", "Ingresa las dos fechas.")
            return
        self.tree.delete(*self.tree.get_children())
        try:
            conn = conectar()
            cursor = conn.cursor(dictionary=True)
            cursor.callproc('sp_reporte_ventas_periodo', [inicio, fin])
            filas = []
            for result in cursor.stored_results():
                filas = result.fetchall()
            cursor.close()
            conn.close()
            if not filas:
                self.total_label.configure(text="TOTAL GENERAL:  $0")
                self.status.configure(text="No hay ventas en ese período.", fg=RED)
                return
            total = 0
            for i, f in enumerate(filas):
                tag = "odd" if i % 2 == 0 else "even"
                self.tree.insert("", "end", values=(
                    f"#{f['id_venta']}", f['fecha'],
                    f['cliente'], f['producto'],
                    f['cantidad'], f"${f['subtotal']:,.0f}",
                    f['metodo_pago'], f['estado']
                ), tags=(tag,))
                total += f['subtotal']
            self.total_label.configure(
                text=f"TOTAL GENERAL:  ${total:,.0f}")
            self.status.configure(
                text=f"✔  {len(filas)} venta(s) entre {inicio} y {fin}.", fg=GREEN)
        except mysql.connector.Error as e:
            messagebox.showerror("Error de BD", e.msg)
            self.status.configure(text=f"Error: {e.msg}", fg=RED)
 
    def _limpiar(self):
        self.entry_inicio.delete(0, "end")
        self.entry_fin.delete(0, "end")
        self.tree.delete(*self.tree.get_children())
        self.total_label.configure(text="TOTAL GENERAL:  —")
        self.status.configure(
            text="Ingresa un rango de fechas y presiona Generar Reporte", fg=MUTED)
 
 
# ══════════════════════════════════════════════════════
# MAIN
# ══════════════════════════════════════════════════════
if __name__ == "__main__":
    app = ClefSportApp()
    app.mainloop()