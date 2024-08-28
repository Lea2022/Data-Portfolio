SISTEMA DE GESTION DE INVENTARIOS.

DESCRIPCIÓN.
Este Sistema de Gestión de Inventarios está diseñado para pequeñas empresas que necesitan gestionar su inventario de manera eficiente. El sistema permite a los usuarios agregar, actualizar, eliminar productos y registrar ventas, manteniendo niveles de stock precisos. Está construido utilizando Python, SQLAlchemy para la interacción con la base de datos, y ofrece una interfaz de usuario basada en consola.


CARACTERISTICAS:
Agregar Producto: Añadir nuevos productos al inventario con detalles como nombre, categoría, precio y cantidad en stock.

Actualizar Producto: Actualizar los detalles de productos existentes en el inventario.

Eliminar Producto: Eliminar productos del inventario.

Registrar Venta: Registrar transacciones de ventas y actualizar los niveles de stock en consecuencia.

Ver Inventario: Ver el estado actual de todos los productos en el inventario.



INSTALACIÓN.

Clonar el repositorio:
git clone https://github.com/LeandroAcuña/Data-Portfolio.git

Navegar al directorio del proyecto:
cd inventory_system

Instalar las dependencias necesarias:
pip install -r requirements.txt



USO.

Ejecutar la aplicación:
python app.py

Ejecutar los tests:
python -m unittest discover




ESTRUCTURA DEL PROYECTO.

app.py: La lógica principal de la aplicación para gestionar el inventario.
models.py: Contiene los modelos de base de datos para Producto y Venta.
test_app.py: Pruebas unitarias para la aplicación.
requirements.txt: Lista de dependencias necesarias para ejecutar el proyecto.



ESQUEMA DE LA BASE DE DATOS.

Producto:
id: Entero, Clave primaria, Auto-incremental
nombre: Cadena, No nulo
categoría: Cadena, No nulo
precio: Flotante, No nulo
stock: Entero, No nulo

Venta:
id: Entero, Clave primaria
product_id: Entero, Clave foránea, Referencia Producto(id)
cantidad_vendida: Entero, No nulo
fecha_venta: DateTime, Por defecto, el tiempo actual
Diagramas




Contribuciones
Si tienes sugerencias o mejoras, no dudes en abrir un issue o enviar un pull request.

Licencia
Este proyecto está licenciado bajo la Licencia MIT.

Contacto
Para cualquier consulta, puedes contactarme en:

Correo electrónico: leandro.acuna.db@gmail.com
