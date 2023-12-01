import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuellog/view/constants/dimensions.dart';
import 'package:fuellog/view/util/logo_with_text.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: LogoWithText(sw: sw),
          ),
          k20,
          Container(
            width: double.infinity,
            height: sw * 0.32,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFECEFF5),
                          const Color(0xFFECEFF5).withOpacity(0.32),
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(Icons.person)),
                          kw10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA2B2C8)),
                              ),
                              Text(
                                'Sarah Yusuf',
                                style: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w500,
                                    fontSize: sw * 0.042,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF0056DD),
                          Color(0xFF3F8AFF),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Watch',
                            style: GoogleFonts.readexPro(
                                fontWeight: FontWeight.w700,
                                fontSize: sw * 0.046,
                                color: Colors.white),
                          ),
                          FittedBox(
                            child: Text(
                              'How to use this application',
                              style: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w400,
                                  fontSize: sw * 0.032,
                                  color: Colors.white),
                            ),
                          ),
                          k10,
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                    'assets/homeScreen/Polygon 1.svg'),
                              ),
                              kw10,
                              Text(
                                'Click to play',
                                style: GoogleFonts.readexPro(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          k20,
          Row(
            children: [
              Container(
                  height: sw * 0.60,
                  width: sw * 0.95,
                  child: Image.asset(
                    'assets/homeScreen/image 152.png',
                    fit: BoxFit.scaleDown,
                  )),
            ],
          ),
          k5,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Press this button to scan',
                style: GoogleFonts.readexPro(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                    color: Colors.black.withOpacity(0.2)),
              ),
              SizedBox(
                child: SvgPicture.asset('assets/homeScreen/Group 33699.svg'),
              ),
              Text(
                'Scan QR',
                style: GoogleFonts.readexPro(
                    fontWeight: FontWeight.w500, fontSize: sw * 0.052),
              ),
              Text(
                'or enter manually',
                style: GoogleFonts.readexPro(
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA2B2C8),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
