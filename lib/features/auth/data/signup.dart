import 'package:supabase_flutter/supabase_flutter.dart';

class PostSignup {
  final supabase = Supabase.instance.client;

  postSignup(email, password) async {
    try {
      // var colums = {
      //   "name": "text",
      //   "age": "text",
      //   "email": "text",
      //   "number": "text",
      // };
      var response = await supabase.auth
          .signUp(password: password, email: email)
          .then((onValue) {
            print(onValue);
          });

      print(response);
    } catch (e) {
      print("catch $e");
    }
  }

  addDataUser(mapValu) async {
    try {
      final response = await supabase.from("users").insert(mapValu);
      print("response add data $response");
    } catch (e) {
      print("caht error $e");
    }
  }
}
