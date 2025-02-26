import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
        title: const Text(
          'QR Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: (MediaQuery.of(context).size.width - 40.0) > 500
                    ? 500
                    : (MediaQuery.of(context).size.width - 40.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5.0),
                    child: QrImageView(
                      data: data,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Data (in text)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        for (String key in dataMap.keys)
                          Text(
                            '$key: ${dataMap[key]}',
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Mono',
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
