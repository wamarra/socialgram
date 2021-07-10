import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/feed/feed_store.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key? key, this.title = 'Socialgram'}) : super(key: key);
  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends ModularState<FeedPage, FeedStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            onPressed: () {
              Modular.to.pushNamed('..${Constants.Routes.ROOM}');
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: store.posts,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            log('Erro ao carregar: ${snapshot.error}');
            return Text('Deu erro');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data!.docs.length > 0) {
            final posts = snapshot.data!.docs;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index].data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      FutureBuilder(
                        future: store.getUser(post['userId']),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final user =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: _getAvatar(user),
                                  ),
                                  SizedBox(width: 8),
                                  Text(user['displayName'])
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      SizedBox(height: 8),
                      Image.network(post['url'],
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                      SizedBox(height: 8),
                      Container(
                        child: FutureBuilder(
                            future: store.getUser(post['userId']),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasData) {
                                final user = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                return Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon:
                                            Icon(Icons.favorite_border_rounded),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: Icon(
                                            Icons.chat_bubble_outline_outlined),
                                        onPressed: () {
                                          if (user['displayName'] !=
                                              store.user!.displayName)
                                            sendMessage(user['displayName']);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.share_outlined),
                                        onPressed: () {},
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon:
                                            Icon(Icons.bookmark_border_rounded),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Container();
                            }),
                      ),
                    ],
                  );
                });
          }
          return Container();
        },
      ),
    );
  }

  sendMessage(String userName) {
    List<String> users = [store.user!.displayName!, userName];

    String chatRoomId = getChatRoomId(store.user!.displayName!, userName);

    Map<String, dynamic> chatRoom = {
      'users': users,
      'chatRoomId': chatRoomId,
    };

    store.addChatRoom(chatRoom, chatRoomId);

    Modular.to.pushReplacementNamed('..${Constants.Routes.ROOM}');
  }

  getChatRoomId(String a, String b) {
    print(a);
    print(b);
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  ImageProvider _getAvatar(Map<String, dynamic> user) {
    if (user['profilePicture'] != null) {
      return NetworkImage(user['profilePicture']);
    }
    return AssetImage('assets/avatar.png');
  }
}
