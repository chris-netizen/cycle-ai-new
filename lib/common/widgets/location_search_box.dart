import 'package:flutter/material.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter your current location',
          suffixIcon: const Icon(Icons.search),
          contentPadding:
          const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}