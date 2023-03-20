import 'package:coin_flutter/screens/profile/widgets/Account.dart';
import 'package:coin_flutter/screens/profile/widgets/GeneralInfo.dart';
import 'package:coin_flutter/screens/profile/widgets/LogOut.dart';
import 'package:coin_flutter/screens/profile/widgets/avatar.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Avatar(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Accounts(),
                  UISizedBox.gapH20,
                  GeneralInfo(),
                  LogOut()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
