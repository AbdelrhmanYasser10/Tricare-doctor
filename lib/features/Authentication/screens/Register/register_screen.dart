import 'package:flutter/material.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/doctor_registration_form.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/input_field/worker_btn_card.dart';
import 'package:tricares_doctor_app/features/Authentication/screens/Register/widgets/investor_application_form.dart';

import '../../../../core/globle/color/shared_color.dart';
import '../Login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isDoctor = true;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: width * 0.6,
                    height: height * 0.16,
                  ),

                  SizedBox(
                    height: height * 0.05,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apply Now',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Enter Your Personal Information',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                        height: height * 0.165,
                        child: Row(
                          children: [
                            Expanded(
                              child: WorkerButtonCard(
                                title: "Doctor",
                                icon: "doctor.svg",
                                active: isDoctor,
                                onTap: (){
                                  setState(() {
                                    isDoctor = true;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Expanded(
                              child: WorkerButtonCard(
                                title: "Investor",
                                icon: "investor.svg",
                                active: !isDoctor,
                                onTap: (){
                                  setState(() {
                                    isDoctor = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      isDoctor ? const DoctorApplicationForm() : const InvestorApplicationForm(),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              result: (route) => false);
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.primaryColor,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}


