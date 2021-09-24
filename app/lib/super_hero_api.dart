
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superherowikiapp/main.dart';
import 'package:superherowikiapp/responses.dart';

import 'package:superherowikiapp/character_data.dart';

class SuperHeroAPIPage extends StatefulWidget {
  const SuperHeroAPIPage({Key? key}) : super(key: key);

  static const routeName = '/superheroapi';

  @override
  _SuperHeroAPIPageState createState() => _SuperHeroAPIPageState();
}

class _SuperHeroAPIPageState extends State<SuperHeroAPIPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchArguments;
    final numberCheck = num.tryParse(args.text);

    if (numberCheck == null) {
      return Center(
        child: FutureBuilder<SuperHeroMultipleResponse>(
          future: fetchSuperHeroMultipleResponse(args.text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SuperHeroLineupPage(
                superHeroList: snapshot.data!.results
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Error",
                    textAlign: TextAlign.center,
                  ),
                ),
                body:  SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text('An error has occurred.... ',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text('${snapshot.error}',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
            // return const CircularProgressIndicator();
          },
        ),
      );

    }

    else {
      return Center(
        child: FutureBuilder<SuperHeroSingleResponse>(
          future: fetchSuperHeroSingleResponse(args.text),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              Result superHero = Result.fromJson(snapshot.data!.toJson());
              String titleText = 'Super Hero Data: ' + superHero.name;
              return Scaffold(
                appBar: AppBar(
                  title: Text(titleText),
                ),
                body:  SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CharacterData(superHero: superHero),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Error",
                    textAlign: TextAlign.center,
                  ),
                ),
                body:  SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text('An error has occurred.... ',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text('${snapshot.error}',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            // By default, show a loading spinner.
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );

    }
    
  }
}

class SuperHeroLineupPage extends StatelessWidget { 

  final PageController controller = PageController(initialPage: 0);

  final List<Result> superHeroList;

  SuperHeroLineupPage({Key? key, required this.superHeroList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemCount: superHeroList.length,
      itemBuilder: (context, index) {
      Result superHero = superHeroList[index];
      String titleText = 'Super Hero Data: ' + superHero.name;

      return Scaffold(
        appBar: AppBar(
          title: Text(titleText),
        ),
        body: SingleChildScrollView(
          child: SuperHeroPage(superHero: superHeroList[index]),
        ),
      );
    });

  }
}

class SuperHeroPage extends StatelessWidget { 

  final Result superHero;

  SuperHeroPage({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
              
    return Column(
      children: <Widget>[
        CharacterData(superHero: superHero),
      ],
    );

  }
}
