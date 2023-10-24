import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/auth_screens/login.dart';
import 'package:sneaker_shop/widgets/CustomButton/custom_button.dart';
import '../../widgets/Toasts/toasts.dart';
import '../../widgets/custom_textfield.dart';

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
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  if (val!.length < 2) {
                    Toasts.showWarningToast('The name is too short');
                    return;
                  }
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                validator: (val) {
                  if (val!.isEmpty) {
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val)) {
                    Toasts.showWarningToast('Please a vaild email');
                    return;
                  }
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      Toasts.showWarningToast(
                          'This filed can\'t be left empty');
                      return;
                    }
                    if (val.length < 10) {
                      Toasts.showWarningToast('Password must of length 10');
                      return;
                    }
                  },
                  onChanged: (p0) {},
                  keyboardType: TextInputType.text),
              CustomTextField(
                controller: passwordController,
                hintText: 'Confirm password',
                validator: (val) {
                  if (val!.isEmpty) {
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  if (confirmPasswordController.text !=
                      passwordController.text) {
                    Toasts.showWarningToast('Password doesn\'t match');
                    return;
                  }
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserLogin()));
                      },
                      child: const Text('Login'))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(onTap: () {}, buttonText: 'Sign Up')
            ],
          ),
        ),
      ),
    );
  }
}
