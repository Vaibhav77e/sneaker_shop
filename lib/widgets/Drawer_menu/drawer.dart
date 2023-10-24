import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/admin_screen/admin.dart';

class NewDrawer extends StatelessWidget {
  const NewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'images/nike_logo2.png',
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.grey[500],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Admin()));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'Admin',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 20),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
