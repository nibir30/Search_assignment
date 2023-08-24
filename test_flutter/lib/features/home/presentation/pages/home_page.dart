// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_flutter/router/routing_variables.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hey, Welcome back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(58, 58, 58, 0.88),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset("lib/assets/images/hi_icon.png"),
                ],
              ),
              SizedBox(height: 270),
              Text(
                "No items to show now.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(135, 144, 171, 0.80),
                  fontSize: 18,
                ),
              ),
              Text(
                "Please add some favorite items to see here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(135, 144, 171, 0.80),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 270),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Navigation.favoritePage);
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Add Favorite Items",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
