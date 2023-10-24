import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/services/shoerepo/shoes_repo.dart';
import '../widgets/bottom_nav_bar.dart';
import './cartPage.dart';
import './shopPage.dart';
import '../widgets/Drawer_menu/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  // this method will update value of _selectIndex
  void navigatorBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  //pages to display
  List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final getShoe = Provider.of<ShoeRepo>(context).getAllShoes();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar:
          BottomNav(selectedTab: (index) => navigatorBottomBar(index)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: NewDrawer(),
      body: _pages[_selectIndex],
    );
  }
}
