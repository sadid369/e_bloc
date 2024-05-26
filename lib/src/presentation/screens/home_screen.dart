import 'package:e_bloc/src/blocs/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(),
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
