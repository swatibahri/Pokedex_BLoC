import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/business_logic/nav_cubit.dart';
import 'package:pokedex/business_logic/pokemon_bloc.dart';
import 'package:pokedex/business_logic/pokemon_detail_cubit.dart';
import 'package:pokedex/business_logic/pokemon_event.dart';
import 'package:pokedex/presentation/screens/app_navigator.dart';



class MainScreen extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp( 
  //     title: 'Pokedex',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: Home(),
  //     onGenerateRoute: (RouteSettings settings) {
  //       Map params = settings.arguments;
  //       switch (settings.name) {
  //         case '/home':
  //           return MaterialPageRoute(builder: (context) => Home());
  //           break;
  //         case '/detail':
  //           return MaterialPageRoute(builder: (context) => Detail(id: params['id'], name: params['name'], image: params['image']));
  //           break;
  //         default:
  //           return MaterialPageRoute(builder: (context) => Home());
  //       }
  //     }
  //   );
  // }
  // 
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.blue, accentColor: Colors.blue),
      home: 
      MultiBlocProvider(providers: [
       
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
        BlocProvider(create: (context) => pokemonDetailsCubit)
      ], child: AppNavigator()),
    );
  }
}