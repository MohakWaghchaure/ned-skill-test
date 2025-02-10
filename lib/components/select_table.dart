import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectOptionAddRowTable extends StatefulWidget {
  final String useOfFunds;
  const SelectOptionAddRowTable({super.key, required this.useOfFunds});

  @override
  State<SelectOptionAddRowTable> createState() =>
      _SelectOptionAddRowTableState();
}

class _SelectOptionAddRowTableState extends State<SelectOptionAddRowTable> {
  // Dropdown values
  late String reason;
  late List<String> reasonOptions;

  // Text editing controllers for capturing input
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Data for the table
  List<Map<String, String>> tableData = [];

  @override
  void initState() {
    super.initState();
    // Split the string '30 days*60 days*90 days' into a list of options
    reasonOptions = widget.useOfFunds.split("*");
    // Set initial value for the dropdown
    reason = reasonOptions.isNotEmpty ? reasonOptions[0] : "Marketing";
  }

  // Function to add a row to the table
  void addRowToTable() {
    if (descriptionController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        reason.isNotEmpty) {
      setState(() {
        tableData.add({
          "Reason": reason,
          "Description": descriptionController.text,
          "Amount": amountController.text,
        });

        // Clear the inputs after adding the row
        descriptionController.clear();
        amountController.clear();
      });
    } else {
      // print("All fields are required.");
    }
  }

  // Function to delete a row from the table
  void deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for inputs
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: const Color.fromARGB(255, 229, 229, 229),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: reason,
                    underline: SizedBox(),
                    items: reasonOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        reason = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: "Description",
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
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      hintText: "Amount",
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
                      FilteringTextInputFormatter
                          .digitsOnly, // Allow only numbers
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/add_icon.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: addRowToTable,
                padding: EdgeInsets.zero, // To remove the default padding
                alignment: Alignment.center, // Align the icon in the center
              ),
            ],
          ),

          // Space between form and table
          SizedBox(height: 20),

          // Table for displaying added rows
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tableData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(tableData[index]['Reason'] ?? '')),
                        Expanded(
                            flex: 7,
                            child: Text(tableData[index]['Description'] ?? '')),
                        Expanded(
                            flex: 2,
                            child: Text('\$${tableData[index]['Amount']}')),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/delete_icon.png',
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () => deleteRow(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
