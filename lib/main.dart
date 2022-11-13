import 'package:flutter/material.dart';
import 'package:product_card/Product_card.dart';
import 'package:product_card/product_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Card'),
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, state, child) => ProductCard(
                  image:
                      'https://www.selasar.com/wp-content/uploads/2020/06/Buah-Buahan.jpg',
                  onAddToCardTap: () {},
                  onDecrementTap: () {
                    if (state.quantity > 0) {
                      state.quantity--;
                    }
                  },
                  onIncrementTap: () {
                    if (state.quantity < 10) {
                      state.quantity++;
                    }
                  },
                  quantity: state.quantity,
                  totalValue: 10,
                  value: 10 - state.quantity,
                  isDiscount: state.quantity >= 5,
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
