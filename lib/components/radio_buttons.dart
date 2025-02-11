import 'package:flutter/material.dart';

class RadioButtons extends StatefulWidget {
  final String revenueFrequency;
  final Function(String)
      onFrequencyChanged; // Callback function to send value outside

  const RadioButtons(
      {super.key,
      required this.revenueFrequency,
      required this.onFrequencyChanged});

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String revenueSharedFrequency =
      "Monthly"; // Initial value for selected radio button

  late List<String>
      frequency; // To store the split values from revenueFrequency

  @override
  void initState() {
    super.initState();
    frequency = widget.revenueFrequency.split("*");
    revenueSharedFrequency = frequency.isNotEmpty
        ? frequency[0]
        : "Monthly"; // Default to the first value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        children: frequency.map((freq) {
          return Row(
            children: [
              Radio(
                value: freq, // Set the radio button value dynamically
                groupValue:
                    revenueSharedFrequency, // Compare with selected value
                activeColor: Colors.blue,
                onChanged: (value) {
                  setState(() {
                    revenueSharedFrequency =
                        value.toString(); // Update the selected value
                  });

                  // Call the callback function to send the selected value outside
                  widget.onFrequencyChanged(revenueSharedFrequency);
                },
              ),
              Text(freq[0].toUpperCase() +
                  freq
                      .substring(1)
                      .toLowerCase()), // Display the frequency text dynamically
            ],
          );
        }).toList(),
      ),
    );
  }
}
