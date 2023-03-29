import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrgen extends StatefulWidget {
  const Qrgen({super.key});

  @override
  State<Qrgen> createState() => _QrgenState();
}

class _QrgenState extends State<Qrgen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Qr form"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your URL'),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return Qrimg(controller);
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
        ]));
  }
}

class Qrimg extends StatelessWidget {
  const Qrimg(this.controller, {super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qr image"),
      ),
      body: Center(
        child: QrImage(
          data: controller.text,
          size: 280,
          backgroundColor: Colors.white,
          // embeddedImageStyle: QrEmbeddedImageStyle(
          //   size: const Size(
          //     100,
          //     100,
          //   ),
          // )
        ),
      ),
    );
  }
}
