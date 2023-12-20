import 'package:book_swapping/modelview/firebase/user/atualizarUsuarioAuthFirebase.dart';
import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:book_swapping/view/components/messages/customAnimatedText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modelview/firebase/user/userController.dart';

class UserUpdateScreen extends StatefulWidget {
  @override
  _UserUpdateScreenState createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      drawer: CustomDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const CustomAnimatedText(
                texto: 'This screen is for changing your name and email.'
                    ' both fields are mandatory, even if they do not change, so as not to violate '
                    'General Data Protection Law'),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 30, 32, 10),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  atualizarUsuarioAuthFirebase(
                      context, _emailController.text, _nameController.text);
                }
              },
              child: Text('To update'),
            ),
          ],
        ),
      ),
    );
  }
}
