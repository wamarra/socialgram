import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socialgram/app/constants.dart';
import 'package:socialgram/app/modules/room/chat_page.dart';
import 'package:socialgram/app/modules/room/room_store.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, this.title = 'SearchPage'}) : super(key: key);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ModularState<SearchPage, RoomStore> {
  TextEditingController searchEditingController = new TextEditingController();

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await store.searchByName(searchEditingController.text).then((snapshot) {
        store.searchResult = snapshot;
        print("${store.searchResult}");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: store.searchResult!.docs.length,
            itemBuilder: (context, index) {
              final doc = store.searchResult!.docs[index].data()
                  as Map<String, dynamic>;
              return userTile(
                doc['displayName'],
                doc['bio'],
              );
            })
        : Container();
  }

  sendMessage(String userName) {
    List<String> users = [Constants.myName, userName];

    String chatRoomId = getChatRoomId(Constants.myName, userName);

    Map<String, dynamic> chatRoom = {
      'users': users,
      'chatRoomId': chatRoomId,
    };

    store.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          chatRoomId: chatRoomId,
        ),
      ),
    );
  }

  Widget userTile(String userName, String userBio) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                userBio,
                style: TextStyle(color: Colors.black54, fontSize: 12),
              )
            ],
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat - Search'),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Color(0x54FFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchEditingController,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                            decoration: InputDecoration(
                                hintText: 'Procurar usuário...',
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: initiateSearch,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  userList()
                ],
              ),
            ),
    );
  }
}
