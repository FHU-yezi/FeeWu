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
  DateTime buyDate = DateTime.now().subtract(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("添加物品"),
      content: Column(
        spacing: 16,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "物品名",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "价格",
              suffix: Text("元"),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              var newValue = double.tryParse(value);
              if (newValue != null) {
                setState(() {
                  price = newValue;
                });
              }
            },
          ),
          Row(
            children: [
              Text("购买日期：${buyDate.toIso8601String().split("T")[0]}"),
              TextButton(
                child: Text("修改"),
                onPressed: () async {
                  var newValue = await showDatePicker(
                    context: context,
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    firstDate: DateTime(1970, 1, 1),
                    lastDate: DateTime.now().subtract(Duration(days: 1)),
                    helpText: "购买日期",
                    cancelText: "取消",
                    confirmText: "确认",
                  );

                  if (newValue != null) {
                    setState(() {
                      buyDate = newValue;
                    });
                  }
                },
              ),
            ],
            spacing: 4,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
          onPressed: (name != "" && price != 0)
              ? () {
                  Navigator.pop(
                    context,
                    thingModel.Thing(name.trim(), price, buyDate),
                  );
                }
              : null,
        ),
      ],
    );
  }
}
