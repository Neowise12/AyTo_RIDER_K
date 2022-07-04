// import 'package:firebase_database/firebase_database.dart';
// import 'package:rider/backendwork/DetailsFetch.dart';
//
//
// class DatabaseService {
//
//   static Future<List<Need>> getNeeds() async {
//     Query needsSnapshot = await FirebaseDatabase.instance
//         .ref()
//         .child("needs-posts")
//         .orderByKey();
//
//     print(needsSnapshot); // to debug and see if data is returned
//
//     List<Need> needs = [];
//
//     Map<dynamic, dynamic> values = needsSnapshot.data.value;
//     values.forEach((key, values) {
//       needs.add(Need.fromSnapshot(values));
//     });
//
//     return needs;
//   }
// }