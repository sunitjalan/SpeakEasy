class TipsModel {
  String? country;
  String? tip1;
  String? tip2;
  String? tip3;

  TipsModel({this.country,this.tip1,this.tip2, this.tip3});

  //receiving data from server
  factory TipsModel.fromMap(map){
    return TipsModel(
      country: map['country'],
      tip1: map['tip1'],
      tip2: map['tip2'],
      tip3: map['tip3'],
    );
  }

  //sending data to our server
  Map<String,dynamic> toMap(){
    return{
      'country': country,
      'tip1': tip1,
      'tip2': tip2,
      'tip3': tip3,
    };
  }
}