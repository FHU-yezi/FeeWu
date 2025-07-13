import 'package:feewu/widgets/things_list.dart';
import 'package:flutter/material.dart';

class ThingsPage extends StatelessWidget {
  const ThingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12), child: ThingsList());
  }
}
