import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Qrscan extends StatefulWidget {
  const Qrscan({super.key});

  @override
  State<Qrscan> createState() => _QrscanState();
}

class _QrscanState extends State<Qrscan> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
              body: Stack(
        alignment: Alignment.center,
        children: [buildQrView(context)],
      )));

  buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderRadius: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
            borderLength: 20,
            borderWidth: 10,
            borderColor: Colors.blueAccent),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      this.barcode = barcode;
    });
  }
}
