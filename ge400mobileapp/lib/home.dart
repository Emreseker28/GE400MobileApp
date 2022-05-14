import 'package:flutter/material.dart';
import 'package:ge400mobileapp/globals.dart';
import 'package:expandable/expandable.dart';
import 'package:ge400mobileapp/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.exit_to_app)),
            )
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("KHAS Student Portal"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(

            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                      //başlık kısmı
                      header: Text(
                        "MA, PhD and Postdoctoral Fellowships in the ERC-funded project Staging National Abjection: Theatre and Politics in Turkey and Its Diasporas",
                        style: TextStyle(fontSize: 23,),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                    //başlık kısmı
                      header: Text(
                        "2021-2022 External Transfer Quotas for Foreign Students Studying in Ukraine",
                        style: TextStyle(fontSize: 23),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "Applications will be received in person from the Directorate of Student Affairs within the framework of the undergraduate transfer rules determined by the Higher Education Council between 11-15 April 2022.",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                    //başlık kısmı
                      header: Text(
                        "For Associate Degree Students!",
                        style: TextStyle(fontSize: 23),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "Associate degree students, who have been dismissed due to the maximum duration due to the fact that they cannot be given the right to take the exam for the courses that have never been taken/continuation requirements have not been met, in accordance with the letters of the Council of Higher Education dated October 1, 2021, numbered -73154 and dated October 14, 2021, numbered -76443, if they apply to the Vocational School Directorate, they will be able to benefit from two additional examination rights until the end of the working day on Monday, January 31, 2022.",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                    //başlık kısmı
                      header: Text(
                        "About Students Who Exceeded Maximum Time Limit",
                        style: TextStyle(fontSize: 23),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "Right to take two more additional exam is provided by the Article 44/c/(3) of Higher Education Law numbered 2547. Due to the related Law and Decision of Kadir Has University Senate dated 09.01.2019 and numbered 2019/01 , students who exceeded maximum time limit may use their additional exam right  by sending an email to justice@khas.edu.tr  until the end of office hours on 31.01.2022.",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                    //başlık kısmı
                      header: Text(
                        "Active Scholarship Student Applications",
                        style: TextStyle(fontSize: 23),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "Active Scholarship Student Applications will be received on Mykhas Portal between 13th-24th September. Applications will be evaluated by taking into account the demands and needs of the Academic / Administrative Units. The application results will be announced on the MyKhas Portal Notifications screen of each student in the second week of October."
                                "The students whose applications cannot be evaluated with priority will be kept in the application pool and reviewed in case of new demands or needs of the units during the process."
                                "If you have any questions about the process, you can contact Asli Bebek asli.bebek@khas.edu.tr / 1176(extension).",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[300],
                      border: Border.all(color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpandablePanel(
                      //başlık kısmı
                      header: Text(
                        "2021 Summer Education Open Courses",
                        style: TextStyle(fontSize: 23),
                      ),
                      collapsed: Text(""),
                      expanded: Column(
                        children: [
                          Divider(
                            color: Colors.black,
                          ),
                          //detay kısmı
                          Text(
                            "Right to take two more additional exam is provided by the Article 44/c/(3) of Higher Education Law numbered 2547. Due to the related Law and Decision of Kadir Has University Senate dated 09.01.2019 and numbered 2019/01 , students who exceeded maximum time limit may use their additional exam right  by sending an email to justice@khas.edu.tr  until the end of office hours on 31.01.2022.",
                            style: TextStyle(fontSize: 20),
                            softWrap: true,
                          ),
                        ],
                      )),
                ),
              )
            ]),
          ),
        ));
  }
}
