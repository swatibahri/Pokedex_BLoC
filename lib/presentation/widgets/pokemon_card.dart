import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final Color color;
  final Function onTap;
  final ValueKey key;

  PokemonCard(
      {@required this.id,
      @required this.image,
      @required this.name,
      @required this.color,
      @required this.onTap,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: onTap,
          child: Container(
              padding: new EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    child: Hero(
                      tag: 'pokemon-$id',
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 30.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.black,
                      ),
                      child: Text(
                        '#$id',
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                    ),
                  )
                ],
              ))),
    );
  }
}
