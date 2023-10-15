import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WaitingView extends GetView {
  const WaitingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'WaitingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
