import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialgram/app/modules/room/room_page.dart';
import 'package:socialgram/app/modules/room/room_store.dart';

class RoomModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RoomStore(
        firebaseAuth: i.get<FirebaseAuth>(),
        firebaseFirestore: i.get<FirebaseFirestore>(),
        sharedPreferences: i.get<SharedPreferences>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => RoomPage()),
  ];
}
