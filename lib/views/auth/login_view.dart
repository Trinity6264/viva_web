import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_web/helpers/customText.dart';
import 'package:viva_web/helpers/responsiveness.dart';
import 'package:viva_web/locator/service_locator.dart';
import 'package:viva_web/routes/router.dart';
import 'package:viva_web/service/viva_service.dart';
import 'package:viva_web/shared/color_pallet.dart';
import 'package:viva_web/shared/input_dec.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  static late TextEditingController _emailController;
  static late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _navService = locator.get<VivaNavService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/bg.png'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.8),
                  whiteColor.withOpacity(0.5),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Responsiveness(
              largeScreen: LoginLargeScreen(
                emailController: _emailController,
                passwordController: _passwordController,
                onpressed: () => _navService.navigateTo(VivaRoute.dashboard),
              ),
              mediumScreen: LoginMediumScreen(
                emailController: _emailController,
                passwordController: _passwordController,
                onpressed: () => _navService.navigateTo(VivaRoute.dashboard),
              ),
              smallScreen: LoginSmallScreen(
                emailController: _emailController,
                passwordController: _passwordController,
                onpressed: () => _navService.navigateTo(VivaRoute.dashboard),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Small Screen

class LoginSmallScreen extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onpressed;

  const LoginSmallScreen({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onpressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Viva Magic',
                  style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 58,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 120),
          Container(
            // padding: const EdgeInsets.only(left: 100),
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Spacer(),
                Container(
                  width: 350,
                  height: 60,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CustomTextField(
                      controller: emailController,
                      decoration: customInputDec.copyWith(
                        hintText: 'Enter Your Email',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Container(
                  width: 350,
                  height: 60,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CustomTextField(
                      controller: passwordController,
                      decoration: customInputDec.copyWith(
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: onpressed,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Center(
                  child: Text(
                    '© 2022 Viva Magic Technologies ',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginMediumScreen extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onpressed;

  const LoginMediumScreen({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onpressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Viva Magic',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 58,
                    ),
                  ),
                  Text(
                    '© 2022 Viva Magic Technologies ',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 70),
          Expanded(
            child: Container(
              // padding: const EdgeInsets.only(left: 100),
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    width: 350,
                    height: 60,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: emailController,
                        decoration: customInputDec.copyWith(
                          hintText: 'Enter Your Email',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    width: 350,
                    height: 60,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: passwordController,
                        decoration: customInputDec.copyWith(
                          hintText: 'Enter Your Password',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: onpressed,
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginLargeScreen extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onpressed;
  const LoginLargeScreen({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Viva Magic',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 98,
                    ),
                  ),
                  Text(
                    '© 2022 Viva Magic Technologies ',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 150),
          Expanded(
            child: Container(
              // padding: const EdgeInsets.only(left: 100),
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    width: 400,
                    height: 70,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: emailController,
                        decoration: customInputDec.copyWith(
                          hintText: 'Enter Your Email',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    width: 400,
                    height: 70,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomTextField(
                        controller: passwordController,
                        decoration: customInputDec.copyWith(
                          hintText: 'Enter Your Password',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: onpressed,
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                          color: whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
