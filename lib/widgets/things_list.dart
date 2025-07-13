import 'package:flutter/material.dart';
import 'package:feewu/widgets/thing.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class ThingsList extends StatelessWidget {
  final List<thingModel.Thing> thingsData;

  const ThingsList({super.key, required this.thingsData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: thingsData.length,
      itemBuilder: (context, index) {
        return Thing(thingData: thingsData[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 8);
      },
    );
  }
}
