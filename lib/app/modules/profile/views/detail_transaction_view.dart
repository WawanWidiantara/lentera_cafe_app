import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetailTransactionView extends GetView {
  const DetailTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailTransactionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailTransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
