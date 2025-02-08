import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for number formatting

class CustomResultCard extends StatefulWidget {
  final String enteredRevenue;
  const CustomResultCard({super.key, required this.enteredRevenue});

  @override
  State<CustomResultCard> createState() => _CustomResultCardState();
}

class _CustomResultCardState extends State<CustomResultCard> {
  @override
  Widget build(BuildContext context) {
    // Format enteredRevenue with commas
    final revenue = int.tryParse(widget.enteredRevenue) ?? 0;
    double feePercentage = 0.6;

    final formattedRevenue = NumberFormat('#,###').format(revenue);

    // Calculate Funding Amount (formattedRevenue / 3) and format it
    final fundingAmount = (revenue) / 3;
    final formattedFundingAmount = NumberFormat('#,###').format(fundingAmount);

    // Calculate the fee amount (enteredRevenue * feePercentage)
    final feeAmount = revenue * feePercentage;
    final formattedFeeAmount = NumberFormat('#,###').format(feeAmount);

    // Calculate the fee amount (enteredRevenue * feePercentage)
    final totalRevenueShared = fundingAmount + feeAmount;
    final formattedtotalRevenue =
        NumberFormat('#,###').format(totalRevenueShared);

    // Calculate Expected Transfers based on frequency
    String frequency = 'weekly';
    int repaymentDelayDays = 30;
    double expectedTransfers;
    if (frequency == 'weekly') {
      expectedTransfers = (totalRevenueShared * 52) / (revenue * feePercentage);
    } else if (frequency == 'monthly') {
      expectedTransfers = (totalRevenueShared * 12) / (revenue * feePercentage);
    } else {
      expectedTransfers = 0;
    }

    // Round up the value
    expectedTransfers =
        expectedTransfers.isNaN ? 0 : expectedTransfers.ceilToDouble();
    final formattedExpectedTransfers = expectedTransfers.toString();

    // Calculate Expected Completion Date
    DateTime currentDate = DateTime.now();
    DateTime expectedCompletionDate;

    if (frequency == 'weekly') {
      expectedCompletionDate =
          currentDate.add(Duration(days: (expectedTransfers.toInt() * 7)));
    } else if (frequency == 'monthly') {
      expectedCompletionDate = DateTime(
        currentDate.year,
        currentDate.month + expectedTransfers.toInt(),
        currentDate.day,
      );
    } else {
      expectedCompletionDate = currentDate;
    }

    // Add repayment delay (in days) to the expected completion date
    expectedCompletionDate =
        expectedCompletionDate.add(Duration(days: repaymentDelayDays));

    // Format expected completion date
    String formattedExpectedCompletionDate =
        DateFormat('MMMM dd, yyyy').format(expectedCompletionDate);

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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$$formattedRevenue', // Display the formatted revenue
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$$formattedFundingAmount',
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '($feePercentage) \$$formattedFeeAmount',
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  '\$$formattedtotalRevenue',
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  formattedExpectedTransfers,
                  style: TextStyle(
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
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Text(
                  formattedExpectedCompletionDate,
                  style: TextStyle(
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
