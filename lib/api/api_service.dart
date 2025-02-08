import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDataWidget extends StatefulWidget {
  final String apiUrl =
      'https://gist.githubusercontent.com/motgi/8fc373cbfccee534c820875ba20ae7b5/raw/7143758ff2caa773e651dc3576de57cc829339c0/config.json';
  final Function(List<dynamic>)
      onDataFetched; // Callback function to pass data to parent

  const ApiDataWidget({super.key, required this.onDataFetched});

  @override
  _ApiDataWidgetState createState() => _ApiDataWidgetState();
}

class _ApiDataWidgetState extends State<ApiDataWidget> {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(widget.apiUrl));
    if (response.statusCode == 200) {
      final fetchedData = jsonDecode(response.body);
      widget.onDataFetched(fetchedData); // Pass data to parent using callback
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
