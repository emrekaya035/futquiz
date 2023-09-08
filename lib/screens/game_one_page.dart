import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../modelview/map_view_model.dart';

class GameOnePage extends StatefulWidget {
  const GameOnePage({super.key});
  static String id = "game_one_page";

  @override
  State<GameOnePage> createState() => _GameOnePageState();
}

class _GameOnePageState extends State<GameOnePage> {
  PlayerMapViewModel player = PlayerMapViewModel();
  late int number;

  Future<void> getPlayer(int num) async {
    await player.fetchPlayer(num);
  }

  int getRandomNumber() {
    Random random = Random();
    return random.nextInt(289) + 1;
  }

  @override
  void initState() {
    number = getRandomNumber();
    getPlayer(number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              "Ben Kimim?",
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height / 10, horizontal: width / 10),
        child: Column(
          children: [
            Observer(builder: (_) {
              return player.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Text(player.playerMapModel!.fullName.toString()),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
