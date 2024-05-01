import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/component/Loading Widget/loading_widget.dart';
import '../../../../../core/globle/color/shared_color.dart';
import '../../../cubit/auth_cubit.dart';


class TimerWidget extends StatefulWidget {

  final String phone;
  final String name;
  final String email;
  final String password;
  const TimerWidget({super.key,
    required this.phone,
    required this.name,
    required this.email,
    required this.password,

  });



  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  int _minutes = 2; // Set initial minutes
  int _seconds = 0; // Set initial seconds
  late Timer _timer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_minutes == 0 && _seconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else if (_seconds == 0) {
          setState(() {
            _minutes--;
            _seconds = 59;
          });
        } else {
          setState(() {
            _seconds--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String minutesStr = _minutes.toString().padLeft(2, '0');
    String secondsStr = _seconds.toString().padLeft(2, '0');
    return Center(
      child: Column(
        children: [
          Text(
            'Code expire in  ${minutesStr} : ${secondsStr}',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Do not receive code?',
                style: Theme.of(context).textTheme.titleMedium!,
              ),

              SizedBox(
                height: height*0.05,
                child: Center(
                  child:  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state is ResendRegisterLoading? const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: BuildLoadingWidget(size: 20,),
                      ): TextButton(
                        onPressed: () async {
                          await context.read<AuthCubit>().postResendRegister(
                            email: widget.email,
                            password: widget.password,
                            name: widget.name,
                            phone: widget.phone,
                          );

                         setState(() {
                           _minutes = 2;
                           _seconds = 0;
                           startTimer();
                         });
                        },
                        child: Text(
                          'Re-send',
                          style:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.primaryColor,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
