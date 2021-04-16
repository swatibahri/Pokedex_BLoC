  

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/business_logic/nav_cubit.dart';
import 'package:pokedex/presentation/screens/detail.dart';
import 'package:pokedex/presentation/screens/home.dart';



class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, pokemonId) {
      return Navigator(
        pages: [
          MaterialPage(child: Home()),
          if (pokemonId != null) MaterialPage(child: Detail())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPokedex();
          return route.didPop(result);
        },
      );
    });
  }
}