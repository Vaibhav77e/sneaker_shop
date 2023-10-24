import 'package:flutter/material.dart';
import 'package:sneaker_shop/widgets/CustomButton/custom_button.dart';
import '../homepage.dart';
import '../auth_screens/user_signup.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/nike_logo2.png',
                // height: 240,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Just Do It',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Brand new sneakers and custom kicks and premium quality',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                onTap: () => Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => HomePage()),
                  MaterialPageRoute(builder: (context) => UserSignUp()),
                ),
                buttonText: 'Shop Now',
              )
            ],
          ),
        ),
      ),
    );
  }
}
