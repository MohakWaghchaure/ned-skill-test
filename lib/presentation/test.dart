import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinanceScreen(),
    );
  }
}

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  double annualRevenue = 250000;
  double loanAmount = 60000;
  double revenueSharePercentage = 7.56;
  String repaymentDelay = "30 days";
  String fundUse = "Marketing";
  String revenueSharedFrequency = "Monthly";
  List<String> fundOptions = [
    "Marketing",
    "Personnel",
    "Working Capital",
    "Inventory",
    "Machinery/Equipment",
    "Other"
  ];
  List<String> repaymentOptions = ["30 days", "60 days", "90 days"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Financing Options"),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Section - Financing Options
            Expanded(
              flex: 2,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("What is your annual business revenue?",
                          style: TextStyle(fontSize: 16)),
                      TextField(
                        decoration: InputDecoration(
                            prefixText: "\$ ", hintText: "250,000"),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      Text("What is your desired loan amount?",
                          style: TextStyle(fontSize: 16)),
                      Slider(
                        value: 100,
                        min: 0,
                        max: 100,
                        onChanged: (value) {},
                      ),
                      Text(
                          "\$50,000   -   \$${loanAmount.toInt()}   -   \$100,000"),
                      SizedBox(height: 20),
                      Text(
                          "Revenue Share Percentage: ${revenueSharePercentage.toStringAsFixed(2)}%"),
                      SizedBox(height: 10),
                      Text("Revenue Shared Frequency"),
                      Row(
                        children: [
                          Radio(
                            value: "Monthly",
                            groupValue: revenueSharedFrequency,
                            onChanged: (value) {
                              setState(() {
                                revenueSharedFrequency = value.toString();
                              });
                            },
                          ),
                          Text("Monthly"),
                          Radio(
                            value: "Weekly",
                            groupValue: revenueSharedFrequency,
                            onChanged: (value) {
                              setState(() {
                                revenueSharedFrequency = value.toString();
                              });
                            },
                          ),
                          Text("Weekly"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("Desired Repayment Delay"),
                      DropdownButton<String>(
                        value: repaymentDelay,
                        items: repaymentOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            repaymentDelay = newValue!;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Text("What will you use the funds for?"),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              value: fundUse,
                              items: fundOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  fundUse = newValue!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Description"),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixText: "\$ ", hintText: "Amount"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 20),

            // Right Section - Results
            Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Results",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Divider(),
                      Text(
                          "Annual Business Revenue: \$${annualRevenue.toInt()}"),
                      Text("Funding Amount: \$${loanAmount.toInt()}"),
                      Text("Fees: (50%) \$${(loanAmount * 0.5).toInt()}"),
                      Text(
                          "Total Revenue Share: \$${(loanAmount * 1.5).toInt()}"),
                      Text("Expected Transfers: 47"),
                      RichText(
                        text: TextSpan(
                          text: "Expected completion date: ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "January 24, 2023",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("BACK"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("NEXT"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
