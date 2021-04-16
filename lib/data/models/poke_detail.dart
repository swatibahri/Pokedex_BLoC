import 'package:pokedex/data/models/poke_detail_abilities.dart';
import 'package:pokedex/data/models/poke_detail_forms.dart';
import 'package:pokedex/data/models/poke_detail_stats.dart';
import 'package:pokedex/data/models/poke_detail_types.dart';

class PokeDetail {
  List<Abilities> abilities;
  int baseExperience;
  List<Forms> forms;
  int height;
  int id;
  bool isDefault;
  String name;
  int order;
  List<Stats> stats;
  List<Types> types;
  int weight;

  PokeDetail(
      {this.abilities,
      this.baseExperience,
      this.forms,
      this.height,
      this.id,
      this.isDefault,
      this.name,
      this.order,
      this.stats,
      this.types,
      this.weight});

  PokeDetail.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = new List<Abilities>();
      json['abilities'].forEach((v) {
        abilities.add(new Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['forms'] != null) {
      forms = new List<Forms>();
      json['forms'].forEach((v) {
        forms.add(new Forms.fromJson(v));
      });
    }

    height = json['height'];

    id = json['id'];
    isDefault = json['is_default'];

    name = json['name'];
    order = json['order'];
    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilities != null) {
      data['abilities'] = this.abilities.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = this.baseExperience;
    if (this.forms != null) {
      data['forms'] = this.forms.map((v) => v.toJson()).toList();
    }

    data['id'] = this.id;
    data['is_default'] = this.isDefault;

    data['name'] = this.name;
    data['order'] = this.order;

    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}




