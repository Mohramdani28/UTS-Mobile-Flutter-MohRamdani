import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CartPage extends StatelessWidget {

  final List<Map<String, String>> cartItems;

  const CartPage({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.dark,

      appBar: AppBar(
        backgroundColor: AppColors.dark,

        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: cartItems.isEmpty

          ? const Center(
              child: Text(
                'Cart is Empty',

                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                ),
              ),
            )

          : ListView.builder(

              padding: const EdgeInsets.all(20),

              itemCount: cartItems.length,

              itemBuilder: (context, index) {

                final product = cartItems[index];

                return Container(
                  margin:
                      const EdgeInsets.only(bottom: 20),

                  padding: const EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: Colors.white10,

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [

                      // IMAGE
                      Container(
                        width: 90,
                        height: 90,

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15),

                          image: DecorationImage(
                            image: NetworkImage(
                              product['image']!,
                            ),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      // INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(
                              product['name']!,

                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              product['price']!,

                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}