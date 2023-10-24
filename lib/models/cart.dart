import 'package:flutter/material.dart';

import './shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShopList = [
    // Shoe(
    //     name: 'Air Jordan',
    //     price: '₹ 10,795',
    //     imagePath: 'images/airjordan.png',
    //     description:
    //         'Pair it with jeans, joggers or whatever else—the timeless look is the perfect match for any outfit.'),
    // Shoe(
    //     name: 'KD Treys',
    //     price: '₹ 12,295',
    //     imagePath: 'images/KDTREY.png',
    //     description:
    //         'Every time the AJ1 gets a remake, you get the classic sneaker in new colours and textures for an exciting'),
    // Shoe(
    //     name: 'Kyrie',
    //     price: '₹ 7,095',
    //     imagePath: 'images/Kyrie.png',
    //     description:
    //         'Break away from the norm and dash up that tempting trail in the  Kyrie'),
    // Shoe(
    //     name: 'Nike Revolution 6',
    //     price: '₹ 3,695',
    //     imagePath: 'images/nike.png',
    //     description:
    //         'Here\'s to new beginnings between you and the tarmac.We know comfort is key to a successful run'),
  ];

  //items in user cart
  List<Shoe> userCart = [];

  // items for sale
  List<Shoe> getShoeList() {
    return shoeShopList;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItems(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeItems(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
