import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_app/model/food.dart';
import 'package:menu_app/model/shop.dart';
import 'package:menu_app/theme/colors.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  PaymentConfiguration? _paymentConfiguration;
  late List<PaymentItem> _paymentItems;

  @override
  void initState() {
    super.initState();
    _loadPaymentConfiguration();
  }

  Future<void> _loadPaymentConfiguration() async {
    final configString = await rootBundle.loadString('asset/gpay.json');
    setState(() {
      _paymentConfiguration = PaymentConfiguration.fromJsonString(configString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) {
        double total = 0;
        for (var food in value.cart) {
          total += double.tryParse(food.price) ?? 0;
        }

        _paymentItems = [
          PaymentItem(
            label: 'Total',
            amount: total.toStringAsFixed(2),
            status: PaymentItemStatus.final_price,
          ),
        ];

        void removeFromCart(Food food) {
          value.removeToCart(food);
        }

        return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            foregroundColor: Colors.white,
            title: const Text("Cart"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    final Food food = value.cart[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                        top: 20,
                        left: 20,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          food.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '\$${food.price}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          onPressed: () => removeFromCart(food),
                          icon: const Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (_paymentConfiguration != null)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GooglePayButton(
                    paymentConfiguration: _paymentConfiguration!,
                    paymentItems: _paymentItems,
                    type: GooglePayButtonType.pay,
                    onPaymentResult: (data) {
                      if (kDebugMode) print(data);
                    },
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    );
  }
}
