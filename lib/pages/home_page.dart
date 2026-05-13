import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../data/dummy_products.dart';
import '../data/cart_data.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
 State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  String searchText = '';

  final categories = [
    'Sneakers',
    'Running',
    'Basketball',
    'Casual',
    'Training',
  ];

  @override
  Widget build(BuildContext context) {
    final currentCategory = categories[selectedCategory];

    final currentProducts = dummyProducts[currentCategory]!
        .where((product) => product['name']!
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.dark,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SNEAKER STORE',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CartPage(
                              cartItems:
                                  globalCartItems,
                            ),
                          ),
                        ).then((_) {
                          setState(() {});
                        });
                      },
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          ),

                          Positioned(
                            right: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets
                                      .all(5),
                              decoration:
                                  const BoxDecoration(
                                color:
                                    AppColors.primary,
                                shape:
                                    BoxShape.circle,
                              ),
                              child: Text(
                                '${globalCartItems.length}',
                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // SEARCH
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search sneakers...',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // BANNER
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(
                            25),
                    gradient:
                        const LinearGradient(
                      colors: [
                        Color(0xffFF7A00),
                        Color(0xffFF9F45),
                      ],
                      begin:
                          Alignment.topLeft,
                      end: Alignment
                          .bottomRight,
                    ),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            const Text(
                              'BIG SALE 🔥',
                              style: TextStyle(
                                color:
                                    Colors.white,
                                fontSize: 28,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 10),

                            const Text(
                              'Up to 50% discount\nfor all sneakers',
                              style:
                                  TextStyle(
                                color: Colors
                                    .white,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(
                                height: 15),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal:
                                    18,
                                vertical:
                                    10,
                              ),
                              decoration:
                                  BoxDecoration(
                                color:
                                    Colors.white,
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            14),
                              ),
                              child:
                                  const Text(
                                'Shop Now',
                                style:
                                    TextStyle(
                                  color:
                                      AppColors
                                          .primary,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Image.network(
                        'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
                        height: 130,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // CATEGORY
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection:
                        Axis.horizontal,
                    itemCount:
                        categories.length,
                    itemBuilder:
                        (context, index) {
                      final isSelected =
                          selectedCategory ==
                              index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory =
                                index;
                          });
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(
                                  right: 10),
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration:
                              BoxDecoration(
                            color: isSelected
                                ? AppColors
                                    .primary
                                : Colors.white10,
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        12),
                          ),
                          alignment:
                              Alignment.center,
                          child: Text(
                            categories[index],
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // PRODUCT LIST
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  itemCount:
                      currentProducts.length,
                  itemBuilder:
                      (context, index) {
                    final product =
                        currentProducts[index];

                    return Container(
                      margin:
                          const EdgeInsets.only(
                              bottom: 15),
                      padding:
                          const EdgeInsets.all(
                              15),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius:
                            BorderRadius.circular(
                                20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration:
                                BoxDecoration(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15),
                              image:
                                  DecorationImage(
                                image:
                                    NetworkImage(
                                  product[
                                      'image']!,
                                ),
                                fit: BoxFit
                                    .cover,
                              ),
                            ),
                          ),

                          const SizedBox(
                              width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  product[
                                      'name']!,
                                  style:
                                      const TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize:
                                        16,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                const SizedBox(
                                    height: 8),

                                Text(
                                  product[
                                      'price']!,
                                  style:
                                      const TextStyle(
                                    color:
                                        AppColors
                                            .primary,
                                    fontSize:
                                        16,
                                  ),
                                ),

                                const SizedBox(
                                    height: 10),

                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      globalCartItems
                                          .add(
                                              product);
                                    });

                                    ScaffoldMessenger
                                            .of(
                                                context)
                                        .showSnackBar(
                                      SnackBar(
                                        content:
                                            Text(
                                          '${product['name']} added to cart',
                                        ),
                                      ),
                                    );
                                  },
                                  child:
                                      Container(
                                    padding:
                                        const EdgeInsets
                                            .symmetric(
                                      horizontal:
                                          18,
                                      vertical:
                                          10,
                                    ),
                                    decoration:
                                        BoxDecoration(
                                      color:
                                          AppColors
                                              .primary,
                                      borderRadius:
                                          BorderRadius.circular(
                                              12),
                                    ),
                                    child:
                                        const Row(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min,
                                      children: [
                                        Icon(
                                          Icons
                                              .shopping_cart,
                                          color: Colors
                                              .white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                            width:
                                                8),
                                        Text(
                                          'Add to Cart',
                                          style:
                                              TextStyle(
                                            color: Colors
                                                .white,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}