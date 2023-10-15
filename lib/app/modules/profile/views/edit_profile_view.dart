import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
