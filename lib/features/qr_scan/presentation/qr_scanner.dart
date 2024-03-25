import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:scan/scan.dart';

class QRscannerSreen extends StatefulWidget {
  const QRscannerSreen({super.key});
  @override
  State<QRscannerSreen> createState() => _QRscannerSreenState();
}

class _QRscannerSreenState extends State<QRscannerSreen> {
  final qrKey = GlobalKey();
  late final QRViewController qrController;
  final ImagePicker picker = ImagePicker();
  String scannedQrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      QRView(
          key: qrKey,
          onQRViewCreated: _onQrScanned,
          overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300)),
      AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const AppBackButton()),
      Positioned(
          left: MediaQuery.of(context).size.width / 2.2,
          bottom: 150,
          child: IconButton(
              onPressed: _getPhotoByGallery,
              icon: const Icon(Icons.photo, color: Colors.white))),
    ]));
  }

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  void _onQrScanned(QRViewController qRViewController) {
    setState(() => qrController = qRViewController);

    qrController.scannedDataStream.listen((event) {
      AppWidgetHelper.bottomSheet(
          context: context, message: event.code ?? "Something went wrong.");
    });
  }

  void _getPhotoByGallery() async {
    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      String? str = await Scan.parse(res.path);
      setState(() {
        scannedQrData = str ?? "";
        AppWidgetHelper.bottomSheet(context: context, message: scannedQrData);
      });
    }
  }
}
