import 'package:flutter/material.dart';

class CustomResultCard extends StatefulWidget {
  const CustomResultCard({super.key});

  @override
  State<CustomResultCard> createState() => _CustomResultCardState();
}

class _CustomResultCardState extends State<CustomResultCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
        height: double.infinity,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 215, 215, 215),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Results',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Annual Business Revenue',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$250,000',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Funding Amount',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$60,000',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fees',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '(50%) \$30,000',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 1,
                width: 400,
                color: const Color.fromARGB(255, 209, 209, 209),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Revenue Share',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$90,000',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expected transfers',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '47',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expected completion date',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  'January 24, 2023',
                  style: TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
