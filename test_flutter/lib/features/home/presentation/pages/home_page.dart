// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/router/routing_variables.dart';

import '../../../../providers/fav_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FavoriteProvider addressProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      body: Container(
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
              addressProvider.favoriteResponses.lists!.isEmpty
                  ? Column(
                      children: [
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
                      ],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: addressProvider.favoriteResponses.lists!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(135, 144, 171, 0.24)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(32),
                                          child: Image.network(addressProvider.favoriteResponses.lists![index].owner!.profile_image.toString()),
                                        ),
                                      ),
                                      SizedBox(width: 24),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text("Name : " + addressProvider.favoriteResponses.lists![index].owner!.name.toString())),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      addressProvider.favoriteResponses.lists![index].isfavorite =
                                                          !addressProvider.favoriteResponses.lists![index].isfavorite!;
                                                      if (addressProvider.favoriteResponses.lists![index].isfavorite == true) {
                                                        addressProvider.addFavorite(addressProvider.favoriteResponses.lists![index]);
                                                      } else {
                                                        addressProvider.deleteFavorite(addressProvider.favoriteResponses.lists![index]);
                                                      }
                                                    });
                                                  },
                                                  child: addressProvider.favoriteResponses.lists![index].isfavorite == false
                                                      ? Icon(
                                                          Icons.favorite_border_outlined,
                                                          color: Color.fromRGBO(135, 144, 171, 0.44),
                                                        )
                                                      : Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                        ),
                                                ),
                                              ],
                                            ),
                                            Text("Share Source : "),
                                            Text(addressProvider.favoriteResponses.lists![index].share!.shareSource.toString()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Share Description : ",
                                    style: TextStyle(fontSize: 12, color: Color.fromRGBO(135, 144, 171, 0.64)),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    // "Loosing/gaining weight or change of looks is considered to be a part of the occupational field of Acting. Some actors however have shocked the audiences by showing their dedication towards a role through extreme transformation. Here is a list of such amazing actors who underwent great deal of changes to achieve the target role.",
                                    addressProvider.favoriteResponses.lists![index].share!.shareDescription.toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
