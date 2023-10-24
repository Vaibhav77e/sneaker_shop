import 'package:flutter/material.dart';
import '../models/shoe.dart';
import '../models/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Consumer<Cart>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      Shoe individualShoe = value.getUserCart()[index];
                      return CartItem(
                        shoe: individualShoe,
                      );
                    }),
              )
            ],
          ),
        ),
      ),

      //-----------Working-----------------------------
      // Image was able to load from aws s3
      // body: Container(
      //   child: Image.network(
      //       'https://vaibhav-s3-django-bucket.s3.ap-south-1.amazonaws.com/static/blog_images/nike.png'),
      // ),
    );
  }
}
