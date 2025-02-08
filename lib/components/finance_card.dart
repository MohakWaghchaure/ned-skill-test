import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ned_skill_test/components/duration_select.dart';
import 'package:ned_skill_test/components/radio_buttons.dart';
import 'package:ned_skill_test/components/range_slider.dart';
import 'package:ned_skill_test/components/select_table.dart';

class CustomFinanceCard extends StatefulWidget {
  final List<dynamic> apiData;
  final Function(String) updateEnteredRevenue;

  const CustomFinanceCard(
      {super.key, required this.apiData, required this.updateEnteredRevenue});

  @override
  State<CustomFinanceCard> createState() => _CustomFinanceCardState();
}

class _CustomFinanceCardState extends State<CustomFinanceCard> {
  Map<String, dynamic> desiredFeePercentage = {};
  Map<String, dynamic> desiredRepaymentDelay = {};
  Map<String, dynamic> fundingAmountData = {};
  Map<String, dynamic> revenueAmountData = {};
  Map<String, dynamic> revenuePercentageData = {};
  Map<String, dynamic> revenueSharedFrequencyData = {};
  Map<String, dynamic> useOfFundsData = {};
  Map<String, dynamic> fundingAmountMaxData = {};
  Map<String, dynamic> fundingAmountMinData = {};
  Map<String, dynamic> revenuePercentageMinData = {};
  Map<String, dynamic> revenuePercentageMaxData = {};

  // Store the entered revenue
  String enteredRevenue = '0';

  // Store the slider value and the max value based on entered revenue
  double sliderValue = 0;
  double maxSliderValue = 0;

  @override
  void initState() {
    super.initState();
    // Initialize values based on enteredRevenue
    enteredRevenueHandler();
  }

  void enteredRevenueHandler() {
    double revenue = double.tryParse(enteredRevenue) ?? 0;
    setState(() {
      maxSliderValue =
          revenue / 3; // Max slider value is 1/3 of entered revenue
      sliderValue = maxSliderValue; // Default slider value
    });
  }

  @override
  Widget build(BuildContext context) {
    var apiData = widget.apiData;

    for (var i = 0; i < apiData.length; i++) {
      if (apiData[i]['name'] == 'desired_fee_percentage') {
        desiredFeePercentage = apiData[i];
      }
      if (apiData[i]['name'] == 'desired_repayment_delay') {
        desiredRepaymentDelay = apiData[i];
      }
      if (apiData[i]['name'] == 'funding_amount') {
        fundingAmountData = apiData[i];
      }
      if (apiData[i]['name'] == 'revenue_amount') {
        revenueAmountData = apiData[i];
      }
      if (apiData[i]['name'] == 'revenue_percentage') {
        revenuePercentageData = apiData[i];
      }
      if (apiData[i]['name'] == 'revenue_shared_frequency') {
        revenueSharedFrequencyData = apiData[i];
      }
      if (apiData[i]['name'] == 'use_of_funds') {
        useOfFundsData = apiData[i];
      }
      if (apiData[i]['name'] == 'funding_amount_max') {
        fundingAmountMaxData = apiData[i];
      }
      if (apiData[i]['name'] == 'funding_amount_min') {
        fundingAmountMinData = apiData[i];
      }
      if (apiData[i]['name'] == 'revenue_percentage_min') {
        revenuePercentageMinData = apiData[i];
      }
      if (apiData[i]['name'] == 'revenue_percentage_max') {
        revenuePercentageMaxData = apiData[i];
      }
    }

    return Expanded(
      flex: 7,
      child: Container(
        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 215, 215, 215),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Financing options',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              revenueAmountData.isEmpty
                  ? 'No value provided'
                  : revenueAmountData['label'],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefix: Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Text(
                    "\$",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                hintText: "250,000",
                border: InputBorder.none,
                filled: true,
                fillColor: const Color.fromARGB(255, 229, 229, 229),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only numbers
              ],
              onChanged: (value) {
                enteredRevenue = value.isEmpty ? '0' : value;
                enteredRevenueHandler();
                widget.updateEnteredRevenue(enteredRevenue);
              },
            ),
            SizedBox(height: 10),
            Text(
              fundingAmountData.isEmpty
                  ? 'No value provided'
                  : fundingAmountData['label'],
            ),
            SizedBox(height: 10),
            CustomRangeSlider(
              minValue: fundingAmountMinData.isNotEmpty
                  ? fundingAmountMinData['value']
                  : 0.0,
              maxValue: fundingAmountMaxData.isNotEmpty
                  ? fundingAmountMaxData['value']
                  : 100.0,
              // enteredRevenue: enteredRevenue,
              // onSliderChanged: (newValue) {
              //   setState(() {
              //     sliderValue = newValue;
              //     enteredRevenue =
              //         newValue.toStringAsFixed(0); // Update the TextField
              //   });
              // },
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  Text('Revenue share percentage:'),
                  SizedBox(height: 10, width: 10),
                  Text(
                    '7.56%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  Text('${revenueSharedFrequencyData['label']}:'),
                  SizedBox(height: 10, width: 10),
                  RadioButtons(
                      revenueFrequency: revenueSharedFrequencyData['value']),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                children: [
                  Text('${desiredRepaymentDelay['label']}:'),
                  SizedBox(height: 10, width: 10),
                  CustomDurationSelect(
                      repaymentDelay: desiredRepaymentDelay['value']),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${useOfFundsData['label']}'),
                    SizedBox(height: 10),
                    Expanded(
                      child: SelectOptionAddRowTable(
                          useOfFunds: useOfFundsData['value']),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
