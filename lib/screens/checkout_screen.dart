import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provides/cart_provider.dart';
import '../models/product.dart';

// ======== SCHERMATA CHECKOUT ========
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _paymentMethod = 'Stripe';

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simula un pagamento riuscito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ordine completato con successo!')),
      );

      // Svuota il carrello
      Provider.of<CartProvider>(context, listen: false).clearCart();

      // Torna alla schermata principale
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

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
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Riepilogo Ordine
            Text(
              'Totale: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            // Form dati utente
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome Completo',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci il tuo nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Indirizzo di Spedizione',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Inserisci l\'indirizzo di spedizione';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Metodo di Pagamento',
                    ),
                    value: _paymentMethod,
                    items: const [
                      DropdownMenuItem(value: 'Stripe', child: Text('Stripe')),
                      DropdownMenuItem(value: 'PayPal', child: Text('PayPal')),
                      DropdownMenuItem(
                        value: 'Carta di Credito',
                        child: Text('Carta di Credito'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitOrder,
                    child: const Text('Conferma Ordine'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
