import 'package:e_bloc/src/blocs/blocs.dart';
import 'package:e_bloc/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/route_pages.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is SignupInitial) {
                  return Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: state.usernameController,
                            decoration: InputDecoration(
                              labelText: 'username',
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
                                return 'Username is required';
                              } else {
                                return null;
                              }
                            },
                          ),
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
                              })
                        ],
                      ));
                } else {
                  return Container();
                }
              },
            ),
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
      bottomNavigationBar: AppButton(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        text: 'Sign Up',
        bg: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: () {
          if (fromKey.currentState!.validate()) {
            print('Validate');
          }
        },
      ),
    );
  }
}
