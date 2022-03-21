import 'package:firebase_database/firebase_database.dart';
class Post{

  
  static const DATE = "date";
  static const TITLE = "title";
  static const BODY = "body";
  

   int date;
   String title;
   String body;
 

  Post(this.date,this.title, this.body);



  Post.fromSnapshot(DataSnapshot snap):
       
        this.body    = snap.value[BODY],
        this.date    = snap.value[DATE],
        this.title   = snap.value[TITLE];

  Map toMap(){
    return {BODY: body, DATE: date,TITLE: title};
  }
}