import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_web/helpers/responsiveness.dart';
import 'package:viva_web/shared/color_pallet.dart';
import 'package:viva_web/views/dashboard/home/widget/home_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: unselectedTabColor,
      body: SizedBox(
        width: double.infinity,
        child: Responsiveness(
          largeScreen: LargeHomeScreen(),
        ),
      ),
    );
  }
}

class LargeHomeScreen extends StatelessWidget {
  const LargeHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.0,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Dashboard',
                    style: GoogleFonts.poppins(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        height: 35,
                        padding: const EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          color: greyBgColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            contentPadding: EdgeInsets.only(bottom: 5, top: 5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 35),
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundColor: primaryColor,
                        child: CircleAvatar(
                          radius: 18.0,
                          backgroundImage: AssetImage('images/bg.png'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Sandra',
                        style: GoogleFonts.poppins(
                          color: blackColor,
                          fontSize: 22.0,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.message_outlined),
                        hoverColor: Colors.transparent,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 10.0),
                      IconButton(
                        onPressed: () {},
                        hoverColor: Colors.transparent,
                        icon: const Icon(Icons.notifications),
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SmallestHomeCard(
                              backGroundColor: Color.fromARGB(
                                176,
                                255,
                                82,
                                82,
                              ),
                              duration: 'Weekly',
                              foreGroundColor: Color.fromARGB(255, 133, 11, 2),
                              percentage: '8%',
                              title: 'Request Service',
                              value: '120',
                            ),
                            SmallestHomeCard(
                              backGroundColor: Color.fromARGB(175, 31, 189, 57),
                              duration: 'Weekly',
                              foreGroundColor: Color.fromARGB(255, 2, 133, 24),
                              percentage: '8%',
                              title: 'Revenue',
                              value: 'GH 120.000',
                            ),
                            SmallestHomeCard(
                              duration: 'Weekly',
                              backGroundColor: Color.fromARGB(175, 31, 189, 57),
                              foreGroundColor: Color.fromARGB(255, 2, 133, 24),
                              percentage: '80%',
                              title: 'Users',
                              value: '564',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  color: greenColor,
                  width: double.infinity,
                  height: 500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MediumHomeScreen extends StatelessWidget {
  const MediumHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class SmallHomeScreen extends StatelessWidget {
  const SmallHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
