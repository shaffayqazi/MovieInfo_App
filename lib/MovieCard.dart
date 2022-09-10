import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  MovieCard({required this.imaage,required this.ontap});

  final String imaage;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 40,
        height: 110,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image(
                image:
              CachedNetworkImageProvider(
                imaage.toString(),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
