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
  //Start Control ScrollHeight to Show Image or Text
  final ScrollController _controller = ScrollController();
  var _isScrolledDone = false;

  void _listener() {
    if (_controller.offset / 160 > 1) {
      setState(() {
        _isScrolledDone = true;
      });
    } else {
      setState(() {
        _isScrolledDone = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  //End Control ScrollHeight to Show Image or Text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: _controller,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          floating: true,
          forceElevated: innerBoxIsScrolled,
          flexibleSpace: FlexibleSpaceBar(
            //use for spacing of image or title
            centerTitle: true,
            title:
                _isScrolledDone ? const Text("Sprited Away") : const SizedBox(),
            background: const DetailsPageHeaderItemView(),
          ),
          leading: Stack(
            // normal leading
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 3, left: 10),
                child: Chip(
                  backgroundColor: Colors.blueAccent,
                  label: Text(''),
                  padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all((Radius.circular(30))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13, left: 19),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
            ],
          ),
          actions: const [
            //normal actions
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
        )
      ],
      body: Column(
        // add body
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

class DetailsPageHeaderItemView extends StatelessWidget {
  const DetailsPageHeaderItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      color: Colors.grey,
      child: Stack(
        children: [
          Image.network(
            "https://i.pinimg.com/originals/fc/81/44/fc81445423dcd18c9a83c5078f26e6b0.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DateAndRatingView(),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Sprited Away",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.transparent, Colors.blueGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class DateAndRatingView extends StatelessWidget {
  const DateAndRatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Chip(
          elevation: 2,
          backgroundColor: Colors.yellow,
          label: Text("2021"),
          labelStyle: TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(width: 135),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              "3400 VOTES",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Text(
          "7.714",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
