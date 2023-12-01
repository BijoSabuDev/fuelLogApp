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
            padding: const EdgeInsets.all(8.0),
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
                          Text(
                            'How to use this application',
                            style: GoogleFonts.readexPro(
                                fontWeight: FontWeight.w400,
                                fontSize: sw * 0.030,
                                color: Colors.white),
                          ),
                          Text(
                            'How to use this application',
                            style: GoogleFonts.readexPro(
                                fontWeight: FontWeight.w400,
                                fontSize: sw * 0.030,
                                color: Colors.white),
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       decoration: const BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: Colors.white),
                          //       child: SvgPicture.asset(
                          //           'assets/homeScreen/Polygon 1.svg'),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
