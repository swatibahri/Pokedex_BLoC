import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/business_logic/nav_cubit.dart';
import 'package:pokedex/business_logic/pokemon_bloc.dart';
import 'package:pokedex/business_logic/pokemon_state.dart';
import 'package:pokedex/config.dart';
import 'package:pokedex/presentation/widgets/add_new_pokemon.dart';
import 'package:pokedex/presentation/widgets/pokemon_card.dart';
import '../widgets/sidemenu.dart';
import '../../data/models/pokemon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Pokemon> _pokeDetails = [];
  //List<Pokemon> _pokemonList;
  //bool _isLoading = false;
  // final ScrollController _scrollController =
  //     ScrollController(debugLabel: 'pokemonSc');

  @override
  void initState() {
    super.initState();
    // _fetchPokemonList();

    // _scrollController.addListener(() {
    //   if (!_isLoading && _scrollController.position.extentAfter == 0.0) {
    //     _fetchPokemonList();
    //   }
    // });
  }

  // _fetchPokemonList() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final pokemonList = await pokeApi.getPokemonList(_pokemonList.);
  //   setState(() {
  //     _pokemonList = _pokemonList.plus(pokemonList);
  //     _isLoading = false;
  //   });
  // }

  void _addNewTransaction(
    String name,
    String url,
  ) {
    final newTx = Pokemon(
      name: name,
      url: url,
    );

    setState(() {
      _pokeDetails.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPokemon(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: SideMenu(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Welcome to Poke Wizard',
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _startAddNewTransaction(context),
                ),
              ],
            ),
            body: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  print('in progress');
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  print('success');
                  // return CustomScrollView(
                  //   controller: _scrollController,
                  // slivers: <Widget>[
                  //   SliverGrid

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: state.pokemonListings.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                      
                        onTap: () {
                        
                          BlocProvider.of<NavCubit>(context)
                             .showPokemonDetails(                  
                             state.pokemonListings[index].id,

                          );
                        },
                        // child:PokemonCard(

                        //   id: item.id,
                        //   image: getPokemonImage(state.pokemonListings[index].id),
                        //   name: item.name,
                        //   color: item.color,
                        //   key: ValueKey(item.id),
                        //   onTap: () {
                        //     Navigator.pushNamed(context, '/detail', arguments: {
                        //       'id': item.id,
                        //       'name': item.name,
                        //       'image': getPokemonImage(item.id)
                        //     });
                        //      }),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(getPokemonImage(
                                    state.pokemonListings[index].id)),
                                //Image.network(getPokemonImage(state)),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    // delegate: SliverChildBuilderDelegate((ctx, index) {
                    //   var item = _pokemonList[index];

                    // child:PokemonCard(
                    //     id: item.id,
                    //     image: getPokemonImage(item.id),
                    //     name: item.name,
                    //     color: item.color,
                    //     key: ValueKey(item.id),
                    //     onTap: () {
                    //       Navigator.pushNamed(context, '/detail', arguments: {
                    //         'id': item.id,
                    //         'name': item.name,
                    //         'image': getPokemonImage(item.id)
                    //       });
                    //     //     });
                    //   }, childCount: _pokemonList.size),
                    // ),
                    // SliverToBoxAdapter(
                    //     child: _isLoading
                    //         ? Container(
                    //             alignment: Alignment.center,
                    //             padding: EdgeInsets.all(10),
                    //             child: CircularProgressIndicator(),
                    //           )
                    //         : SizedBox())
                    // ],
                  );
                } else if (state is PokemonPageLoadFailed) {
                  print('Failed');
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  print('Nothing');
                  return Container();
                }
              },
            )));
  }
}
