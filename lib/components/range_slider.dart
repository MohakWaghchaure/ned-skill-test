import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomRangeSlider extends StatefulWidget {
  final String minValue;
  final String maxValue;
  final String enterdRevenue;
  final Function(double) selectedFundingAmount;

  const CustomRangeSlider(
      {super.key,
      required this.minValue,
      required this.maxValue,
      required this.enterdRevenue,
      required this.selectedFundingAmount});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late double minValue;
  late double maxValue;
  late double enterdRevenue;
  late double sliderValue;
  late bool
      isSliderEnabled; // To track whether the slider should be enabled or not

  @override
  void initState() {
    super.initState();

    // Safely parse min and max values from the widget
    minValue = double.tryParse(widget.minValue) ?? 0;
    maxValue = double.tryParse(widget.maxValue) ?? 25000;
    enterdRevenue = double.tryParse(widget.enterdRevenue) ?? 0;

    // Set slider limits based on revenue
    _setSliderLimits();

    // Initialize slider value after setting limits
    sliderValue = maxValue;
  }

  // Method to adjust slider limits based on revenue
  void _setSliderLimits() {
    minValue = 25000; // Min value is always 25,000
    isSliderEnabled =
        enterdRevenue > 25000; // Enable slider only if revenue is > 25000

    if (enterdRevenue > 25000) {
      // If revenue exceeds 25,000, set maxValue to one-third of revenue
      maxValue = enterdRevenue / 3;

      // Ensure maxValue is greater than minValue
      if (maxValue <= minValue) {
        maxValue = minValue + 1000;
      }
    } else {
      // If revenue is less than or equal to 25,000, disable the slider
      maxValue = minValue;
    }
  }

  // Formatting numbers for display
  String formatNumber(double number) {
    final formatter = NumberFormat('#,###');
    return '\$${formatter.format(number)}';
  }

  @override
  Widget build(BuildContext context) {
    // Track enterdRevenue dynamically as it might change
    enterdRevenue = double.parse(widget.enterdRevenue);
    _setSliderLimits(); // Update slider limits based on current revenue

    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatNumber(minValue), // Remove decimals
                      ),
                      Text(
                        formatNumber(maxValue), // Remove decimals
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.zero,
                    child: Slider(
                      value: sliderValue,
                      min: minValue,
                      max: maxValue,
                      onChanged: isSliderEnabled
                          ? (value) {
                              setState(() {
                                sliderValue = value;
                              });
                              widget.selectedFundingAmount(value);
                            }
                          : null, // Disables the slider if maxValue == minValue
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(left: 20),
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                15,
                196,
                196,
                196,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Center(
              child: Text(
                formatNumber(sliderValue), // Display dynamic slider value
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
