import 'package:flutter/material.dart';
import 'package:feewu/models/thing.dart' as thingModel;

class AddThingDialog extends StatefulWidget {
  const AddThingDialog({super.key});

  @override
  State<StatefulWidget> createState() => AddThingDialogState();
}

class AddThingDialogState extends State<AddThingDialog> {
  String name = "";
  double price = 0;
  int usedDays = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("添加物品"),
      content: Column(
        spacing: 16,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "物品名"),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
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
        ],
      ),
      actions: [
        TextButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FilledButton(
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
      ],
    );
  }
}
