import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({super.key});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String revenueSharedFrequency = "Monthly";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Radio(
            value: "Monthly",
            groupValue: revenueSharedFrequency,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                revenueSharedFrequency = value.toString();
              });
            },
          ),
          Text("Monthly"),
          Radio(
            value: "Weekly",
            groupValue: revenueSharedFrequency,
            activeColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                revenueSharedFrequency = value.toString();
              });
            },
          ),
          Text("Weekly"),
        ],
      ),
    );
  }
}
