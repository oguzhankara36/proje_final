class burcsqlite {
  int no;
  String _burcadi;
  String _cinsiyet;
  String _ay;
  burcsqlite(this._burcadi, this._cinsiyet,this._ay);

  burcsqlite.map(dynamic nsne) {
    this._burcadi=nsne["burcadi"];
    this._cinsiyet=nsne["cinsiyet"];
    this._ay=nsne["ay"];
  }
  String get burcadi=>_burcadi;
  String get cinsiyet=>_cinsiyet;
  String get ay=>_ay;

  Map<String, dynamic> haritaYap(){
    var map=new Map<String, dynamic>();
    map["burcadi"]=_burcadi;
    map["cinsiyet"]=_cinsiyet;
    map["ay"]=_ay;
    return map;
  }
  void numaraVer(int no){
    this.no=no;
  }
  }