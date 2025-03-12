import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../provides/cart_provider.dart';
import 'checkout_screen.dart';

// ======== SCHERMATA CARRELLO ========
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems =
        cartProvider.items.entries.map((entry) {
          final productId = entry.key;
          final quantity = entry.value;
          final product = dummyProducts.firstWhere(
            (p) => p.id == productId,
            orElse:
                () => Product(
                  id: productId,
                  name: 'Unknown',
                  price: 0,
                  imageUrl: '',
                  description: '',
                ),
          );
          return {'product': product, 'quantity': quantity};
        }).toList();

    double totalPrice = cartItems.fold(0.0, (sum, item) {
      final product = item['product'] as Product;
      final quantity = item['quantity'] as int;
      return sum + product.price * quantity;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Carrello')),
      body:
          cartItems.isEmpty
              ? const Center(child: Text('Il carrello è vuoto'))
              : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  final Product product = item['product'] as Product;
                  final int quantity = item['quantity'] as int;
                  return ListTile(
                    leading:
                        product.imageUrl.isNotEmpty
                            ? Image.network(
                              product.imageUrl,
                              width: 50,
                              height: 50,
                            )
                            : const Icon(Icons.shopping_bag),
                    title: Text(product.name),
                    subtitle: Text('Quantità: $quantity'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            cartProvider.removeItem(product.id);
                          },
                        ),
                        Text(
                          '\$${(product.price * quantity).toStringAsFixed(2)}',
                        ),
                      ],
                    ),
                  );
                },
              ),
      bottomNavigationBar:
          cartItems.isEmpty
              ? null
              : Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Totale: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckoutScreen(),
                          ),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
    );
  }
}
