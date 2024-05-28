import 'package:e_bloc/src/blocs/blocs.dart';
import 'package:e_bloc/src/presentation/widgets/app_button.dart';
import 'package:e_bloc/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lets Gets Started',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Fluttertoast.showToast(msg: 'Login Success');
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.goNamed(Routes.HOME_ROUTE);
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                    const Gap(10),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.twitter,
                      onPressed: () {
                        context.read<LoginBloc>().add(RequestTwitterLogin());
                      },
                    ),
                    const Gap(10),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {
                        context.read<LoginBloc>().add(RequestGoogleLogin());
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.push(Routes.LOGIN_ROUTE);
                      },
                      child: Text(
                        'Sign in',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                      ))
                ],
              ),
              AppButton(
                width: MediaQuery.of(context).size.width,
                height: 60.h,
                text: 'Create an Account',
                bg: Theme.of(context).colorScheme.onPrimaryContainer,
                onTap: () {
                  context.push(Routes.REGISTER_ROUTE);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
