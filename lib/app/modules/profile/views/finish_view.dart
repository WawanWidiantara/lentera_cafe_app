import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FinishView extends GetView {
  const FinishView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'FinishView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
