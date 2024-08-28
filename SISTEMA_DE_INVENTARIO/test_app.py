import unittest
from app import add_product, update_product, delete_product, record_sale
from app import Product, Sale
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import IntegrityError

class TestInventorySystem(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Configurar la base de datos en memoria para pruebas
        cls.engine = create_engine('sqlite:///:memory:')
        cls.Session = sessionmaker(bind=cls.engine)
        
        # Crear las tablas
        Product.metadata.create_all(cls.engine)
        Sale.metadata.create_all(cls.engine)
    
    def setUp(self):
        # Crear una nueva sesión para cada prueba
        self.session = self.Session()
    
    def tearDown(self):
        # Cerrar la sesión después de cada prueba
        self.session.close()
    
    def test_add_product(self):
        product = add_product('Laptop', 'Electronics', 1000.00, 10, session=self.session)
        self.assertIsNotNone(product.id)
        self.assertEqual(product.name, 'Laptop')
        self.assertEqual(product.category, 'Electronics')
    
    def test_delete_product(self):
        product = add_product('Laptop', 'Electronics', 1000.00, 10, session=self.session)
        self.assertIsNotNone(product.id)
        # Llama a la función delete_product que debe estar implementada
        delete_product(product.id, session=self.session)
        deleted_product = self.session.query(Product).get(product.id)
        self.assertIsNone(deleted_product)
    
    def test_delete_product(self):
        product = add_product('Laptop', 'Electronics', 1000.00, 10, session=self.session)
        self.assertIsNotNone(product)
        
        delete_product(product.id, session=self.session)
        
        self.session.expire_all()
        deleted_product = self.session.get(Product, product.id)
        self.assertIsNone(deleted_product)
    
    def test_record_sale(self):
        product = add_product('Laptop', 'Electronics', 1000.00, 10, session=self.session)
        record_sale(product.id, 2, session=self.session)
        updated_product = self.session.get(Product, product.id)
        self.assertEqual(updated_product.stock, 8)
    
    def test_full_workflow(self):
        product1 = add_product('Laptop', 'Electronics', 1000.00, 10, session=self.session)
        self.assertIsNotNone(product1.id)
        # Implementa y llama a otras funciones para verificar el flujo completo

if __name__ == '__main__':
    unittest.main()
