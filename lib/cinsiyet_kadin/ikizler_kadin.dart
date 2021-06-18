import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:animator/animator.dart';

class ikizler_kadin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('İKİZLER KADINI'),
        ),
        body: ikizlerr_kadin());
  }
}

class ikizlerr_kadin extends StatefulWidget {
  @override
  _ikizlerr_kadinState createState() => _ikizlerr_kadinState();
}

class _ikizlerr_kadinState extends State<ikizlerr_kadin> {
  var gelenyazi="";
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol2;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final ikizlerdosya = await rootBundle.load('assets/ikizler_kadın.riv');
    final ikizlerekle = RiveFile.import(ikizlerdosya);

    setState(() {
      _artboard = ikizlerekle.mainArtboard;
    });
  }

  void _animasyon2() async {
    _artboard.addController(
      _animasyonkontrol2 = SimpleAnimation('ikizler_kadın'),
    );
    setState(() => _animasyonkontrol2.isActive = true);
  }
  yazigetir() {
    FirebaseFirestore.instance.collection("burclar")
        .doc('ikizlerkadın').get().then((gelen) {
      setState(() {
        gelenyazi = gelen.data()['ikizlerkadın'];
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: _artboard != null
                  ? Rive(
                artboard: _artboard,
                fit: BoxFit.cover,
              )
                  : Container()),
          Animator(
            tween: Tween<double>(begin: 1,end: 0),
            builder:(context, state, child){
              return FractionalTranslation(translation: Offset(state.value, 0),
                child: child,
              );
            },
            child: FloatingActionButton
              (child: Icon(Icons.adjust),
                onPressed: ()
                {
                  yazigetir();
                  _animasyon2();
                }

            ),
          ),
          Column(
            children: [
              Text(gelenyazi.toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )],
          )
        ],
      ),
    );
  }
}