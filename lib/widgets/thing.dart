import 'package:flutter/material.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class Thing extends StatelessWidget {
  final thingModel.Thing thingData;

  const Thing({super.key, required this.thingData});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  thingData.name,
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${thingData.price.toStringAsFixed(2)} 元 · ${thingData.getUsedDays()} 天",
                  style: TextStyle(color: colorScheme.secondary),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Column(
              children: [
                Text("每天", style: TextStyle(color: colorScheme.secondary)),
                Text(
                  "${thingData.getAveragePricePerDay().toStringAsFixed(2)} 元",
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
