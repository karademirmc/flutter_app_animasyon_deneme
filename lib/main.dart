import 'package:flutter/material.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Flare Animasyon",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlareController myFlareContreller;
  String oynatilacakAnime = "";
  String animeIdle = "idle";
  String animeSuccess = "success";
  String animeAfterSuccess = "after_success";
  String animeFail = "fail";

  @override
  void initState() {
    myFlareContreller = FlareControls();
    oynatilacakAnime = animeIdle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: FlareActor(
              "assets/login_screen_bg.flr",
              alignment: Alignment.center,
              fit: BoxFit.cover,
              animation: oynatilacakAnime,
              controller: myFlareContreller,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Center(
              child: ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        oynatilacakAnime = animeIdle;
                      });
                    },
                    child: Text("İdle"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        oynatilacakAnime = animeSuccess;
                      });
                    },
                    child: Text("success"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        oynatilacakAnime = animeFail;
                      });
                    },
                    child: Text("fail"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        oynatilacakAnime = animeAfterSuccess;
                      });
                    },
                    child: Text("after_success"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
