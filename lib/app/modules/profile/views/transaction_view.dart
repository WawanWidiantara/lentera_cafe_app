import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TransactionView extends GetView {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
