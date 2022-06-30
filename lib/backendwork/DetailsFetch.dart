import 'package:firebase_database/firebase_database.dart';

class Need {
  var id;
  var lat;
  var long;
  var state;


  Need(this.id, this.lat, this.long, this.state);

  Need.fromSnapshot(DataSnapshot snapshot) :
        id = snapshot.key,
        lat = snapshot.value["lat"],
        long = snapshot.value["long"],
        state= snapshot.value["state"];

  toJson() {
    return {
      "lat": lat,
      "long": long,
      "state": state,
    };
  }
}

















/*
class Need {
  var id;
  var lat;
  var long;
  var state;

  Need({
    required this.id,
    required this.lat,
    required this.long,
    required this.state,
  });

  */
/*Need.fromSnapshot(DataSnapshot snapshot, this.lat, this.long, this.state) :
        id = snapshot.key,
        lat = snapshot.value,
        long = snapshot.value,
        state = snapshot.value;*//*


  Future<DatabaseEvent> getItems() {
    return FirebaseDatabase().reference().child("items").once();
  }


  toJson() {
    return {
      "lat": lat,
      "long": long,
      "state": state,
    };
  }

  print(getItems()) {
    // TODO: implement print
    throw UnimplementedError();
  }
}*/
