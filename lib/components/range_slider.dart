import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('\$50,000'), Text('\$83,333')],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.zero,
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Set background color if needed
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              border: Border.all(
                color: Colors
                    .transparent, // No border color, or set any desired color
                width: 0, // No border width
              ),
            ),
            child: Center(
              child: Text(
                '\$${(50000 + (_sliderValue * 333.33)).toStringAsFixed(0)}',
                style: TextStyle(
                  // fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
