import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_web/shared/color_pallet.dart';

class SmallestHomeCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final String duration;
  final Color backGroundColor;
  final Color foreGroundColor;
  const SmallestHomeCard({
    Key? key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.duration,
    required this.backGroundColor,
    required this.foreGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 14.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        color: foreGroundColor,
                      ),
                      Text(
                        '8%',
                        style: GoogleFonts.poppins(
                          color: foreGroundColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Weekly',
              style: GoogleFonts.poppins(
                color: unselectedTabColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
