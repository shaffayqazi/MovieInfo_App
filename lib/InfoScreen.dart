import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/DataService.dart';

class InfoScreen extends StatelessWidget {
  // var Backurl =
  // //     'https://image.tmdb.org/t/p/w300/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg';
  // // var imageurl =
  // //     "https://image.tmdb.org/t/p/w300/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg";
  InfoScreen(
      {Key? key,
      required this.backgroundUrl,
      required this.imageurl,
      required this.text,
      required this.Desc,
      required this.rating,
      required this.ontap})
      : super(key: key);
  String imageurl;
  String backgroundUrl;
  String text;
  String Desc;
  String rating;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const SizedBox(
              height: 30,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                backgroundUrl.toString(),
                fit: BoxFit.cover,
                width: 300,
              ),
            ),
            Container(
              alignment: Alignment(0.87, -0.48),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: EdgeInsets.all(20),
                child: Text(rating),
              ),
            ),
            Container(
              alignment: Alignment(0, -0.35),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Image.network(
                  imageurl.toString(),
                  fit: BoxFit.fill,
                  width: 160,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Text(
                        text,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Text(
                        Desc,
                        style: GoogleFonts.roboto(fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment(-0.9, -0.9),
              child: IconButton(
                  color: Colors.white,
                  onPressed: ontap,
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
