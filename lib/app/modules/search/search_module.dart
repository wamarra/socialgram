import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/modules/search/search_store.dart';
import 'search_page.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore(
        firebaseAuth: i.get<FirebaseAuth>(),
        firebaseFirestore: i.get<FirebaseFirestore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => SearchPage()),
  ];
}
