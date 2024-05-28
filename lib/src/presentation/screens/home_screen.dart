import 'package:e_bloc/src/blocs/authentication/login_bloc.dart';
import 'package:e_bloc/src/blocs/profile/bloc/profile_bloc.dart';
import 'package:e_bloc/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchAppData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogoutState) {
                context.go(Routes.WELCOME_ROUTE);
              }
              if (state is LogoutFailedState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            child: IconButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LogoutEvent());
                },
                icon: Icon(
                  Icons.logout,
                )),
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileFetchedSuccess) {
            return Column(
              children: [
                ListTile(
                  title: Text('Hello ${state.user?.userName}'),
                  titleTextStyle:
                      Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                  subtitle: Text('Welcome to Laza'),
                  subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
                )
              ],
            );
          } else if (state is ProfileInitial) {
            return CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
