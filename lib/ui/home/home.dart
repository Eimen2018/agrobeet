import 'package:agro_beet/constants.dart';
import 'package:agro_beet/ui/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      viewModelBuilder: () => HomeModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text(
            "₹",
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: secondaryColor,
          elevation: 2.0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: (index) => model.changeCurrentIndex(index),
          iconSize: 25,
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedIconTheme: IconThemeData(color: selectedBottomNavBar),
          unselectedItemColor: Colors.white,
          selectedItemColor: selectedBottomNavBar,
          backgroundColor: primaryColor,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Reports", icon: Icon(Icons.paste)),
            BottomNavigationBarItem(
                label: "Farms", icon: Icon(Icons.directions_bike)),
            BottomNavigationBarItem(
                backgroundColor: selectedBottomNavBar,
                label: "More",
                icon: Icon(Icons.more_vert_rounded)),
          ],
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.5,
          titleSpacing: 30.2,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 50,
                height: 50,
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 5,
                      top: 10,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          title: Text("Farm Expenses"),
          backgroundColor: appbarColor,
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              color: homeInfoBackGroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\₹80,000",
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Total Income",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  VerticalDivider(
                    thickness: 0.7,
                    color: Colors.grey[400],
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\₹20,000",
                        style: TextStyle(
                            color: redColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Total Expenses",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expenses Type",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Amount",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(Icons.unfold_more_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.picture_as_pdf)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.53,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index % 2 != 0)
                      i = 1;
                    else
                      i = 0;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(0, 5),
                              blurRadius: 7,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 5,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: i == 0 ? Colors.red : secondaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                i == 0 ? "Labours" : "Machinary",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "22 Oct 2020",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                i == 0 ? "Total Expenses" : "Total Income",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "\₹20,000",
                                style: TextStyle(
                                    color: i == 0 ? Colors.red : secondaryColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.more_vert_rounded,
                                size: 30,
                                color: Colors.grey,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
