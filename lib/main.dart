import 'package:e_bloc/app.dart';
import 'package:e_bloc/firebase_options.dart';
import 'package:e_bloc/src/data/preference/local_preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = BlocEcommerceObserver();
  await LocalPreferences().init();
  runApp(const BlocEcommerceApp());
}
///section 2 @1:13