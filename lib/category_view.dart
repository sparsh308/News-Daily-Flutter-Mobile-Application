import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:NewsApp308/helper/newsdata.dart';
import 'package:share/share.dart';
import 'package:shimmer/shimmer.dart';
import 'article_View.dart';
import 'models/articleModel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

categorynew obj = new categorynew();

class categorynews extends StatefulWidget {
  String choosedcate;

  categorynews({this.choosedcate});

  @override
  _categorynewsState createState() => _categorynewsState(cate: choosedcate);
}

List<articleModel> catenewlist = new List<articleModel>();
bool loading = true;

class _categorynewsState extends State<categorynews> {
  String cate;
  _categorynewsState({this.cate});

  @override
  void initState() {
    super.initState();
    //print(cate);
    fetch();
    print("fetched");
  }

  fetch() async {
    categorynew obj = new categorynew();
    await obj.getnewsmain(cate);

    setState(() {
      catenewlist = obj.categorynewslist;
    });
    loading = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    catenewlist.clear();
    loading = true;
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    catenewlist = obj.categorynewslist;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      actions: [
                        Opacity(
                            opacity: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.share),
                            )),
                      ],
                      expandedHeight: 50.0,
                      forceElevated: true,
                      pinned: false,
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: [],
                      ),
                      backgroundColor: Colors.red,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "News",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "Daily",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.white),
                          )
                        ],
                      ),
                      elevation: 0.0,
                      centerTitle: true,
                    ),
                  ];
                },
                body: loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: catenewlist.length,
                              itemBuilder: (context, index) {
                                return blogtile(
                                  imageurl: catenewlist[index].ImageUrl,
                                  desc: catenewlist[index].Desc,
                                  title: catenewlist[index].Title,
                                  url: catenewlist[index].Url,
                                  author: catenewlist[index].author,
                                );
                              }),
                        ),
                      ))));
  }
}

class blogtile extends StatelessWidget {
  final imageurl, title, desc, url, author;

  blogtile(
      {@required this.imageurl,
      @required this.desc,
      @required this.title,
      @required this.url,
      @required this.author});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.redAccent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => articleview(
                      blogurl: url,
                      imageurl: imageurl,
                      desc: title,
                    )));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).backgroundColor,
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(bottom: 6),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      child: FancyShimmerImage(
                        height: 220,
                        imageUrl: imageurl,
                        width: MediaQuery.of(context).size.width,
                        shimmerBackColor: Colors.grey[200],
                        shimmerBaseColor: Colors.grey[500],
                        shimmerHighlightColor: Colors.white,
                        boxFit: BoxFit.cover,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6, left: 6, top: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          icon: Icon(
                            Icons.share,
                          ),
                          onPressed: () {
                            Share.share(url);
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 6.0, left: 6.0, bottom: 6.0, top: 2),
                child: Text(
                  desc,
                  style: TextStyle(color: Theme.of(context).textSelectionColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 6.0, left: 10.0, bottom: 4.0, top: 4),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      author,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
