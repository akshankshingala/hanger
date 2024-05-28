import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/globle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Bag',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CarouselSlider slider() => CarouselSlider(
          items: [
            Container(
              height: height / 5,
              width: width / 1,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-vector/flash-sale-colorful-sale-banner_61558-6.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height / 5,
              width: width / 1.6,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-vector/discount-banner-template_334050-65.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height / 5,
              width: width / 1.6,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-vector/sales-banner-origami-style-with-discount_23-2148399716.jpg?size=626&ext=jpg&ga=GA1.1.1395880969.1709510400&semt=ais',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: height / 5,
              width: width / 1.6,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade700),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-vector/colorful-big-sale-banner-design_8499-254.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            height: height / 4,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.easeInOutCubic,
          ),
        );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: height / 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.grey.shade200.withOpacity(0.3),
        title: Text(
          "HANGER",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 5,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: (isHome == true) ? true : false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 25,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                          ),
                          height: height / 16,
                          width: width / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.search_outlined,
                                    color: Colors.grey.shade700,
                                  ),
                                  SizedBox(
                                    width: width / 35,
                                  ),
                                  Text(
                                    "search product",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      letterSpacing: 2,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.grey.shade700,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      slider(),
                      SizedBox(
                        height: height / 50,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: allProduct.map((e) {
                            List<Map<String, dynamic>> data =
                                e['categoryProduct'];
                            return Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              padding: const EdgeInsets.only(
                                top: 15,
                                left: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${e['category']}",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 45,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ...data.map((e) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                              right: 17,
                                              left: 5,
                                            ),
                                            height: height / 2,
                                            width: width / 1.8,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            'detail_page',
                                                            arguments: e);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                              ),
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    NetworkImage(
                                                                  "${e['thumbnail']}",
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            alignment: Alignment
                                                                .topLeft,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              color: Colors
                                                                  .black12,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "${e['name']}",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    RatingBar
                                                                        .builder(
                                                                      initialRating:
                                                                          double.parse(
                                                                              "${e['rating']}"),
                                                                      minRating:
                                                                          1,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      allowHalfRating:
                                                                          true,
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          18,
                                                                      ignoreGestures:
                                                                          true,
                                                                      itemPadding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 1),
                                                                      itemBuilder:
                                                                          (context, _) =>
                                                                              Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .amberAccent,
                                                                      ),
                                                                      onRatingUpdate:
                                                                          (rating) {},
                                                                    ),
                                                                    Text(
                                                                      "(${e['ratingcount']})",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontSize:
                                                                            9,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height:
                                                                      height /
                                                                          150,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border(
                                                                      bottom:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              width / 50,
                                                                        ),
                                                                        Text(
                                                                          "₹ ${e['price']}",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.grey.shade700,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width / 90,
                                                                        ),
                                                                        Text(
                                                                          // "(${e['discount']}% off)",
                                                                          "${e['faceprice']}",
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontSize:
                                                                                12,
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      "(${e['discount']}% off)",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    e['isBuy'] = !e['isBuy'];
                                                    (e['isBuy'] != false)
                                                        ? cartList.add(e)
                                                        : cartList.remove(e);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: height / 18.5,
                                                    width: width / 10,
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .grey.shade500
                                                          .withOpacity(0.3),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                      ),
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: (e['isBuy'] != true)
                                                        ? Icon(
                                                            Icons
                                                                .add_shopping_cart,
                                                            color: Colors
                                                                .grey.shade700,
                                                            size: 18,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .remove_circle_outline,
                                                            color: Colors.red
                                                                .withOpacity(
                                                                    0.8),
                                                            size: 18,
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: (isFav == true) ? true : false,
                child: SingleChildScrollView(
                  child: Column(
                    children: favList
                        .map(
                          (e) => Container(
                            height: height / 5,
                            width: width / 0.9,
                            margin:
                                EdgeInsets.only(top: 30, left: 20, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300.withOpacity(0.3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage("${e['thumbnail']}"),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "${e['name']}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.topRight,
                                                child: Text(
                                                  "₹ ${e['price']}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 80,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: double.parse(
                                                      "${e['rating']}"),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 14,
                                                  ignoreGestures: true,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amberAccent,
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                                Text(
                                                  "(${e['ratingcount']})",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "${e['faceprice']}",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width / 120,
                                                ),
                                                Text(
                                                  "(%${e['discount']} off)",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height / 50,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                  'detail_page',
                                                  arguments: e,
                                                );
                                                setState(() {});
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: height / 30,
                                                width: width / 4,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Text(
                                                  "VIEW",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 12,
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                e['isLike'] = !e['isLike'];
                                                favList.remove(e);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: height / 30,
                                                width: width / 8,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: (e['isLike'] == false)
                                                    ? Icon(
                                                        LineIcons.heart,
                                                        size: 16,
                                                      )
                                                    : Icon(
                                                        Icons.favorite,
                                                        color: Colors.red
                                                            .withOpacity(
                                                          0.5,
                                                        ),
                                                        size: 16,
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Visibility(
                visible: (isBag == true) ? true : false,
                child: SingleChildScrollView(
                  child: Column(
                    children: cartList
                        .map(
                          (e) => Container(
                            height: height / 4.5,
                            width: width / 0.9,
                            margin:
                                EdgeInsets.only(top: 30, left: 20, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage("${e['thumbnail']}"),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${e['name']}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "₹ ${e['price']}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height / 80,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        "${e['rating']}"),
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 14,
                                                    ignoreGestures: true,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amberAccent,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  ),
                                                  Text(
                                                    "(${e['ratingcount']})",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 9,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "${e['faceprice']}",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width / 120,
                                                  ),
                                                  Text(
                                                    "(%${e['discount']} off)",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: height / 50,
                                          ),
                                          SizedBox(
                                            height: height / 50,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartList.remove(e);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: height / 30,
                                                  width: width / 4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Remove",
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 12,
                                                      letterSpacing: 2,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  e['isLike'] = !e['isLike'];
                                                  (e['isLike'] != false)
                                                      ? favList.add(e)
                                                      : favList.remove(e);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: height / 30,
                                                  width: width / 8,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(20),
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: (e['isLike'] == false)
                                                      ? Icon(
                                                          LineIcons.heart,
                                                          size: 16,
                                                        )
                                                      : Icon(
                                                          Icons.favorite,
                                                          color: Colors.red
                                                              .withOpacity(
                                                            0.5,
                                                          ),
                                                          size: 16,
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 10,
              tabActiveBorder: Border.all(
                color: Colors.black,
              ),
              activeColor: Colors.black,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textSize: 20,
              tabBackgroundColor: Colors.grey[50]!,
              color: Colors.grey.shade700.withOpacity(0.8),
              haptic: true,
              tabs: [
                GButton(
                  onPressed: () {
                    isHome = true;
                    isFav = false;
                    isBag = false;
                    isProfile = false;
                    setState(() {});
                  },
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  onPressed: () {
                    isHome = false;
                    isFav = true;
                    isBag = false;
                    isProfile = false;
                    setState(() {});
                  },
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  onPressed: () {
                    isHome = false;
                    isFav = false;
                    isBag = true;
                    isProfile = false;
                    setState(() {});
                  },
                  icon: LineIcons.shoppingBag,
                  text: 'Bag',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
