import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/DataModel.dart';
import 'package:movieapp/DataService.dart';
import 'package:movieapp/InfoScreen.dart';
import 'package:movieapp/MovieCard.dart';

import 'Buttons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataService _dataService = DataService();

  String imageurl = "https://image.tmdb.org/t/p/w300";
  late TextEditingController textEditingController;
  String name = "popular";
  bool isbuttonSelected = false;
  String inputdata = "samaritan";

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataService.getProduct(
          name, isbuttonSelected, textEditingController.text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "   Watch Now",
                      style: GoogleFonts.inriaSans(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          TextField(
                            controller: textEditingController,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            style: GoogleFonts.signikaNegative(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                icon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isbuttonSelected = true;
                                      inputdata = textEditingController.text;
                                    });
                                  },
                                  icon: Icon(Icons.search),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: -1, bottom: 6),
                                border: InputBorder.none,
                                hintText: "Search books...",
                                hintStyle: GoogleFonts.signikaNegative(
                                  fontSize: 17,
                                  color: Colors.grey.shade400,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Buttons(
                            text: "Popular",
                            color: Colors.black45,
                            ontap: () {
                              setState(() {
                                name = "popular";
                                isbuttonSelected = false;
                                print("name");
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Buttons(
                            text: "Coming Soon",
                            color: Colors.black45,
                            ontap: () {
                              setState(() {
                                name = "upcoming";
                                isbuttonSelected = false;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Buttons(
                            text: "Top Rated",
                            color: Colors.black45,
                            ontap: () {
                              setState(() {
                                name = "top_rated";
                                isbuttonSelected = false;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 800,
                      height: 500,
                      child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 0.68,
                        children: List.generate(
                          20,
                          (index) {
                            return MovieCard(
                              imaage:
                                  "$imageurl${_dataService.data["results"][index]["poster_path"].toString()}",
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                      imageurl:
                                          "$imageurl${_dataService.data["results"][index]["poster_path"].toString()}",
                                      text: _dataService.data["results"][index]
                                              ["title"]
                                          .toString(),
                                      rating: _dataService.data["results"]
                                              [index]["vote_average"]
                                          .toString(),
                                      Desc: _dataService.data["results"][index]
                                              ["overview"]
                                          .toString(),
                                      backgroundUrl:
                                          "$imageurl${_dataService.data["results"][index]["backdrop_path"].toString()}",
                                      ontap: () {
                                        Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
