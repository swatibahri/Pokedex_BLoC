import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/business_logic/internet_cubit.dart';
import 'package:pokedex/business_logic/pokemon_detail_cubit.dart';
import 'package:pokedex/constants/enums.dart';
import '../../data/models/poke_detail.dart';
import '../../business_logic/services/pokeapi.dart';

class Detail extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  Detail({this.id, this.name, this.image});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PokeDetail pokemonDetail;

  @override
  void initState() {
    super.initState();
    _getPokemonDetail();
  }

  _getPokemonDetail() async {
    final PokeDetail pokemonResult =
        await pokeApi.getPokemonDetail(widget.name);
    setState(() {
      pokemonDetail = pokemonResult;
    });
  }

  List<Widget> _buildPokemonProfile() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Name : ${pokemonDetail.name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Height : ${pokemonDetail.height.toString()} m',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Weight : ${pokemonDetail.weight.toString()} kg',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                  'Base Experience : ${pokemonDetail.baseExperience.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Order : ${pokemonDetail.order.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Types",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pokemonDetail.types
                .map((t) => FilterChip(
                    backgroundColor: Colors.amber,
                    label: Text(
                      t.type.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    onSelected: (b) {}))
                .toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Abilities",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pokemonDetail.abilities
                .map((t) => FilterChip(
                    backgroundColor: Colors.red,
                    label: Text(
                      t.ability.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    onSelected: (b) {}))
                .toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Forms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pokemonDetail.forms == null
                ? <Widget>[Text("This is the final form")]
                : pokemonDetail.forms
                    .map((n) => FilterChip(
                          backgroundColor: Colors.green,
                          label: Text(
                            n.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {},
                        ))
                    .toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Stats",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pokemonDetail.stats == null
                ? <Widget>[Text("This is the final form")]
                : pokemonDetail.stats
                    .map((n) => FilterChip(
                          backgroundColor: Colors.green,
                          label: Text(
                            n.baseStat.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {},
                        ))
                    .toList(),
          ),
          // Row(
          //   children: [
          //     BlocBuilder<InternetCubit, InternetState>(
          //       builder: (internetCubitBuilderContext, state) {
          //         if (state is InternetConnected &&
          //             state.connectionType == ConnectionType.Wifi) {
          //           print('WIFI');
          //           return Scaffold(
          //             body: Text(
          //               'Wi-Fi',
          //               style: Theme.of(internetCubitBuilderContext)
          //                   .textTheme
          //                   .headline2
          //                   .copyWith(
          //                     color: Colors.green,
          //                   ),
          //             ),
          //           );
          //           // return SnackBar(
          //           //   content: Text('Wifi'),
          //           //   duration: Duration(milliseconds: 3000),
          //           // );
          //         } else if (state is InternetConnected &&
          //             state.connectionType == ConnectionType.Mobile) {
          //           print('MOBILE');
          //           // SnackBar(
          //           //   content: Text('Mobile'),
          //           //   duration: Duration(milliseconds: 300),
          //           // );
          //           return Scaffold(
          //             body: Text('Mobile',
          //                 style: Theme.of(internetCubitBuilderContext)
          //                     .textTheme
          //                     .headline1
          //                     .copyWith(
          //                       color: Colors.green,
          //                     )),
          //           );
          //         } else if (state is InternetDisconnected) {
          //           return SnackBar(
          //             content: Text('Disconnected'),
          //             duration: Duration(milliseconds: 300),
          //           );
          //           // return Text('Disconnected',
          //           //     style: Theme.of(internetCubitBuilderContext)
          //           //         .textTheme
          //           //         .headline3
          //           //         .copyWith(
          //           //           color: Colors.green,
          //           //         ));
          //         }
          //         return CircularProgressIndicator();
          //       },
          //       // child: Container(
          //       //   height: 0.0,
          //       //   width: 0.0,
          //       // ),
          //     ),
          //   ],
          // ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokeDetail>(
        builder: (context, details) {
          return details != null
              ? SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                            child: Container(
                          height: MediaQuery.of(context).size.width * 2,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: 'pokemon-${widget.id}',
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.image),
                                  ),
                                ),
                              ),
                              if (pokemonDetail == null)
                                CircularProgressIndicator(),
                              if (pokemonDetail != null)
                                ..._buildPokemonProfile()
                            ],
                          ),
                        ))),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
