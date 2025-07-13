import 'package:flutter/material.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class AddThing extends StatefulWidget {
  const AddThing({super.key});

  @override
  State<StatefulWidget> createState() => AddThingState();
}

class AddThingState extends State<AddThing> {
  String name = "";
  double price = 0;
  int usedDays = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "物品名"),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "价格"),
              onChanged: (value) {
                var newValue = double.tryParse(value);
                if (newValue != null) {
                  setState(() {
                    price = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "使用天数"),
              onChanged: (value) {
                var newValue = int.tryParse(value);
                if (newValue != null) {
                  setState(() {
                    usedDays = newValue;
                  });
                }
              },
            ),
            SizedBox(height: 32),
            SizedBox(
              child: FilledButton(
                child: Text("添加"),
                onPressed: (name != "" && price != 0 && usedDays != 0)
                    ? () {
                        Navigator.pop(
                          context,
                          thingModel.Thing(name.trim(), price, usedDays),
                        );
                      }
                    : null,
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
