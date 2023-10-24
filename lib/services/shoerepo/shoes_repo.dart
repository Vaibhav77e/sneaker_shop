import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sneaker_shop/consts/env.dart';
import 'package:http/http.dart' as http;

import '../../models/shoe.dart';

class ShoeRepo extends ChangeNotifier {
  final List<Shoe> getRecommendedShoesList = [];
  Future<void> uploadShoesDetailsToServer(
      String name, String price, String imageUrl, String descriptions) async {
    var url = '$BASE_URL/addShoeToMarketPlace/';
    Map<String, dynamic> data = {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'descriptions': descriptions,
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(data));

    if (response.statusCode <= 202) {
      if (response.body.isNotEmpty) {
        print(response.body);
      }
    }
  }

  Future<void> getAllShoes() async {
    var url = '$BASE_URL/getRecommenedShoes/';
    var uri = Uri.parse(url);

    var response = await http.get(uri);
    if (response.statusCode <= 202) {
      var decodedBody = json.decode(response.body);
      getRecommendedShoesList.clear();
      decodedBody.forEach((each) {
        getRecommendedShoesList.add(Shoe(
            id: each['id'],
            name: each['name'],
            price: each['price'],
            imagePath: each['imageUrl'],
            description: each['description']));
      });
    }
  }

  Future<void> postShoesData(
      String name, String price, String description, File? image) async {
    var url = '$BASE_URL/postShoes/';
    var uri = Uri.parse(url);

    var response = http.MultipartRequest('POST', uri);

    response.fields['name'] = name;
    response.fields['price'] = price;
    response.fields['description'] = description;

    if (image != null) {
      response.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
          // contentType: MediaType('image', 'jpeg'),
        ),
      );
    }

    var responseBody = await response.send();
    if (responseBody.statusCode == 201) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed with status ${responseBody.statusCode}');
    }
  }
}
