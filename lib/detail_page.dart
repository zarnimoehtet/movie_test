import 'package:flutter/material.dart';

import 'main.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    // required bool floating,
    // required bool pinned,
    // required int expandedheight,
    // required FlexibleSpaceBar flexibleSpace,
    // required String imageURL,
    // required int width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
                    const SliverAppBar(
                        floating: true,
                        pinned: true,
                        expandedHeight: 220,
                        flexibleSpace: FlexibleSpaceBar(
                          // collapseMode: CollapseMode.pin,
                          background: DetailsPageHeaderItemView(),
                        ))
                  ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // DetailsPageHeaderItemView(),
                MovieGenreAndStorylineItemView(),
                // BestActorsItemView(
                //      kActorTitle,
                //     more: kMoreActors,
                //     imageUrl:
                //         'https://i.pinimg.com/originals/0c/74/54/0c7454a833d1e45018e67260801b72f4.jpg',
                //     width: 194),
                AboutFilmItemView(),
                // BestActorsItemView(
                //    "CREATORS",
                //   more: 'MORE CREATORS',
                //   imageUrl:
                //       'https://i.pinimg.com/originals/92/33/37/923337d9ee2379d7365936be6e4106fc.jpg',
                //   width: 167,
                // ),
                // MovieBodyItemView(
                //   listviewtitle: kRelatedMovies,
                // ),
              ],
            ),
          )),
    );
  }
}

class AboutFilmItemView extends StatelessWidget {
  const AboutFilmItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "kAboutFilm",
            ),
            Row(
              children: const [
                SizedBox(width: 120, child: Text("kOriginalTitle")),
                Text("Spirited Away")
              ],
            ),
            Row(
              children: const [
                SizedBox(width: 120, child: Text("kType")),
                Text("Fantasy,Adventure,Mystery")
              ],
            ),
            Row(
              children: const [
                SizedBox(width: 120, child: Text("kProduction")),
                Text("Studio Ghibli")
              ],
            ),
            Row(
              children: const [
                SizedBox(width: 120, child: Text("kPremiere")),
                Text("20 July 2001 (Japan)")
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(width: 120, child: Text("kDescription")),
                Text(
                    "Spirited Away\ncontains critical\ncommentary on modern\nJapanese society\nconcerning"
                    " generational conflicts and\nenvironmental issues.Chihiro\nhas been seen as a representation\nof the"
                    " shōjo, whose\nroles and ideology had\nchanged dramatically since\npost-war Japan."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MovieGenreAndStorylineItemView extends StatelessWidget {
  const MovieGenreAndStorylineItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: const [
            MovieGenreView(),
            Text("kStoryLineTitle"),
            Text(
              "kStoryLineText",
            ),
            MovieButtonView()
          ],
        ),
      ),
    );
  }
}

class MovieButtonView extends StatelessWidget {
  const MovieButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {},
          textColor: Colors.white,
          color: Colors.red,
          minWidth: 50,
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          splashColor: Colors.grey,
          child: Row(
            children: const [
              Icon(
                Icons.play_circle_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text("kPlayButton"),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        OutlinedButton.icon(
          label: const Text(
            "kRateButton",
          ),
          icon: const Icon(
            Icons.star,
            color: Colors.red,
          ),
          onPressed: () {},
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
        ),
      ],
    );
  }
}

class MovieGenreView extends StatelessWidget {
  const MovieGenreView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.start, spacing: 5, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: 89,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.access_time_sharp,
                color: Colors.red,
              ),
              Text(
                "kMovieDuration",
              ),
            ],
          ),
        ),
      ),
      const Chip(
        elevation: 2,
        backgroundColor: Colors.grey,
        label: Text("kMovieGenre1"),
        labelStyle: TextStyle(fontSize: 12, color: Colors.white),
      ),
      const Chip(
        elevation: 2,
        backgroundColor: Colors.grey,
        label: Text("kMovieGenre2"),
        labelStyle: TextStyle(fontSize: 14, color: Colors.white),
      ),
      const Chip(
        elevation: 2,
        backgroundColor: Colors.grey,
        label: Text("kMovieGenre3"),
        labelStyle: TextStyle(fontSize: 14, color: Colors.white),
      ),
      const Icon(
        Icons.favorite_border_outlined,
        color: Colors.white,
      )
    ]);
  }
}
