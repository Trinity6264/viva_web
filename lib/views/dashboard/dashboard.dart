import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_web/models/tab_model.dart';
import 'package:viva_web/shared/color_pallet.dart';
import 'package:viva_web/views/dashboard/analytics/analytics.dart';
import 'package:viva_web/views/dashboard/home/home.dart';
import 'package:viva_web/views/dashboard/logout/logout.dart';
import 'package:viva_web/views/dashboard/magicians/magicians.dart';
import 'package:viva_web/views/dashboard/payment/payment.dart';
import 'package:viva_web/views/dashboard/settings/settings.dart';
import 'package:viva_web/views/dashboard/users/users.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;

  static final List<Widget> pages = [
    const HomeView(),
    const AnalyticsView(),
    const MagiciansView(),
    const UsersView(),
    const PaymentView(),
    const SettingsView(),
    const LogoutView(),
  ];
  static final List<TabModel> _tabs = [
    const TabModel(icon: FontAwesomeIcons.house, title: 'Home', index: 0),
    const TabModel(
        icon: FontAwesomeIcons.chartArea, title: 'Analytics', index: 1),
    const TabModel(icon: Icons.people, title: 'Magicians', index: 2),
    const TabModel(
        icon: FontAwesomeIcons.peopleGroup, title: 'Users', index: 3),
    const TabModel(
        icon: FontAwesomeIcons.circleDollarToSlot, title: 'Payment', index: 4),
    const TabModel(icon: Icons.settings, title: 'Settings', index: 5),
    const TabModel(
        icon: FontAwesomeIcons.arrowRightFromBracket,
        title: 'Logout',
        index: 6),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: unselectedTabColor,
      body: Row(
        children: [
          Container(
            width: 220,
            margin: const EdgeInsets.only(right: 20),
            height: double.infinity,
            color: primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  width: 100,
                  child: Text(
                    'VIVA Magic',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _tabs
                            .map(
                              (e) => _sideTab(
                                isActive: index == e.index,
                                icon: e.icon,
                                title: e.title,
                                onTap: () {
                                  setState(() {
                                    index = e.index;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                const Divider(color: whiteBgColor),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  height: 130.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 26,
                            backgroundColor: whiteColor,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage(
                                'images/bg.png',
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sandro Aidoo',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.0,
                                  color: whiteColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greenColor,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Online',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.0,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 38,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: whiteColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.bell,
                                  color: primaryColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Help & Guide',
                                  style: GoogleFonts.poppins(
                                    color: primaryColor,
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: pages[index]),
        ],
      ),
    );
  }
}

Widget _sideTab({
  required bool isActive,
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 42,
      decoration: BoxDecoration(
        color: isActive ? unselectedTabColor : null,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isActive ? primaryColor : unselectedTabColor,
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: isActive ? primaryColor : unselectedTabColor,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/*
Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  color: primaryColor,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        color: Colors.amber,
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
*/
