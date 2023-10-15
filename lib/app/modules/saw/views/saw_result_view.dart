import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SawResultView extends GetView {
  const SawResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SawResultView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SawResultView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
