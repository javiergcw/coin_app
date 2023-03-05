import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height / 10),
      child: Wrap(
        spacing: 30,
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.file_copy_outlined,
                  color: UIColors.redMain,
                ),
                UISizedBox.gapW10,
                Text(
                  "Terminos y condiciones",
                  style: TextMenuProfile,
                )
              ],
            ),
          ),
          UISizedBox.gapH20,
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.contact_page_outlined,
                  color: UIColors.redMain,
                ),
                UISizedBox.gapW10,
                Text(
                  "Contactanos",
                  style: TextMenuProfile,
                )
              ],
            ),
          ),
          UISizedBox.gapH20,
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.task_alt_outlined,
                  color: UIColors.redMain,
                ),
                UISizedBox.gapW10,
                Text(
                  "Progreso",
                  style: TextMenuProfile,
                )
              ],
            ),
          ),
          UISizedBox.gapH20,
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.qr_code,
                  color: UIColors.redMain,
                ),
                UISizedBox.gapW10,
                Text(
                  "MI QR",
                  style: TextMenuProfile,
                )
              ],
            ),
          ),
          UISizedBox.gapH20,
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.exit_to_app_outlined,
                  color: UIColors.grayEight,
                ),
                UISizedBox.gapW10,
                Text(
                  "Cerrar sesión",
                  style: TextMenuExit,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
