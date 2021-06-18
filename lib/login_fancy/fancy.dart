import 'package:animator/animator.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:firebase/api/albums_view.dart';
import 'package:firebase/diger_sayfalar/burc_butonlar.dart';
import 'package:firebase/fire_base/signin_page.dart';
import 'package:firebase/grafik/grafikk.dart';
import 'package:firebase/sqlite/sqlite_sayfam.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class fancy extends StatefulWidget {
  fancy1 createState() => fancy1();
}

class fancy1 extends State<fancy> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int currentPage = 0;
  GlobalKey alttarafkey = GlobalKey();
  TextEditingController ogo = TextEditingController();

  var mesaj = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Hoşgeldiniz"),
        actions: [
          //! Builder eklemezsek Scaffold.of() hata verecektir!
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.login),
              onPressed: () async {
                final User user = _auth.currentUser;
                await _auth.signOut(); // Çıkış yapma kodu
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Başarıyla çıkış yapıldı"),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.white,
        activeIconColor: Colors.black,
        inactiveIconColor: Colors.white,
        barBackgroundColor: Colors.lightGreenAccent,
        textColor: Colors.black,
        tabs: [
          TabData(
              iconData: Icons.lock_clock,
              title: "CİNSİYET",
              onclick: () {
                final FancyBottomNavigationState fState =
                    alttarafkey.currentState;
                fState.setPage(2);
              }),
          TabData(
            iconData: Icons.home,
            title: "BURÇLAR",
          ),
          TabData(iconData: Icons.details, title: "HAKKINDA")
        ],
        initialSelection: 1,
        key: alttarafkey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

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

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                tween: Tween<double>(begin: 1, end: 0),
                builder: (context, state, child) {
                  return FractionalTranslation(
                    translation: Offset(state.value, 0),
                    child: child,
                  );
                },
                child: RaisedButton(
                  child: Text('Animasyonu Başlat'),
                  color: Colors.deepOrange,
                  onLongPress: () => _animasyon1(),
                ),
              ),
              Animator(tween: Tween<double>(begin: 1, end: 0),
                builder: (context, state, child) {
                  return FractionalTranslation(
                    translation: Offset(state.value, 0),
                    child: child,
                  );
                },
                child: RaisedButton(
                    child: Text("CİNSİYET'E GÖRE BURÇ YORUMLARI"),
                    color: Colors.amberAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AlbumsView()));
                    }),
              )
            ]);
      case 1:
        return Column(
          children: <Widget>[
            IntrinsicHeight(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                            "assets/burclar-haritasi.jpg")
                      ],
                    ),
                  ),
                ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animator(tween: Tween<double>(begin: 1, end: 0),
                  builder: (context, state, child) {
                    return FractionalTranslation(
                      translation: Offset(state.value, 0),
                      child: child,
                    );
                  },
                  child: RaisedButton(
                    child: Text("BURÇ YORUMLARI İÇİN TIKLAYINIZ"),
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => buton()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animator(tween: Tween<double>(begin: 1, end: 0),
                  builder: (context, state, child) {
                    return FractionalTranslation(
                      translation: Offset(state.value, 0),
                      child: child,
                    );
                  },
                  child: RaisedButton(
                    child: Text("ÖZEL BURÇ EKLEME"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VtAnasayfa()),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animator(tween: Tween<double>(begin: 1, end: 0),
                  builder: (context, state, child) {
                    return FractionalTranslation(
                      translation: Offset(state.value, 0),
                      child: child,
                    );
                  },
                  child: RaisedButton(
                    child: Text("BURÇ GRAFİĞİ"),
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PieChartSample2()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );

      default:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue[100],
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "OĞUZHAN KARA",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Animator(tween: Tween<double>(begin: 1, end: 0),
                builder: (context, state, child) {
                  return FractionalTranslation(
                    translation: Offset(state.value, 0),
                    child: child,
                  );
                },
                child: Text(
                  "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3006881 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173006058 numaralı Oğuzhan KARA tarafından 25 Haziran 2021 günü yapılmıştır.",
                ),
              ),
            )
          ],
        );
    }
  }
}
