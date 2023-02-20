import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  static const String routeName = '/qr-screen';

  @override
  Widget build(BuildContext context) {
    final String data =
        ModalRoute.of(context)?.settings.arguments as String? ?? '';

    final Map<String, dynamic> dataMap = json.decode(data);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Code'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QrImage(data: data, padding: EdgeInsets.zero),
            const SizedBox(height: 30),
            for (String key in dataMap.keys) Text('$key: ${dataMap[key]}'),
          ],
        ),
      ),
    );
  }
}
