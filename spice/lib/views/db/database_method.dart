
import 'package:cloud_firestore/cloud_firestore.dart';


class dbMethod{
  Future<Stream<QuerySnapshot>> getdata(String item)async{
    return await FirebaseFirestore.instance.collection(item).snapshots();

    

  }
}