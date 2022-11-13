import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final Function() onDecrementTap;
  final Function() onIncrementTap;
  final Function() onAddToCardTap;
  final int quantity;
  final int value;
  final int totalValue;
  final bool isDiscount;
  const ProductCard(
      {super.key,
      required this.image,
      required this.onDecrementTap,
      required this.onIncrementTap,
      required this.onAddToCardTap,
      required this.quantity,
      required this.value,
      required this.totalValue,
      required this.isDiscount});

  @override
  Widget build(BuildContext context) {
    double width = 140;
    double ratio = value / totalValue;
    TextStyle textStyle = TextStyle(fontFamily: 'Lato');
    return Stack(
      children: [
        //notif
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 10),
          duration: Duration(milliseconds: 300),
          width: 130,
          height: isDiscount ? 300 : 265,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.green),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Diskon 10%',
              style: textStyle.copyWith(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        //card
        Container(
          width: 150,
          height: 280,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
                offset: Offset(1, 1))
          ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Buah mix 1 KG', style: textStyle),
                        SizedBox(height: 5),
                        Text('Rp. 25.000',
                            style: textStyle.copyWith(color: Colors.lightBlue))
                      ],
                    ),
                  )
                ],
              ),
              //Tengah
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.view_in_ar,
                            color: Colors.grey[800],
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '$value/10 pcs',
                            style: textStyle.copyWith(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Stack(
                        children: [
                          Container(
                            width: width,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: width * ratio,
                            height: 5,
                            decoration: BoxDecoration(
                                color: ratio < 0.33
                                    ? Colors.red
                                    : ratio < 0.77
                                        ? Colors.amber
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ],
                      )
                    ],
                  )),
              //bawah
              Column(
                children: [
                  //button + -
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.lightBlue),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onDecrementTap,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(color: Colors.lightBlue),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onIncrementTap,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //button addToCart
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 140,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                    child: Material(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16)),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16)),
                        onTap: onAddToCardTap,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
