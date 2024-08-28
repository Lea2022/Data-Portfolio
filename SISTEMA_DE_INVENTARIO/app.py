from sqlalchemy import create_engine, Column, Integer, String, Float, DateTime, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from datetime import datetime

# Configuración de la base de datos
engine = create_engine('sqlite:///inventory.db') 

# Definición de  labase declarativa
Base = declarative_base()




# Definición de las tablas
class Product(Base):
    __tablename__ = 'products'
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String, nullable=False)
    category = Column(String, nullable=False)
    price = Column(Float, nullable=False)
    stock = Column(Integer, nullable=False)

    """
    Clase que representa un producto en el sistema de gestión de inventarios.

    Atributos:
    ----------
    id : int
        ID único del producto.
    name : str
        Nombre del producto.
    category : str
        Categoría a la que pertenece el producto.
    price : float
        Precio del producto.
    stock : int
        Cantidad disponible en inventario del producto.
    sales : relationship
        Relación con la clase `Sale`, que representa las ventas asociadas a este producto.
    """

class Sale(Base):
    __tablename__ = 'sales'
    id = Column(Integer, primary_key=True)
    product_id = Column(Integer, ForeignKey('products.id'), nullable=False)
    quantity_sold = Column(Integer, nullable=False)
    sale_date = Column(DateTime, default=datetime.utcnow)

     # Relación con la clase `Product`
    product = relationship('Product', back_populates='sales')
    """
    Clase que representa una venta en el sistema de gestión de inventarios.

    Atributos:
    ----------
    id : int
        ID único de la venta.
    product_id : int
        ID del producto asociado a la venta.
    quantity_sold : int
        Cantidad del producto vendida.
    sale_date : datetime
        Fecha y hora en que se realizó la venta.
    product : relationship
        Relación con la clase `Product`, que representa el producto vendido.
    """

# Relación con la clase `Sale`
Product.sales = relationship('Sale', order_by=Sale.id, back_populates='product')  

# Crear las tablas en la base de datos
Base.metadata.create_all(engine)

# Crear una sesión
Session = sessionmaker(bind=engine)
session = Session()

# Funciones CRUD (Agregar, actualizar, eliminar productos)
def add_product(name, category, price, stock, session):
    new_product = Product(name=name, category=category, price=price, stock=stock)
    session.add(new_product)
    session.commit()
    return new_product


def update_product(product_id, session, **kwargs):
    product = session.query(Product).get(product_id)
    if product:
        for key, value in kwargs.items():
            setattr(product, key, value)
        session.commit()
        print(f"Producto ID {product_id} actualizado exitosamente.")
    else:
        print(f"Producto ID {product_id} no encontrado.")

def delete_product(product_id, session):
    product = session.get(Product, product_id)  # Cambia query.get() a session.get()
    if product:
        session.delete(product)
        session.commit()
        print(f"Producto ID {product_id} eliminado exitosamente.")
    else:
        print(f"Producto ID {product_id} no encontrado.")


# Funciones avanzadas (Registrar ventas, generar reportes)

#record_sale: Esta función registra una venta si hay suficiente stock disponible y actualiza el inventario.
def record_sale(product_id, quantity, session):
    product = session.get(Product, product_id)  
    if product is None:
        raise ValueError("Product not found")

    if product.stock >= quantity:  
        product.stock -= quantity
        session.commit()
    else:
        raise ValueError("Not enough stock")


#generate_inventory_report: Esta función lista todos los productos en el inventario, 
#mostrando detalles clave como el nombre, categoría, precio, y cantidad en stock.
def generate_inventory_report():
    products =session.query(Product).all()
    print("Reporte de Inventario:")
    for product in products:
        print(f"ID: {product.id}, Nombre: {product.name}, Categoría: {product.category}, Precio: ${product.price:.2f}, Stock: {product.quantity_in_stock}")

    

#generate_sales_report: Esta función lista todas las ventas realizadas,
#mostrando información sobre el producto vendido, la cantidad, y la fecha de la venta.
def generate_sales_report():
    sales = session.query(Sale).all()
    print("Reporte de Ventas:")
    for sale in sales:
        product = session.query(Product).filter(Product.id == sale.product_id).first()
        print(f"ID de Venta: {sale.id}, Producto: {product.name}, Cantidad Vendida: {sale.quantity_sold}, Fecha de Venta: {sale.sale_date}")


#check_low_stock: Esta función verifica todos los productos y te notifica si algún producto tiene stock por debajo de
#un umbral definido (en este caso, 5 unidades).
def check_low_stock(threshold=5):
    low_stock_products = session.query(Product).filter(Product.quantity_in_stock <= threshold).all()

    if low_stock_products:
        print("¡Alerta de Stock Bajo!")
        for product in low_stock_products:
            print(f"Producto: {product.name}, Stock Actual: {product.quantity_in_stock}")
    else:
        print("Todos los productos tienen suficiente stock.")



# Interfaz de usuario (Menú y navegación)
#Cada opción del menú llama a una función que corresponde a una operación CRUD o a la generación de reportes. 
#La interacción es sencilla, permitiendo que el usuario ingrese datos cuando sea necesario.
def print_menu():
    print("\n--- Sistema de Gestión de Inventarios ---")
    print("1. Agregar un nuevo producto")
    print("2. Actualizar un producto existente")
    print("3. Eliminar un producto")
    print("4. Registrar una venta")
    print("5. Generar reporte de inventario")
    print("6. Generar reporte de ventas")
    print("7. Verificar stock bajo")
    print("8. Salir")

def main():
    while True:
        print_menu()
        choice = input("Seleccione una opción:")

        if choice == "1":
            name = input("Nombre del producto: ")
            category = input("Categoría: ")
            price = float(input("Precio: "))
            quantity_in_stock = int(input("Cantidad en stock: "))
            add_product(name, category, price, quantity_in_stock)

        elif choice == "2":
            product_id = int(input("ID del producto a actualizar: "))
            field = input("¿Qué desea actualizar? (name, category, price, quantity_in_stock): ")
            value = input(f"Nuevo valor para {field}: ")

            if field in ['price', 'quantity_in_stock']:
                value = float(value) if field == 'price' else int(value)

            update_product(product_id, **{field: value})

        elif choice == '3':
            product_id = int(input("ID del producto a eliminar: "))
            delete_product(product_id)

        elif choice == '4':
            product_id = int(input("ID del producto a vender: "))
            quantity_sold = int(input("Cantidad vendida: "))
            record_sale(product_id, quantity_sold)

 
        elif choice == '5':
            generate_inventory_report()
        
        elif choice == '6':
            generate_sales_report()
        
        elif choice == '7':
            threshold = int(input("Umbral para stock bajo: "))
            check_low_stock(threshold)

        elif choice == '8':
            print("Saliendo del sistema...")
            break
        
        else:
            print("Opción no válida, por favor intente de nuevo.")       

if __name__ == "__main__":
    main()
