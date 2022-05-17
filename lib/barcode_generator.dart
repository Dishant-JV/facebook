import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

/// Creates the barcode generator
class BarcodeGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Barcode Generator Demo'),
          ),
          body: Center(
              child: Container(
                height: 200,
                child: SfBarcodeGenerator(
                  value: 'Dishant Vaghasiya',
                  symbology: QRCode(),
                ),
              ))),
    );
  }
}
