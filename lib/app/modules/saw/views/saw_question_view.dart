import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SawQuestionView extends GetView {
  const SawQuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SawQuestionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SawQuestionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
