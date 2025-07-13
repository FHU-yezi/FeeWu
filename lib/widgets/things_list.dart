import 'package:flutter/material.dart';
import 'dart:math';
import 'package:feewu/widgets/thing.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class ThingsList extends StatelessWidget {
  const ThingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Thing(
          thingData: thingModel.Thing(
            "示例物品 ${index + 1}",
            Random().nextInt(10000).toDouble(),
            Random().nextInt(1000),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
    );
  }
}
