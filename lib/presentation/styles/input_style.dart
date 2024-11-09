
import 'package:flutter/material.dart';

final TextStyle filledInputTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
);

final InputDecoration filledInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xFFF6F6F6),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8.0),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
);

const emailInputDecoration = InputDecoration(
  labelText: 'Email',
  suffixIcon: Icon(Icons.email),
  border: OutlineInputBorder(),
);

const passwordInputDecoration = InputDecoration(
  labelText: 'Password',
  suffixIcon: Icon(Icons.remove_red_eye),
  border: OutlineInputBorder(),
);

