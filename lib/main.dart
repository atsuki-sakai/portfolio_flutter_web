import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/portfolio_view/portfolio_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakai Atsuki Portfolio.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          subtitle1: GoogleFonts.notoSans(
            fontSize: 64,
            color: Colors.black,
          ),
          subtitle2: GoogleFonts.notoSans(fontSize: 32, color: Colors.black),
          headline1: GoogleFonts.montserrat(fontSize: 60, color: Colors.black),
          headline2: GoogleFonts.montserrat(fontSize: 50, color: Colors.black),
          headline3: GoogleFonts.montserrat(fontSize: 40, color: Colors.black),
          headline4: GoogleFonts.montserrat(fontSize: 30, color: Colors.black),
          headline5: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
          headline6: GoogleFonts.montserrat(fontSize: 10, color: Colors.black),
        ),
      ),
      home: PortfolioView(),
    );
  }
}