import 'package:firebase/sqlite/burcsqlite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';
import 'dart:io' as io;
import 'package:flutter/material.dart';

class VtYardimcisi {
  static final VtYardimcisi _yardimci = new VtYardimcisi.icislem();

  factory VtYardimcisi() => _yardimci;

  VtYardimcisi.icislem();

  static Database _vt;

  Future<Database> get veritabani async {
    if (_vt != null) return _vt;
    _vt = await olusturVt();
    return _vt;
  }

  olusturVt() async {
    io.Directory dosyaKonumu = await getApplicationDocumentsDirectory();
    String yol = join(dosyaKonumu.path, "burc.db");
    var veriTabani = await openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veriTabani;
  }

  _ilkAcilis(Database vt, int versiyon) async {
    await vt.execute(
        "CREATE TABLE Burc(no INTEGER PRIMARY KEY AUTOINCREMENT, burcadi TEXT, cinsiyet TEXT, ay TEXT)");
  }

  Future<int> ogrenciKaydet(burcsqlite burc) async {
    var veritab = await veritabani;
    int cvp = await veritab.insert("Burc", burc.haritaYap());
    return cvp;
  }

  Future<List<burcsqlite>> ogrencileriGetir() async {
    var veritab = await veritabani;
    List<Map> liste = await veritab.rawQuery("SELECT * FROM Burc");
    List<burcsqlite> burclar = new List();
    for (int i = 0; i < liste.length; i++) {
      var burcs = new burcsqlite(
          liste[i]["burcadi"], liste[i]["cinsiyet"], liste[i]["ay"]);
      burcs.numaraVer(liste[i]["no"]);
      burclar.add(burcs);
    }
    return burclar;
  }
Future<int>ogrenciSil(burcsqlite burc) async{
    var veritab=await veritabani;
    int cvp=await veritab.rawDelete("DELETE FROM Burc WHERE no = ?",[burc.no]);
    return cvp;
}

Future<bool> ogrenciGuncelle(burcsqlite burc) async {
    var veritab=await veritabani;
    int cvp=await veritab.update("Burc", burc.haritaYap(),where: "no = ?",whereArgs: <int>[burc.no]);
    return cvp > 0 ? true : false;
}
}