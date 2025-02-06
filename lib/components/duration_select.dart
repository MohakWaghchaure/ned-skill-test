import 'package:flutter/material.dart';

class CustomDurationSelect extends StatefulWidget {
  const CustomDurationSelect({super.key});

  @override
  State<CustomDurationSelect> createState() => _CustomDurationSelectState();
}

class _CustomDurationSelectState extends State<CustomDurationSelect> {
  String repaymentDelay = "30 days";
  List<String> repaymentOptions = ["30 days", "60 days", "90 days"];

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      padding: EdgeInsets.symmetric(horizontal: 12), // Padding inside container
      decoration: BoxDecoration(
        border: Border.all(
            color:
                Colors.transparent), // Border transparent to make it invisible
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ), // Border radius on the container
        color: const Color.fromARGB(255, 229, 229, 229), // Background color
      ),
      child: DropdownButton<String>(
        value: repaymentDelay,
        // icon: Icon(Icons.arrow_drop_down, color: Colors.blue), // Icon color
        underline: SizedBox(), // Removes the underline
        items: repaymentOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            repaymentDelay = newValue!;
          });
        },
      ),
    );
  }
}
