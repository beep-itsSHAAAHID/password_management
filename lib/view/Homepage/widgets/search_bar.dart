import 'package:flutter/material.dart';

class SearchBarisok extends StatefulWidget {
  const SearchBarisok({Key? key}) : super(key: key);

  @override
  State<SearchBarisok> createState() => _SearchBarisokState();
}

class _SearchBarisokState extends State<SearchBarisok> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
        padding: const EdgeInsets.all(8.0), // Optional: Adds padding around the search bar for more defined spacing
        child: TextFormField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search For Your Passwords',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14), // Smaller font size for the hint
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20), // Reduced vertical padding for a slimmer bar
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20), // Smaller icon
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFACCCC), width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFF2F2F7), width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
