import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlansDate extends StatelessWidget {
  final Function dateChooser;
  final DateTime belgilanganSana;
  final Function() pervDay;
  final Function() nextDay;

  PlansDate(this.dateChooser, this.belgilanganSana, this.pervDay, this.nextDay);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: pervDay,
            icon: Icon(
              Icons.arrow_left,
              size: 35,
            )),
        TextButton(
            onPressed: () {
              dateChooser(context);
            },
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 22),
                  children: [
                    TextSpan(
                        text: "${DateFormat.EEEE().format(belgilanganSana)}, ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        )),
                    TextSpan(
                        text: "${DateFormat("d MMM").format(belgilanganSana)}"),
                  ]),
            )),
        IconButton(
            onPressed: nextDay,
            icon: Icon(
              Icons.arrow_right,
              size: 35,
            )),
      ],
    );
  }
}
