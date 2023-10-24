import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/pages/auth_screens/login.dart';
import 'package:sneaker_shop/services/shoerepo/shoes_repo.dart';
import 'package:sneaker_shop/widgets/CustomButton/custom_button.dart';
import '../../widgets/Toasts/toasts.dart';
import '../../widgets/custom_textfield.dart';

class Admin extends StatefulWidget {
  Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController nameofShoeController = TextEditingController();
  TextEditingController priceofShoeController = TextEditingController();
  TextEditingController imageUrlofShoeController = TextEditingController();
  TextEditingController descriptionofShoeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uploadShoeData = Provider.of<ShoeRepo>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Shoe'),
        backgroundColor: Colors.amber,
      ),
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
                controller: nameofShoeController,
                hintText: 'Name of Shoe',
                validator: (val) {
                  if (val!.isEmpty) {
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  return null;
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.name,
              ),
              CustomTextField(
                controller: priceofShoeController,
                hintText: 'Price',
                validator: (val) {
                  if (val!.isEmpty) {
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  return null;
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                  controller: imageUrlofShoeController,
                  hintText: 'ImageUrl',
                  validator: (val) {
                    if (val!.isEmpty) {
                      Toasts.showWarningToast(
                          'This filed can\'t be left empty');
                      return;
                    }
                    return;
                  },
                  onChanged: (p0) {},
                  keyboardType: TextInputType.text),
              CustomTextField(
                controller: descriptionofShoeController,
                hintText: 'Description',
                validator: (val) {
                  if (val!.isEmpty) {
                    Toasts.showWarningToast('This filed can\'t be left empty');
                    return;
                  }
                  return;
                },
                onChanged: (p0) {},
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onTap: () {
                    uploadShoeData.uploadShoesDetailsToServer(
                        nameofShoeController.text.trim(),
                        priceofShoeController.text.trim(),
                        imageUrlofShoeController.text.trim(),
                        descriptionofShoeController.text.trim());
                  },
                  buttonText: 'Upload Shoe Data')
            ],
          ),
        ),
      ),
    );
  }
}
