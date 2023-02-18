import 'package:coin_flutter/providers/Screens/Home/widget/rewardsList.dart';
import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/providers/Screens/Home/widget/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mi título'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProviderDashboard()),
          );
        },
        child: Column(children: [
          Text('INFO DEL USUARIO'),
          DataUser(),
          RewardsList(),
        ]),
      ),
    );
  }
}
