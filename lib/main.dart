import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ShowCaseView(
                background: Colors.blueGrey,
                padding: const EdgeInsets.all(10),
                title: "ShowCase".toUpperCase(),
                moreAction: "more showcases".toUpperCase(),
                moreActionFun: () {},
                speratorWidth: 10,
                listItemWidth: 180,
                listItemHeight: 50,
                listItemColor: Colors.white,
                listItemCount: 5,
                imageSrc:
                    "https://http2.mlstatic.com/D_NQ_NP_927763-MLB29107143395_012019-O.jpg",
                onClickListItem: () {},
              ),
              ShowCaseView(
                background: Colors.greenAccent,
                padding: const EdgeInsets.all(5),
                title: "Best Actors".toUpperCase(),
                moreAction: "more best actors".toUpperCase(),
                moreActionFun: () {},
                speratorWidth: 10,
                listItemWidth: 100,
                listItemHeight: 80,
                listItemColor: Colors.white,
                listItemCount: 5,
                imageSrc:
                    "https://i.pinimg.com/736x/63/14/ad/6314ad5484eb7ecb5e127762429fd36c.jpg",
                onClickListItem: () {},
              ),
            ],
          ),
        ));
  }
}

class ShowCaseView extends StatelessWidget {
  final Color background;
  final EdgeInsets padding;
  final String title;
  final String moreAction;
  final Function moreActionFun;
  final double speratorWidth;
  final double listItemWidth;
  final double listItemHeight;
  final Color listItemColor;
  final int listItemCount;
  final String imageSrc;
  final Function onClickListItem;
  const ShowCaseView(
      {super.key,
      required this.background,
      required this.padding,
      required this.title,
      required this.moreAction,
      required this.moreActionFun,
      required this.speratorWidth,
      required this.listItemWidth,
      required this.listItemHeight,
      required this.listItemColor,
      required this.listItemCount,
      required this.imageSrc,
      required this.onClickListItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      padding: padding,
      color: background,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              ),
              TextButton(
                onPressed: (() => moreActionFun),
                child: Text(
                  moreAction,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: speratorWidth,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: (() => onClickListItem),
              child: Container(
                width: listItemWidth,
                height: listItemHeight,
                color: listItemColor,
                child: Image.network(
                  imageSrc,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            itemCount: listItemCount,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ))
        ],
      ),
    );
  }
}
