import 'package:e_bloc/src/presentation/widgets/app_button.dart';
import 'package:e_bloc/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../blocs/blocs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
              if (state is LoginSuccess) {
                context.go(Routes.HOME_ROUTE);
                // fromKey.currentState!.reset();
              }
              if (state is LoginFailed) {
                Fluttertoast.showToast(msg: state.message);
              }
            }, builder: (context, state) {
              if (state is LoginInitial) {
                return Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: state.emailController,
                            decoration: InputDecoration(
                              labelText: 'email',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                                    fontSize: 20,
                                  ),
                            ),
                            validator: (value) {
                              if (value == "" || value == null) {
                                return 'Email is required';
                              } else {
                                return null;
                              }
                            }),
                        TextFormField(
                            obscureText: true,
                            controller: state.passwordController,
                            decoration: InputDecoration(
                              labelText: 'password',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outlineVariant,
                                    fontSize: 20,
                                  ),
                            ),
                            validator: (value) {
                              if (value == "" || value == null) {
                                return 'Password is required';
                              } else {
                                return null;
                              }
                            }),
                      ],
                    ));
              } else {
                return Container();
              }
            }),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember me',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state is SwitchChanged ? state.value : true,
                      onChanged: (value) {
                        context.read<RememberSwitchCubit>().switchToggle(value);
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.push(Routes.REGISTER_ROUTE);
                      },
                      child: Text(
                        'Sign UP',
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
                text: 'Sign In',
                child: state is LoginLoading
                    ? LoadingAnimationWidget.discreteCircle(
                        color: theme.colorScheme.onPrimaryContainer, size: 35.w)
                    : null,
                bg: Theme.of(context).colorScheme.onPrimaryContainer,
                onTap: () {
                  if (fromKey.currentState!.validate()) {
                    if (state is LoginInitial) {
                      context.read<LoginBloc>().add(
                            RequestEmailLogin(
                              email: state.emailController.text,
                              password: state.passwordController.text,
                              isRemember: RememberSwitchCubit.isRemember,
                            ),
                          );
                    }
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
