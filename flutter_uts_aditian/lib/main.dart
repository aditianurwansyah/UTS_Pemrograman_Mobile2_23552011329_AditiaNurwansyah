import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_uts_aditian/blocs/cart_cubit.dart';
import 'package:flutter_uts_aditian/models/product_model.dart';
import 'package:flutter_uts_aditian/widgets/product_card.dart';
import 'package:flutter_uts_aditian/pages/cart_summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: MaterialApp(
        title: 'Flutter UTS Aditian',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        ),
        routes: {
          '/': (_) => const HomePage(),
          '/cart': (_) => const CartSummaryPage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Sample products for demo
  List<ProductModel> get sampleProducts => [
    ProductModel(
      id: '1',
      name: 'Red Shoes',
      price: 7999,
      image: 'https://img.pikbest.com/origin/09/29/88/74FpIkbEsTGez.png!w700wp',
    ),
    ProductModel(
      id: '2',
      name: 'Blue Shirt',
      price: 4999,
      image:
          'https://img.pikbest.com/png-images/blue-short-sleeved-t-shirt_5882414.png!w700wp',
    ),
    ProductModel(
      id: '3',
      name: 'Watch',
      price: 15999,
      image:
          'https://img.pikbest.com/png-images/20241102/simple-watch-silhouettes-vector-pack_11046033.png!w700wp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleProducts.length,
        itemBuilder: (context, index) {
          final p = sampleProducts[index];
          return ProductCard(product: p);
        },
      ),
    );
  }
}
