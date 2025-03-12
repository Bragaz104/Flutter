// ======== MODELLO PRODOTTO ========
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

// ======== LISTA PRODOTTI ========
final List<Product> dummyProducts = [
  Product(
    id: 'p1',
    name: 'Smartwatch',
    description: 'Orologio intelligente con monitoraggio fitness e notifiche.',
    price: 199.99,
    imageUrl:
        'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p2',
    name: 'Wireless Earbuds',
    description: 'Auricolari senza fili con cancellazione del rumore.',
    price: 79.99,
    imageUrl:
        'https://images.unsplash.com/photo-1615281612781-4b972bd4e3fe?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p3',
    name: 'Laptop',
    description: 'Laptop potente con processore i7 e 16GB di RAM.',
    price: 1099.99,
    imageUrl:
        'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p4',
    name: 'Gaming Mouse',
    description:
        'Mouse da gaming RGB con 12000 DPI e pulsanti personalizzabili.',
    price: 49.99,
    imageUrl:
        'https://images.unsplash.com/photo-1629429408209-1f912961dbd8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p5',
    name: 'Mechanical Keyboard',
    description: 'Tastiera meccanica con switch blu e retroilluminazione RGB.',
    price: 89.99,
    imageUrl:
        'https://images.unsplash.com/photo-1626958390898-162d3577f293?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p6',
    name: '4K Monitor',
    description: 'Monitor UHD da 27 pollici con pannello IPS.',
    price: 349.99,
    imageUrl:
        'https://images.unsplash.com/photo-1614624532983-4ce03382d63d?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p7',
    name: 'External SSD',
    description: 'SSD portatile da 1TB con velocità fino a 1050MB/s.',
    price: 129.99,
    imageUrl:
        'https://images.unsplash.com/photo-1628557118391-56cd62c9f2cb?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Product(
    id: 'p8',
    name: 'VR Headset',
    description:
        'Visore per la realtà virtuale con supporto per giochi immersivi.',
    price: 399.99,
    imageUrl:
        'https://images.unsplash.com/photo-1622979135225-d2ba269cf1ac?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];
