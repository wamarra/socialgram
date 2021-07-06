import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStoreBase with _$FeedStore;

abstract class _FeedStoreBase with Store {
  FirebaseAuth _firebaseAuth;

  _FeedStoreBase(this._firebaseAuth) {
    _firebaseAuth.authStateChanges().listen(_onAuthChange);
  }

  @observable
  late User? user = _firebaseAuth.currentUser;

  void _onAuthChange(User? user) {
    this.user = user;
  }

  @action
  Future<void> logoff() async {
    await _firebaseAuth.signOut();
  }
}
