import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialgram/app/constants.dart';

part 'room_store.g.dart';

class RoomStore = _RoomStoreBase with _$RoomStore;

abstract class _RoomStoreBase with Store {
  FirebaseAuth firebaseAuth;
  FirebaseFirestore firebaseFirestore;
  SharedPreferences sharedPreferences;

  _RoomStoreBase(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.sharedPreferences});

  @computed
  Stream<QuerySnapshot> get posts {
    return firebaseFirestore.collection('post').snapshots();
  }

  @observable
  late User? user = firebaseAuth.currentUser;

  @observable
  QuerySnapshot? searchResult;

  @observable
  Stream<QuerySnapshot> chats = Stream.empty();

  @observable
  Stream<QuerySnapshot> chatRooms = Stream.empty();

  @observable
  Stream<QuerySnapshot> fetchedUses = Stream.empty();

  @action
  getUserChats(String itIsMyName) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  @action
  Future<void> addMessage(String chatRoomId, chatMessageData) async {
    FirebaseFirestore.instance
        .collection("room")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  @action
  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("room")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  @action
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("user")
        .where('displayName', isGreaterThanOrEqualTo: searchField)
        .get();
  }

  @action
  Future<bool?> addChatRoom(chatRoom, chatRoomId) async {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  @action
  Future<void> logoff() async {
    return firebaseAuth.signOut();
  }

  @action
  Future<String?> getUserNameSharedPreference() async {
    return sharedPreferences.getString(Constants.USERNAMEKEY);
  }
}
