import 'package:flutter/material.dart';
import 'package:pokedex/presentation/widgets/pokeball.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  ImageProvider logo = AssetImage('assets/img/pokedex.png');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: logo,
                  alignment: Alignment.center,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Bulbasaur'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Ivysaur'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Venusaur'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charmander'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charmeleon'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charizard'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Squirtle'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Wartortle'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
