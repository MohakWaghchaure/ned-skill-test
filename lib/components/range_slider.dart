import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomRangeSlider extends StatefulWidget {
  final String minValue;
  final String maxValue;
  final String enterdRevenue;
  final Function(double) selectedFundingAmount;

  const CustomRangeSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.enterdRevenue,
    required this.selectedFundingAmount,
  });

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late double minValue;
  late double maxValue;
  late double enterdRevenue;
  late double sliderValue;
  late bool isSliderEnabled;

  @override
  void initState() {
    super.initState();

    minValue = double.tryParse(widget.minValue) ?? 0;
    maxValue = double.tryParse(widget.maxValue) ?? 25000;
    enterdRevenue = double.tryParse(widget.enterdRevenue) ?? 0;

    _setSliderLimits();
    sliderValue = minValue; // Initialize to min value
  }

  @override
  void didUpdateWidget(covariant CustomRangeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enterdRevenue != oldWidget.enterdRevenue) {
      enterdRevenue = double.tryParse(widget.enterdRevenue) ?? 0;
      _setSliderLimits();

      setState(() {
        sliderValue = minValue; // Reset slider to minimum when revenue changes
      });
    }
  }

  void _setSliderLimits() {
    minValue = 25000;
    isSliderEnabled = enterdRevenue > 25000;

    if (isSliderEnabled) {
      maxValue = enterdRevenue / 3;
      if (maxValue <= minValue) {
        maxValue = minValue + 1000;
      }
    } else {
      maxValue = minValue;
      sliderValue = maxValue;
    }
  }

  String formatNumber(double number) {
    final formatter = NumberFormat('#,###');
    return '\$${formatter.format(number)}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatNumber(minValue)),
                      Text(formatNumber(maxValue)),
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
                          : null,
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
            margin: const EdgeInsets.only(left: 20),
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(15, 196, 196, 196),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                formatNumber(sliderValue),
                style: const TextStyle(
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
