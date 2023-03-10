import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintera/Screens/Classification_Page.dart';
import 'package:paintera/Screens/Timeline_Page.dart';
import 'package:paintera/Color Constants.dart';
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  PageController pageController = PageController(initialPage: 0);
  int navindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: /*Text('PaintEra',style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darkBlueColor
                )),*/
                RichText(
                  text: TextSpan(
                    text: "",
                    children: <TextSpan>[
                      /*TextSpan(
                          text: "Paint",
                          style:GoogleFonts.marmelad(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1a2c54)
                          ),),*/
                      TextSpan(
                        text: "Paint",
                        style:GoogleFonts.marmelad(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: blue
                        ),),
                      TextSpan(
                        text: "Era",
                          style: GoogleFonts.marmelad(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: yellow
                          )
                      )
                    ]
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: (){
                      navindex = 0;
                      pageController.jumpToPage(0);
                    }, child: Text("Timeline",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: navindex==0?green:Colors.grey[400]
                      ),)),
                    TextButton(onPressed: (){
                      navindex=1;
                      pageController.jumpToPage(1);
                    }, child: Text("Classify",
                      style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: navindex==1?green:Colors.grey[400]
                      ) ,)),
                    ]
                )
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(
                          thickness: 6,
                          indent: 0,
                          color: navindex==0?green:Colors.grey[400],
                        )),
                        Expanded(child: Divider(
                          thickness: 5,
                          color: navindex==1?green:Colors.grey[400],
                        )),
                      ],
                    ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.78,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (val){
                        setState(() {
                          navindex = val;
                        });
                      },
                      children: [
                        TimeLine(),
                        classification_page()
                      ],
                    ),
                  )
                ],
              )
                  ],
                ),
              ),
          ),
        );
  }
}
