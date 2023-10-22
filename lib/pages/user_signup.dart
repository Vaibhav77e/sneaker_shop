import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class UserSignUp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              CustomTextField(
                controller: nameController,
                hintText: 'Name',
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This filed can\'t be left empty';
                  }
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                validator: (val) {
                  // if (val!.length < 2) {
                  //   Toast.show('msg');
                  // }
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: (val) {},
                  onChanged: (p0) {},
                  keyboardType: TextInputType.text),
              CustomTextField(
                controller: passwordController,
                hintText: 'Confirm password',
                validator: (val) {},
                onChanged: (p0) {},
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
