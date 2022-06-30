import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
Future<String> getJsonFromFirebaseRestAPI() async {
  String url = "https://ayto-rkmgec-rev2-default-rtdb.firebaseio.com/ONLINE.json";
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

class SalesData {

  //SalesData(this.month, this.sales);

  var UID;
  var state;
  SalesData(this.UID, this.state);
  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['UID'].toString(),
      parsedJson['state'].toString(),
    );
  }
  List<SalesData> chartData = [];




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
