import 'package:flutter/material.dart';
import '../models/shoe.dart';

class ShoeList extends StatelessWidget {
  Shoe shoe;
  void Function()? addNewShoe;
  ShoeList({required this.shoe, required this.addNewShoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 320,
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ClipRRect(child: Image.asset(shoe.imagePath)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            shoe.description,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //not working cause don't know
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(shoe.price)
                ],
              ),
              GestureDetector(
                onTap: addNewShoe,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
