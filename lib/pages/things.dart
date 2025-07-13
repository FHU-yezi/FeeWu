import 'package:feewu/widgets/add_thing.dart';
import 'package:feewu/widgets/things_list.dart';
import 'package:flutter/material.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class ThingsPage extends StatefulWidget {
  const ThingsPage({super.key});

  @override
  State<StatefulWidget> createState() => ThingsPageState();
}

class ThingsPageState extends State<ThingsPage> {
  List<thingModel.Thing> thingsData = [];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ThingsList(thingsData: thingsData),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
            onPressed: () async {
              final newThing = await showModalBottomSheet<thingModel.Thing>(
                context: context,
                builder: (context) => const AddThing(),
              );

              if (newThing != null) {
                setState(() {
                  thingsData.add(newThing);
                });
              }
            },
          ),
        ),
      ],
      alignment: Alignment.bottomRight,
    );
  }
}
