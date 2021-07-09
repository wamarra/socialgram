// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RoomStore on _RoomStoreBase, Store {
  Computed<Stream<QuerySnapshot<Object?>>>? _$postsComputed;

  @override
  Stream<QuerySnapshot<Object?>> get posts => (_$postsComputed ??=
          Computed<Stream<QuerySnapshot<Object?>>>(() => super.posts,
              name: '_RoomStoreBase.posts'))
      .value;

  final _$userAtom = Atom(name: '_RoomStoreBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$searchResultAtom = Atom(name: '_RoomStoreBase.searchResult');

  @override
  QuerySnapshot<Object?>? get searchResult {
    _$searchResultAtom.reportRead();
    return super.searchResult;
  }

  @override
  set searchResult(QuerySnapshot<Object?>? value) {
    _$searchResultAtom.reportWrite(value, super.searchResult, () {
      super.searchResult = value;
    });
  }

  final _$chatsAtom = Atom(name: '_RoomStoreBase.chats');

  @override
  Stream<QuerySnapshot<Object?>> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(Stream<QuerySnapshot<Object?>> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  final _$chatRoomsAtom = Atom(name: '_RoomStoreBase.chatRooms');

  @override
  Stream<QuerySnapshot<Object?>> get chatRooms {
    _$chatRoomsAtom.reportRead();
    return super.chatRooms;
  }

  @override
  set chatRooms(Stream<QuerySnapshot<Object?>> value) {
    _$chatRoomsAtom.reportWrite(value, super.chatRooms, () {
      super.chatRooms = value;
    });
  }

  final _$fetchedUsesAtom = Atom(name: '_RoomStoreBase.fetchedUses');

  @override
  Stream<QuerySnapshot<Object?>> get fetchedUses {
    _$fetchedUsesAtom.reportRead();
    return super.fetchedUses;
  }

  @override
  set fetchedUses(Stream<QuerySnapshot<Object?>> value) {
    _$fetchedUsesAtom.reportWrite(value, super.fetchedUses, () {
      super.fetchedUses = value;
    });
  }

  final _$getUserChatsAsyncAction = AsyncAction('_RoomStoreBase.getUserChats');

  @override
  Future getUserChats(String itIsMyName) {
    return _$getUserChatsAsyncAction.run(() => super.getUserChats(itIsMyName));
  }

  final _$addMessageAsyncAction = AsyncAction('_RoomStoreBase.addMessage');

  @override
  Future<void> addMessage(String chatRoomId, dynamic chatMessageData) {
    return _$addMessageAsyncAction
        .run(() => super.addMessage(chatRoomId, chatMessageData));
  }

  final _$getChatsAsyncAction = AsyncAction('_RoomStoreBase.getChats');

  @override
  Future getChats(String chatRoomId) {
    return _$getChatsAsyncAction.run(() => super.getChats(chatRoomId));
  }

  final _$addChatRoomAsyncAction = AsyncAction('_RoomStoreBase.addChatRoom');

  @override
  Future<bool?> addChatRoom(dynamic chatRoom, dynamic chatRoomId) {
    return _$addChatRoomAsyncAction
        .run(() => super.addChatRoom(chatRoom, chatRoomId));
  }

  final _$logoffAsyncAction = AsyncAction('_RoomStoreBase.logoff');

  @override
  Future<void> logoff() {
    return _$logoffAsyncAction.run(() => super.logoff());
  }

  final _$getUserNameSharedPreferenceAsyncAction =
      AsyncAction('_RoomStoreBase.getUserNameSharedPreference');

  @override
  Future<String?> getUserNameSharedPreference() {
    return _$getUserNameSharedPreferenceAsyncAction
        .run(() => super.getUserNameSharedPreference());
  }

  final _$_RoomStoreBaseActionController =
      ActionController(name: '_RoomStoreBase');

  @override
  dynamic searchByName(String searchField) {
    final _$actionInfo = _$_RoomStoreBaseActionController.startAction(
        name: '_RoomStoreBase.searchByName');
    try {
      return super.searchByName(searchField);
    } finally {
      _$_RoomStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
searchResult: ${searchResult},
chats: ${chats},
chatRooms: ${chatRooms},
fetchedUses: ${fetchedUses},
posts: ${posts}
    ''';
  }
}
