import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

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

    final model = Provider.of<ProviderState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar puntos'),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder<void>(
              future: model.getInfoUser(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al obtener datos de Firestore'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  color: Colors.white,
                                ),
                                UISizedBox.gapH20,
                                Row(
                                  children: [
                                    Container(
                                      height: 31,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    UISizedBox.gapW10,
                                    Container(
                                      height: 31,
                                      width: 31,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width / 4.4,
                              height: MediaQuery.of(context).size.width / 4.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  children: model.infoUserWithId
                      .map(
                        (item) => Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Tus puntos:', style: titleBlack),
                                    Container(
                                        height: 31,
                                        width:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              UIColors.yellow,
                                              UIColors.orange,
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Container(
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Image.asset(Assets.coin),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '${item['value']}',
                                              style: white12,
                                            ),
                                            UISizedBox.gapW20,
                                          ],
                                        )),
                                    UISizedBox.gapW10,
                                    GestureDetector(
                                      child: Container(
                                          height: 31,
                                          width: 31,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            border: Border.all(
                                              width: 2.0,
                                              style: BorderStyle.solid,
                                              color: Colors.transparent,
                                            ),
                                            gradient: const LinearGradient(
                                              colors: [
                                                UIColors.redQ,
                                                UIColors.redW,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              tileMode: TileMode.clamp,
                                            ),
                                          ),
                                          child: Image.asset(Assets.alert)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      .toList(),
                );
              }),
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
                    // ignore: use_build_context_synchronously
                    provider.transferPoints(
                        context,
                        _textEditingController.text,
                        int.tryParse(_amount.text) ?? 0,
                        sender);
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
