import 'dart:io';

import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';
import 'package:coin_flutter/screens/home/views/widgets/popUp.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProviderState>(context, listen: false);

    return FutureBuilder<void>(
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
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: Colors.white,
                          ),
                          UISizedBox.gapH20,
                          Row(
                            children: [
                              Container(
                                height: 31,
                                width: MediaQuery.of(context).size.height / 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              UISizedBox.gapW10,
                              Container(
                                height: 31,
                                width: 31,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
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
                          Image.asset(
                            Assets.logoMain,
                            width: MediaQuery.of(context).size.width / 2.5,
                          ),
                          UISizedBox.gapH20,
                          Row(
                            children: [
                              Container(
                                  height: 31,
                                  width: MediaQuery.of(context).size.height / 8,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        UIColors.yellow,
                                        UIColors.orange,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
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
                                onTap: () {
                                  PopUp().MessageWhats(context);
                                },
                                child: Container(
                                    height: 31,
                                    width: 31,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
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
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width / 4.4,
                        height: MediaQuery.of(context).size.width / 4.6,
                        decoration: BoxDecoration(
                          color: UIColors.redMain,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: UIColors.redMain.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(Assets.avatar01),
                      ),
                    ],
                  ),
                )
                .toList(),
          );
        });
  }
}
