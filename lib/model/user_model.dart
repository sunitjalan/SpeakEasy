class UserModel {
  String? uid;
  String? email;
  String? name;
  String? lang1;
  String? lang2;
  String? gps;

  UserModel({this.uid, this.email, this.name,this.lang1,this.lang2,this.gps});

  //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      lang1: map['lang1'],
      lang2: map['lang2'],
      gps: map['gps']
    );
  }

  //sending data to our server
  Map<String,dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'name': name,
      'lang1': lang1,
      'lang2': lang2,
      'gps': gps,
    };
  }
}