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
            icon: Icon(Icons.chat_bubble_outline_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              store.logoff();
              Modular.to.pushReplacementNamed(Constants.Routes.LOGIN);
            },
            child: Text('LOGOFF'),
          ),
        ],
      ),
    );
  }
}
