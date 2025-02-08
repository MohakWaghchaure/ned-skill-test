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
  List<dynamic> apiData = []; // Variable to store data from child

  void handleFetchedData(List<dynamic> data) {
    setState(() {
      // Initialize or update the apiData list with the fetched data
      apiData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
        color: const Color.fromARGB(255, 196, 196, 196),
        // height: 5000,
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
                if (apiData.isNotEmpty) CustomFinanceCard(apiData: apiData),
                CustomResultCard(),
              ],
            ),
          )),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
