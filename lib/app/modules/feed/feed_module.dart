import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialgram/app/modules/feed/feed_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'feed_page.dart';

class FeedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FeedStore(i.get<FirebaseAuth>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => FeedPage()),
  ];
}
