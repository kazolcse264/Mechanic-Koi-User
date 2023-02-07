import 'package:flutter/material.dart';

void showMultipleTextFieldInputDialog({
  required BuildContext context,
  required String title,
  String positiveButton = 'OK',
  String negativeButton = 'CLOSE',
  required Function(List) onSubmit,
}) {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Full Name',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Phone Number',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email Address Same as Login Email',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter City',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: zipCodeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Zip Code',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: address1Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Address Line 1',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: address2Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Address Line 2',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Gender',
                    ),
                  ),
                  const SizedBox(height: 5,),
                  TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Age',
                    ),
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            )
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(negativeButton),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isEmpty) return;
              if (phoneController.text.isEmpty) return;
              if (emailController.text.isEmpty) return;
              if (cityController.text.isEmpty) return;
              if (zipCodeController.text.isEmpty) return;
              if (address1Controller.text.isEmpty) return;
              if (address2Controller.text.isEmpty) return;
              if (genderController.text.isEmpty) return;
              if (ageController.text.isEmpty) return;
              final name = nameController.text;
              final phone = phoneController.text;
              final email = emailController.text;
              final city = cityController.text;
              final  zip = zipCodeController.text;
              final address1 = address1Controller.text;
              final address2 = address2Controller.text;
              final gender = genderController.text;
              final age = ageController.text;
              final List value = [];
              value.add(name);
              value.add(phone);
              value.add(email);
              value.add(city);
              value.add(zip);
              value.add(address1);
              value.add(address2);
              value.add(gender);
              value.add(age);
              Navigator.pop(context);
              onSubmit(value);
            },
            child: Text(positiveButton),
          ),
        ],
      ));
}
void showSingleTextFieldInputDialog({
  required BuildContext context,
  required String title,
  String positiveButton = 'OK',
  String negativeButton = 'CLOSE',
  required Function(String) onSubmit,
}) {
  final textController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter $title',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(negativeButton),
          ),
          TextButton(
            onPressed: () {
              if (textController.text.isEmpty) return;
              final value = textController.text;
              Navigator.pop(context);
              onSubmit(value);
            },
            child: Text(positiveButton),
          ),
        ],
      ));
}