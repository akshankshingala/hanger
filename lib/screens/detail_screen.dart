import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/globle.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(
      viewportFraction: 0.9, // Adjust this value as needed
    );
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      "DETAIL",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5,
                      ),
                    ),
                    Stack(
                      alignment: Alignment(0.5, 1.8),
                      children: [
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {},
                          icon: Icon(
                            LineIcons.shoppingBag,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: height / 30,
                          width: width / 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${cartList.length}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 18,
              child: PageView.builder(
                controller: pageController,
                itemCount: data['img'].length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data['img'][index]),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.grey.shade700, width: 2),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700, width: 2),
                  color: Colors.grey.shade200.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Casual Shirts",
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${data['price']}",
                              style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'This enhanced stretch shirt provides maximum comfort and flexibility. Made with high-quality fabric, This shirt offers a tailored fit and modern design, perfect for any occasion.',
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade700.withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                data['isBuy'] = !data['isBuy'];
                                (data['isBuy'] != false)
                                    ? cartList.add(data)
                                    : cartList.remove(data);
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: height / 0.8,
                                width: width / 2,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                  color: Colors.grey.shade500.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade700,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  (data['isBuy'] != true)
                                      ? "Buy Now"
                                      : "Remove",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 20,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                data['isLike'] = !data['isLike'];
                                favList.add(data);
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: height / 0.8,
                                width: width / 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade500.withOpacity(0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade700,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                child: (data['isLike'] == false)
                                    ? Icon(LineIcons.heart)
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.red.withOpacity(
                                          0.5,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
