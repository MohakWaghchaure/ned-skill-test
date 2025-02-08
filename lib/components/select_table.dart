import 'package:flutter/material.dart';

class SelectOptionAddRowTable extends StatefulWidget {
  const SelectOptionAddRowTable({super.key});

  @override
  State<SelectOptionAddRowTable> createState() =>
      _SelectOptionAddRowTableState();
}

class _SelectOptionAddRowTableState extends State<SelectOptionAddRowTable> {
  // Dropdown values
  String reason = "Marketing";
  List<String> reasonOptions = [
    "Marketing",
    "Personnel",
    "Working Capital",
    "Inventory"
  ];

  // Text editing controllers for capturing input
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Data for the table
  List<Map<String, String>> tableData = [];

  // Function to add a row to the table
  void addRowToTable() {
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
  }

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
                  )),
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
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: addRowToTable,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(0),
                    height: 20,
                    width: 20,
                    child: Image(
                      image: AssetImage("assets/images/add_icon.png"),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
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
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 300),
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
                            child: Text(tableData[index]['Amount'] ?? '')),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.blueGrey),
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
