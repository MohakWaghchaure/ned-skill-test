import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomRangeSlider extends StatefulWidget {
  final String minValue;
  final String maxValue;

  const CustomRangeSlider(
      {super.key, required this.minValue, required this.maxValue});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late double minValue;
  late double maxValue;
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    minValue = double.parse(widget.minValue);
    maxValue = double.parse(widget.maxValue);
    _sliderValue = maxValue; // Set initial slider value to maxValue
  }

  String formatNumber(double number) {
    final formatter = NumberFormat('#,###');
    return '\$${formatter.format(number)}';
  }

  @override
  Widget build(BuildContext context) {
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
                      value: _sliderValue,
                      min: minValue,
                      max: maxValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                formatNumber(_sliderValue), // Display dynamic slider value
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
