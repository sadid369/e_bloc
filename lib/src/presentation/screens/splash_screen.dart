import 'package:e_bloc/src/routes/route_pages.dart';
import 'package:e_bloc/src/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/blocs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashEnd) {
            context.goNamed(Routes.WELCOME_ROUTE);
          }
        },
        child: Center(
          child: SvgPicture.asset(
            AssetManager.APP_LOGO,
            height: 50.h,
            width: 80.w,
          ),
        ),
      ),
    );
  }
}
