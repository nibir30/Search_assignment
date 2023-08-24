// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/features/favorite/domain/entity/get_profile_data_entity.dart';
import 'package:test_flutter/features/favorite/presentation/bloc/search_bloc.dart';
import 'package:test_flutter/providers/fav_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  SearchBloc searchBloc = SearchBloc();
  TextEditingController searchController = TextEditingController();

  ProfileResponseEntity profileEntity = ProfileResponseEntity();

  String? searchQuery;

  @override
  void initState() {
    searchBloc.add(RequestSearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider addressProvider = Provider.of<FavoriteProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              SizedBox(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(58, 58, 58, 0.88),
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(135, 144, 171, 0.24),
                  ),
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder(
                        bloc: searchBloc,
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            // return CircularProgressIndicator();
                          } else if (state is SearchCreatedState) {
                            return TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search items here...",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(135, 144, 171, 0.64),
                                ),
                              ),
                              onChanged: (value) {
                                print(value);
                                if (value != "") {
                                  setState(() {
                                    profileEntity.lists!.clear();
                                    profileEntity.lists = state.profileResponseEntity.lists!
                                        .where((element) => element.owner!.name!.toLowerCase().contains(value.toLowerCase()))
                                        .toList();
                                  });

                                  // for (int i = 0; i < state.profileResponseEntity.lists!.length; i++) {
                                  //   if (state.profileResponseEntity.lists![i].owner!.name!.toLowerCase().contains(value.toLowerCase())) {
                                  //     print("paisiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
                                  //     // print("GOTIIIIIIIIIIIIIIIIIIIi" + state.profileResponseEntity.lists![i].owner!.name!);
                                  //     setState(() {
                                  //       profileEntity.lists!.add(state.profileResponseEntity.lists![i]);
                                  //     });
                                  //   }
                                  // }
                                } else {
                                  setState(() {
                                    profileEntity.lists = List.from(state.profileResponseEntity.lists!);
                                  });
                                }
                              },
                            );
                          }
                          return TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabled: false,
                              hintText: "Search items here...",
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(135, 144, 171, 0.64),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color.fromRGBO(135, 144, 171, 0.64),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              BlocListener(
                bloc: searchBloc,
                listener: (context, state) {
                  if (state is SearchCreatedState) {
                    setState(() {
                      profileEntity.lists = List.from(state.profileResponseEntity.lists!);
                      // profileEntity.lists = List.from(state.profileResponseEntity.lists!);
                    });
                  }
                },
                child: BlocBuilder(
                  bloc: searchBloc,
                  builder: (context, state) {
                    if (state is SearchLoadingState) {
                      return CircularProgressIndicator();
                    } else if (state is SearchCreatedState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.profileResponseEntity.lists!.length,
                        itemBuilder: (context, index) {
                          if (profileEntity.lists!.contains(state.profileResponseEntity.lists![index])) {
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
                                              child: Image.network(state.profileResponseEntity.lists![index].owner!.profile_image.toString()),
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
                                                        child: Text("Name : " + state.profileResponseEntity.lists![index].owner!.name.toString())),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          state.profileResponseEntity.lists![index].isfavorite =
                                                              !state.profileResponseEntity.lists![index].isfavorite!;
                                                          if (state.profileResponseEntity.lists![index].isfavorite == true) {
                                                            addressProvider.addFavorite(state.profileResponseEntity.lists![index]);
                                                          } else {
                                                            addressProvider.deleteFavorite(state.profileResponseEntity.lists![index]);
                                                          }
                                                        });
                                                      },
                                                      child: state.profileResponseEntity.lists![index].isfavorite == false
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
                                                Text(state.profileResponseEntity.lists![index].share!.shareSource.toString()),
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
                                        state.profileResponseEntity.lists![index].share!.shareDescription.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            );
                          }
                          return Container();
                        },
                      );
                    }
                    return Container(
                      child: Text("Loading.."),
                    );
                  },
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Color.fromRGBO(135, 144, 171, 0.24)),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           CircleAvatar(),
              //           SizedBox(width: 24),
              //           Expanded(
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   children: [
              //                     Expanded(child: Text("Name : Sakib Khan")),
              //                     InkWell(
              //                       onTap: () {},
              //                       child: Icon(
              //                         Icons.favorite_border_outlined,
              //                         color: Color.fromRGBO(135, 144, 171, 0.44),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 Text("Share Source : "),
              //                 Text("Rajashri Venkatesh on Listly"),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 12),
              //       Text(
              //         "Share Description : ",
              //         style: TextStyle(fontSize: 12, color: Color.fromRGBO(135, 144, 171, 0.64)),
              //       ),
              //       SizedBox(height: 4),
              //       Text(
              //         "Loosing/gaining weight or change of looks is considered to be a part of the occupational field of Acting. Some actors however have shocked the audiences by showing their dedication towards a role through extreme transformation. Here is a list of such amazing actors who underwent great deal of changes to achieve the target role.",
              //         style: TextStyle(fontSize: 12),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
