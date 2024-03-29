import 'package:CoinWrap/providers/providerHelper/ProviderState.dart';
import 'package:CoinWrap/screens/profile/views/settings_accounts/SendPoints.dart';
import 'package:CoinWrap/screens/profile/widgets/SectionProfile.dart';
import 'package:CoinWrap/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        const Text(
          "Ajustes de cuenta",
          style: titleProfile,
        ),
        GestureDetector(
          onTap: () {
            _showQR(context);
            /*     _showSheet(context); */
          },
          child: const SectionProfile(
            icon: Icons.qr_code_rounded,
            subtitle: 'Ingresa tu Qr',
            title: 'Tu QR',
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height,
          height: 0.5,
          decoration: BoxDecoration(
            color: UIColors.gray,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SendPoints()));
          },
          child: const SectionProfile(
            icon: Icons.change_circle,
            subtitle: 'Intercambio de puntos',
            title: 'Cambio',
          ),
        ),
      ],
    );
  }
}

void _showQR(context) {
  final model = Provider.of<ProviderState>(context, listen: false);

  String qrData = "https://www.google.com";
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // set this to true

    builder: (_) {
      return FutureBuilder(
        future: model.getterUid(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          return DraggableScrollableSheet(
            maxChildSize: 0.55,
            expand: false,
            builder: (_, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Text(
                      'Tu QR',
                      style: TitleContainerQuiz,
                    ),
                    UISizedBox.gapH10,
                    QrImage(
                      data: model.getUid!.toString(),
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.height / 3,
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
