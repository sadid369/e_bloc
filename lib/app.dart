// import 'package:bloc_ecommerce/src/blocs/authentication/remember_switch_cubit.dart';

import 'package:e_bloc/src/blocs/profile/bloc/profile_bloc.dart';
import 'package:e_bloc/src/data/repository/profile_repository.dart';
import 'package:e_bloc/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/blocs/blocs.dart';
import 'src/data/repository/repository.dart';
import 'theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return SplashCubit();
            },
          ),
          BlocProvider(
            create: (context) {
              return RememberSwitchCubit();
            },
          ),
          BlocProvider(
            create: (context) {
              return SignupBloc();
            },
          ),
          BlocProvider(
            create: (context) {
              return LoginBloc(auth: context.read<AuthRepository>());
            },
          ),
          BlocProvider(
            create: (context) {
              return ProfileBloc(
                  profileRepository: context.read<ProfileRepository>());
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              theme: const MaterialTheme(TextTheme()).light(),
              darkTheme: const MaterialTheme(TextTheme()).dark(),
              debugShowCheckedModeBanner: false,
              routerConfig: RoutePages.ROUTER,
            );
          },
        ),
      ),
    );
  }
}
//start