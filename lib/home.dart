import 'package:NewsApp308/article_View.dart';
import 'package:NewsApp308/category_view.dart';
import 'package:NewsApp308/drawer.dart';
import 'package:NewsApp308/helper/data.dart';
import 'package:NewsApp308/helper/newsdata.dart';
import 'package:NewsApp308/main.dart';
import 'package:NewsApp308/models/articleModel.dart';
import 'package:NewsApp308/models/categorymodel.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:bot_toast/bot_toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool loading = true;
List<CategoryModel> categories = new List<CategoryModel>();
List<articleModel> newlist = new List<articleModel>();

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    categories = getcategories();
    fetch();
  }

  fetch() async {
    news obj = new news();
    await obj.getnewsmain();

    setState(() {
      newlist = obj.newslist;
    });
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: [
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        return showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 140,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "News",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "Daily",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Version 1.0',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Developed by Sparsh Kishore Kumar',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "Made on Flutter",
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          "NewsApi.org",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                ],
                expandedHeight: 50.0,
                forceElevated: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [],
                ),
                backgroundColor: Colors.red,
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      BotToast.showText(
                          text: "News Daily Version 1.0",
                          textStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ));
                    }),
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
              )
            ];
          },
          body: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Category',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                // print(categories[index].CategoryName);

                                return Categorytile(
                                  imageurl: categories[index].ImageUrl,
                                  categoryname: categories[index].CategoryName,
                                  catedispname: categories[index].Catedisname,
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Featured ',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'News ',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                scrollDirection: Axis.vertical,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: newlist.length,
                                itemBuilder: (context, index) {
                                  return blogtile(
                                    imageurl: newlist[index].ImageUrl,
                                    desc: newlist[index].Desc,
                                    title: newlist[index].Title,
                                    url: newlist[index].Url,
                                    author: newlist[index].author,
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class Categorytile extends StatelessWidget {
  final imageurl, categoryname, catedispname;
  Categorytile({this.imageurl, this.categoryname, this.catedispname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => categorynews(
                      choosedcate: categoryname,
                    )));
      },
      child: Container(
        // margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 4),
        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),

        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: imageurl,
                width: 120,
                shimmerBackColor: Colors.grey[200],
                shimmerBaseColor: Colors.grey[500],
                shimmerHighlightColor: Colors.white,
                height: 60,
                boxFit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black26),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    catedispname,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ))
          ],
        ),
      ),
    );
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
      splashColor: Colors.red,
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
