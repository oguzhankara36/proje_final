import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('animasyon deneme'),
        ),
        body: animasyon());
  }
}

class animasyon extends StatefulWidget {
  @override
  _animasyonState createState() => _animasyonState();
}

class _animasyonState extends State<animasyon> {
  Artboard _artboard;
  RiveAnimationController _animasyonkontrol;

  @override
  void initState() {
    _rivedosyasi();
    super.initState();
  }

  void _rivedosyasi() async {
    final dosya = await rootBundle.load('assets/ilk_animasyon.riv');
    final ekle = RiveFile.import(dosya);

    setState(() {
      _artboard = ekle.mainArtboard;
    });
  }

  void _animasyon1() async {
    _artboard.addController(
      _animasyonkontrol = SimpleAnimation('Animation 1'),
    );
    setState(() => _animasyonkontrol.isActive = true);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
        RaisedButton
          (onLongPress: () => _animasyon1(), child: Text('ANİMASYON İÇİN TIKLAYIN')),
      ],
    );
  }
}