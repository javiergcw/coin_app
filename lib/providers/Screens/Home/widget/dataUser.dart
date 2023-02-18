import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataUser extends StatelessWidget {
  const DataUser({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.width / 5.5,
      child: FutureBuilder(
          future: _providerState.getCoinId(),
          builder: (((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  controller: ScrollController(keepScrollOffset: false),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          Text(
                            "UID : ${_providerState.getUid}",
                          ),
                          Text(
                            "Email : ${_providerState.getEmail}",
                          ),
                          Text(
                            "Monedas: ${(snapshot.data?[index]['value']).toString()}",
                          ),
                        ],
                      )));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }))),
    );
  }
}
