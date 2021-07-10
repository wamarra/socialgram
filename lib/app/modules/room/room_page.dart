import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/room/chat_page.dart';
import 'package:socialgram/app/modules/room/room_store.dart';
import 'package:socialgram/app/modules/room/search_page.dart';

class RoomPage extends StatefulWidget {
  final String title;
  const RoomPage({Key? key, this.title = 'Chat - Room'}) : super(key: key);
  @override
  RoomPageState createState() => RoomPageState();
}

class RoomPageState extends ModularState<RoomPage, RoomStore> {
  @override
  void initState() {
    getUserInfoGetChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50.withOpacity(0.5),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              store.logoff().then(
                  (_) => Modular.to.popAndPushNamed(Constants.Routes.LOGIN));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        },
      ),
    );
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: store.chatRooms,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final doc =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return ChatRoomsTile(
                    userName: doc['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId: doc["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  getUserInfoGetChats() async {
    Constants.myName = (await store.getUserNameSharedPreference())!;
    store.getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        store.chatRooms = snapshots;
        print(
            'Esses são so dados ${store.chatRooms.toString()} do(a) ${Constants.myName}');
      });
    });
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({required this.userName, required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              chatRoomId: chatRoomId,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: Text(
                userName.substring(0, 1),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              userName,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontFamily: 'OverpassRegular',
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
