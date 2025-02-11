import 'package:flutter/material.dart';

class CustomDurationSelect extends StatefulWidget {
  final String repaymentDelay;
  final Function(String) onRepaymentDelayChanged;

  const CustomDurationSelect(
      {super.key,
      required this.repaymentDelay,
      required this.onRepaymentDelayChanged});

  @override
  State<CustomDurationSelect> createState() => _CustomDurationSelectState();
}

class _CustomDurationSelectState extends State<CustomDurationSelect> {
  late String repaymentDelay; // This will store the currently selected value
  late List<String> repaymentOptions; // This will store the available options

  @override
  void initState() {
    super.initState();
    // Initialize repaymentDelay and split the string into repaymentOptions
    repaymentDelay = widget.repaymentDelay
        .split("*")[0]; // Set the default value to the first option
    repaymentOptions = widget.repaymentDelay.split("*");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        color: const Color.fromARGB(
          15,
          196,
          196,
          196,
        ),
      ),
      child: DropdownButton<String>(
        value: repaymentDelay, // Use the current selected value
        underline: SizedBox(),
        items: repaymentOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            repaymentDelay = newValue!; // Update the selected value
          });

          // Send the selected value back to the parent widget
          widget.onRepaymentDelayChanged(repaymentDelay);
        },
      ),
    );
  }
}
