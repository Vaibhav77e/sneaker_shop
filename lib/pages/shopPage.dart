import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/shoerepo/shoes_repo.dart';
import '../widgets/shoeList.dart';
import '../models/shoe.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(shoe) {
    Provider.of<Cart>(context, listen: false).addItems(shoe);
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Successful'),
              content: Text('Check Your Cart!!!'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final getList = Provider.of<ShoeRepo>(context);
    final getShoe = Provider.of<ShoeRepo>(context).getAllShoes();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black38)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search',
                style: TextStyle(color: Colors.blue),
              ),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          // padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Everyone files.. some fly longer than others just don\'t give up....',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Hot pics for you 🔥',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getList.getRecommendedShoesList.length,
              itemBuilder: (builderctx, index) {
                final shoeData = getList.getRecommendedShoesList[index];
                return ShoeList(
                  shoeName: shoeData.name,
                  shoeImageUrl: shoeData.imagePath,
                  shoePrice: shoeData.price,
                  shoeDescriptions: shoeData.description,
                  addNewShoe: () {},
                );
              }),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}





  // Consumer<Cart>(
  //     builder: (context, cartVal, childnouse) => Column(
  //       children: [
  //         Container(
  //           padding: const EdgeInsets.all(12),
  //           margin: const EdgeInsets.symmetric(horizontal: 25),
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //               border: Border.all(color: Colors.black38)),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: const [
  //               Text(
  //                 'Search',
  //                 style: TextStyle(color: Colors.blue),
  //               ),
  //               Icon(Icons.search, color: Colors.grey),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           // padding: const EdgeInsets.symmetric(vertical: 20.0),
  //           child: Text(
  //             'Everyone files.. some fly longer than others just don\'t give up....',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.grey[600]),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             children: const [
  //               Text(
  //                 'Hot pics for you 🔥',
  //                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
  //               ),
  //               Text(
  //                 'See all',
  //                 style: TextStyle(color: Colors.blue),
  //               )
  //             ],
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         Expanded(
  //           child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: 4,
  //               itemBuilder: (builderctx, index) {
  //                 Shoe shoe = cartVal.getShoeList()[index];
  //                 return ShoeList(
  //                   shoe: shoe,
  //                   addNewShoe: () => addShoeToCart(shoe),
  //                 );
  //               }),
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.only(top: 25, left: 25, right: 25),
  //           child: Divider(
  //             color: Colors.white,
  //           ),
  //         )
  //       ],
  //     ),
  //   );