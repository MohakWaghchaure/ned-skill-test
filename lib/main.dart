import 'package:flutter/material.dart';
import 'package:ned_skill_test/api/api_service.dart';
import 'package:ned_skill_test/components/bottom_bar.dart';
import 'package:ned_skill_test/components/finance_card.dart';
import 'package:ned_skill_test/components/result_card.dart';
import 'components/radio_buttons.dart';
import 'components/range_slider.dart';
import 'components/duration_select.dart';
import 'components/select_table.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './api/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Nunito'),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> apiData = [];
  String enteredRevenue = '0';
  String selectedFrequency = "monthly";
  String selectedRepaymentDelay = "30";
  double receivedFeePercentage = 0;
  double selectedSliderValue = 25000;

  @override
  void initState() {
    super.initState();
    // Initialize the fee percentage on app load
    feePercentage();
  }

  void handleFetchedData(List<dynamic> data) {
    setState(() {
      apiData = data;
    });
    // Update fee percentage after data is fetched
    feePercentage();
  }

  void updateEnteredRevenue(String revenue) {
    setState(() {
      enteredRevenue = revenue;
    });
  }

  void updatedFrequency(String frequency) {
    setState(() {
      selectedFrequency = frequency;
    });
  }

  void repaymentDelay(String repaymentDelay) {
    setState(() {
      selectedRepaymentDelay = repaymentDelay;
    });
  }

  void feePercentage() {
    if (apiData.isNotEmpty) {
      var feeData = apiData.firstWhere(
        (element) => element['name'] == 'desired_fee_percentage',
        orElse: () => null,
      );
      if (feeData != null) {
        setState(() {
          // Parse the fee percentage to a double
          receivedFeePercentage = double.tryParse(feeData['value']) ?? 0.6;
        });
      }
    } else {
      setState(() {
        receivedFeePercentage = 0.6; // Default value if no data
      });
    }
  }

  void selectedFundingAmount(double selectedFundingAmount) {
    setState(() {
      selectedSliderValue = selectedFundingAmount; // Default value if no data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
        leading: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(0),
          height: 500,
          child: Image.asset(
            'assets/images/ned_skill_test_logo.jpg',
            height: 200,
            width: 200,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        color: const Color.fromARGB(15, 196, 196, 196),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: SingleChildScrollView(
              child: Container(
            height: 800,
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ApiDataWidget(
                  onDataFetched: handleFetchedData,
                ),
                if (apiData.isNotEmpty)
                  CustomFinanceCard(
                      apiData: apiData,
                      updateEnteredRevenue: updateEnteredRevenue,
                      updatedFrequency: updatedFrequency,
                      repaymentDelay: repaymentDelay,
                      selectedFundingAmount: selectedFundingAmount),
                CustomResultCard(
                    enteredRevenue: enteredRevenue,
                    selectedFrequency: selectedFrequency,
                    selectedRepaymentDelay: selectedRepaymentDelay,
                    feePercentage: receivedFeePercentage,
                    selectedFundingAmount: selectedSliderValue),
              ],
            ),
          )),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
