class TextModel {
  String? textid;
  String? uid;
  String? translation;
  String? data;

  TextModel({this.textid,this.uid, this.translation, this.data});

  //receiving data from server
  factory TextModel.fromMap(map){
    return TextModel(
      textid: map['textid'],
        uid: map['uid'],
        translation: map['translation'],
        data: map['data'],
    );
  }

  //sending data to our server
  Map<String,dynamic> toMap(){
    return{
      'textid': textid,
      'uid': uid,
      'translation': translation,
      'data': data,
    };
  }
}