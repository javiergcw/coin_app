import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QRScannerState();
  }
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _description = TextEditingController();
  bool isRead = false;

  @override
  void initState() {
    _textEditingController.text = "IwV4iqPoJ0Q1t9loTQVcGWlSomE2";
    super.initState();
  }

  Future<void> getQRValue(BuildContext context) async {
    setState(() {
      isRead = false;
    });

    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => QRCodeReader()));

    if (result != null) {
      setState(() {
        _textEditingController.text = result;
        isRead = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ProviderState provider = ProviderState();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar puntos'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            enabled: !isRead,
            decoration: const InputDecoration(
              hintText: 'Valor del codigo QR',
            ),
          ),
          TextField(
            controller: _amount,
            decoration: const InputDecoration(
              hintText: 'Cantidad de puntos',
            ),
          ),
          TextField(
            maxLines: 3,
            controller: _description,
            decoration: const InputDecoration(
              hintText: 'Descripción',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_textEditingController.text.isEmpty ||
                  _amount.text.isEmpty ||
                  _description.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Todos los campos son requeridos'),
                  ),
                );
              } else {
                try {
                  String name = await provider.GetNameStudentSendPoints(
                      _textEditingController.text);
                  // ignore: use_build_context_synchronously
                  bool confirm = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content: Text(
                            '¿Seguro que quieres enviarle puntos a $name?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Sí'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirm) {
                    debugPrint('Acepto');
                    String sender = await provider.getUserId();
                    provider.transferPoints(_textEditingController.text,
                        int.tryParse(_amount.text) ?? 0, sender);
                  }
                } catch (e) {
                  // Manejo de excepciones
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usuario NO encontrado'),
                    ),
                  );
                }
              }
            },
            child: const Text('Enviar puntos'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getQRValue(context);
        },
        tooltip: 'Read QR Code',
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

class QRCodeReader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeReaderState();
}

class _QRCodeReaderState extends State<QRCodeReader> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        code = scanData.code;
      });
      Navigator.pop(context, code);
    });
  }
}
