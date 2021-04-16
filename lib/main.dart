import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'business_logic/internet_cubit.dart';
import 'presentation/screens/main_screen.dart';

void main() => runApp(MyApp(
      connectivity: Connectivity(),
    ));

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({
    @required this.connectivity,
  });

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}
