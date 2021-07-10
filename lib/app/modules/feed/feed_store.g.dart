// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStoreBase, Store {
  Computed<Stream<QuerySnapshot<Object?>>>? _$postsComputed;

  @override
  Stream<QuerySnapshot<Object?>> get posts => (_$postsComputed ??=
          Computed<Stream<QuerySnapshot<Object?>>>(() => super.posts,
              name: '_FeedStoreBase.posts'))
      .value;

  final _$userAtom = Atom(name: '_FeedStoreBase.user');

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

  final _$addChatRoomAsyncAction = AsyncAction('_FeedStoreBase.addChatRoom');

  @override
  Future<bool?> addChatRoom(dynamic chatRoom, dynamic chatRoomId) {
    return _$addChatRoomAsyncAction
        .run(() => super.addChatRoom(chatRoom, chatRoomId));
  }

  final _$_FeedStoreBaseActionController =
      ActionController(name: '_FeedStoreBase');

  @override
  void _onAuthChange(User? user) {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase._onAuthChange');
    try {
      return super._onAuthChange(user);
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
posts: ${posts}
    ''';
  }
}
