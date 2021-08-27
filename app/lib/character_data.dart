import 'package:flutter/material.dart';
import 'package:superherowikiapp/responses.dart';



class CharacterImageHeader extends StatelessWidget {

  final String heroImageUrl;
  final String name;

  CharacterImageHeader(
    this.heroImageUrl,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.network(heroImageUrl),
          Text(
            name,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 24,
              fontFamily: 'Times'
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterPowerStats extends StatelessWidget {

  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  CharacterPowerStats(
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Intelligence: ' + intelligence,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Strength: ' + strength,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Speed: ' + speed,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Durability: ' + durability,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Power: ' + power,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Combat: ' + combat,
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times'
            ),
          ),
        ),
      ],
    );
  }
}

class CharacterAliasesList extends StatelessWidget {

  final List<String> aliases;

  CharacterAliasesList(
    this.aliases,
  );

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: EdgeInsets.zero,
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: aliases.length,
    itemBuilder: (BuildContext context, int index)
      => Row(
        children: <Widget>[
          Text(aliases[index].toString(),
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times',
            ),
          ),
        ],
      )
  );

}

class CharacterBiography extends StatelessWidget {

  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  CharacterBiography(
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'fullName: ' + fullName,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        SizedBox(height: 10),
        Text(
          'alterEgos: ' + alterEgos,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        SizedBox(height: 10),
        Text('aliases: ',
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        CharacterAliasesList(aliases),
        SizedBox(height: 10),
        Text(
          'placeOfBirth: ' + placeOfBirth,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        SizedBox(height: 10),
        Text(
          'firstAppearance: ' + firstAppearance,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        SizedBox(height: 10),
        Text(
          'publisher: ' + publisher,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
        SizedBox(height: 10),
        Text(
          'alignment: ' + alignment,
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 18,
            fontFamily: 'Times'
          ),
        ),
      ],
    );
  }
}

class CharacterHeightList extends StatelessWidget {

  final List<String> height;

  CharacterHeightList(
    this.height,
  );

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: EdgeInsets.zero,
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: height.length,
    itemBuilder: (BuildContext context, int index)
      => Row(
        children: <Widget>[
          Text(height[index].toString(),
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times',
            ),
          ),
        ],
      )
  );

}


class CharacterWeightList extends StatelessWidget {

  final List<String> weight;

  CharacterWeightList(
    this.weight,
  );

  @override
  Widget build(BuildContext context) => ListView.builder(
    padding: EdgeInsets.zero,
    physics: ClampingScrollPhysics(),
    shrinkWrap: true,
    itemCount: weight.length,
    itemBuilder: (BuildContext context, int index)
      => Row(
        children: <Widget>[
          Text(weight[index].toString(),
            style: TextStyle(
              // color: AppTheme.green[65],
              fontSize: 18,
              fontFamily: 'Times',
            ),
          ),
        ],
      )
  );

}

class CharacterAppearance extends StatelessWidget {

  final String gender;
  final String race;
  final List<String> height;
  final List<String> weight;
  final String eyeColor;
  final String hairColor;

  CharacterAppearance(
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('gender: ' + gender),
        Text('race: ' + race),
        CharacterHeightList(height),
        CharacterWeightList(weight),
        Text('eyeColor: ' + eyeColor),
        Text('hairColor: ' + hairColor),
      ],
    );
  }
}

class CharacterWork extends StatelessWidget {

  final String occupation;
  final String base;

  CharacterWork(
    this.occupation,
    this.base,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('occupation: ' + occupation),
        Text('base: ' + base),
      ],
    );
  }
}

class CharacterConnections extends StatelessWidget {

  final String groupAffiliation;
  final String relatives;

  CharacterConnections(
    this.groupAffiliation,
    this.relatives,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('groupAffiliation: ' + groupAffiliation),
        Text('relatives: ' + relatives),
      ],
    );
  }
}


class CharacterData extends StatelessWidget { 

  final Result superHero;

  CharacterData({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        CharacterImageHeader(
          superHero.heroImage.url,
          superHero.name,
        ),
        SizedBox(height: 10),
        Text(
          'Power Stats',
          style: TextStyle(
            // color: AppTheme.green[65],
            fontSize: 22,
            fontFamily: 'Times'
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CharacterPowerStats(
            superHero.powerstats.intelligence,
            superHero.powerstats.strength,
            superHero.powerstats.speed,
            superHero.powerstats.durability,
            superHero.powerstats.power,
            superHero.powerstats.combat,
          ),
        ),
        SizedBox(height: 30),
        CharacterBiography(
          superHero.biography.fullName,
          superHero.biography.alterEgos,
          superHero.biography.aliases,
          superHero.biography.placeOfBirth,
          superHero.biography.firstAppearance,
          superHero.biography.publisher,
          superHero.biography.alignment
          ),
        SizedBox(height: 30),
        CharacterAppearance(
          superHero.appearance.gender,
          superHero.appearance.race,
          superHero.appearance.height,
          superHero.appearance.weight,
          superHero.appearance.eyeColor,
          superHero.appearance.hairColor
        ),
        SizedBox(height: 30),
        CharacterWork(
          superHero.work.occupation,
          superHero.work.base
          ),
        SizedBox(height: 30),
        CharacterConnections(
          superHero.connections.groupAffiliation,
          superHero.connections.relatives
        ),
        SizedBox(height: 30),
      ],
    );

  }
}