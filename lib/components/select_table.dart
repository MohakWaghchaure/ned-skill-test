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
  String description = "30 days";

  // Data for the table
  List<Map<String, String>> tableData = [];

  // Function to add a row to the table
  void addRowToTable(String selectedValue) {
    setState(() {
      // tableData.add({"Option": selectedValue});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12), // Padding inside container
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors
                      .transparent), // Border transparent to make it invisible
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ), // Border radius on the container
              color:
                  const Color.fromARGB(255, 229, 229, 229), // Background color
            ),
            child: DropdownButton<String>(
              value: reason,
              // icon: Icon(Icons.arrow_drop_down, color: Colors.blue), // Icon color
              underline: SizedBox(), // Removes the underline
              items: reasonOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  reason = newValue!;
                });
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Description",
                border: InputBorder.none, // Remove border completely
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 229, 229, 229), // Background color
                contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12), // Padding inside the text field
                // The decoration for the radius
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none, // No border side
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none, // No border side
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Amount",
                border: InputBorder.none, // Remove border completely
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 229, 229, 229), // Background color
                contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12), // Padding inside the text field
                // The decoration for the radius
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none, // No border side
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide.none, // No border side
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
