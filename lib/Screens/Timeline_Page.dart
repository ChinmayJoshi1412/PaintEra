import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintera/Color%20Constants.dart';
import 'package:timelines/timelines.dart';
class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  Map <String,String> info = {
    "Renaissance":
    """The Renaissance was a cultural and intellectual movement that began in Italy in the 14th century and spread throughout Europe until the 17th century. It is generally considered to be the period of great cultural and artistic rebirth that saw a renewed interest in the classical world and a shift towards humanism and rationalism.
Artists like Leonardo da Vinci, Michelangelo, and Raphael created works that were celebrated for their technical skill and emotional depth, and their influence can still be seen in art today.""",
    "Baroque":
    """The Baroque is a period in art and architecture that flourished in Europe from the  17th century to the mid-18th century. It is characterized by dramatic, grandiose, and highly ornamental design, as well as an emphasis on theatricality and emotional expression.
Baroque art was characterized by dynamic movement, rich colors, and a sense of drama and grandeur. Artists of this period often employed complex composition and lighting techniques to create a sense of depth and space. They also frequently depicted religious or mythological subjects in highly emotive and dramatic ways. """,
    "Romanticism":
    """Romanticism was a cultural and artistic movement that emerged in Europe and the United States in the late 18th century and reached its peak in the mid-19th century. It was characterized by a focus on individualism, emotional expression, and the celebration of nature and the imagination. 
Romanticism was characterized by a focus on nature and the sublime, as well as an interest in the emotional states of the individual. Artists of this period often sought to capture the beauty and power of nature in their works, and many were inspired by the landscapes and cultures of foreign lands.""",
    "Realism":
    """Realism is a cultural movement that emerged in the mid-19th century in Europe and North America. It is characterized by a focus on the everyday experiences of ordinary people and an emphasis on portraying the world in a realistic, objective way. 
    In art, Realism is marked by a focus on depicting the world as it is, without embellishment or idealization. Realist painters often portrayed ordinary people engaged in everyday activities, and their works were characterized by a keen attention to detail and a desire to capture the physical world in a precise and objective way.""",
    "Expressionism":
    """Expressionism is an artistic and cultural movement that emerged in Germany and Austria in the early 20th century. It is characterized by a focus on subjective experience, emotional expression, and a rejection of traditional representational styles.
In art, Expressionism is marked by the use of distorted shapes and colors to convey intense emotions and psychological states. Expressionist painters often used vivid, non-naturalistic colors and abstract, distorted shapes to convey subjective experiences and emotional states. Expressionist artists often depicted scenes of violence and suffering, as well as religious and mythological themes.""",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DotIndicator(
              size: 30,
              color:blue,
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            TimelineTile(
              oppositeContents: Padding(
                padding: const EdgeInsets.only(left: 40,right: 5),
                child: Text('14th century - 17th century',style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: green
                ),),
              ),
              contents: GestureDetector(
                onTap: (){
                  showDialog(context: context,builder: (context){
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: grey,
                    elevation: 20,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: green,width: 4)
                                ),
                                child: Image(image: AssetImage('assets/The_School_of_Athens.jpg'))
                            ),
                          ),
                          Text("Renaissance", style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: blue
                          )),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("${info['Renaissance']}",textAlign: TextAlign.justify,style: GoogleFonts.montserrat(),),
                          )
                        ],
                      ),
                    ),
                  );
                });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: green,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Renaissance',style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: grey
                    ),),
                  ),
                ),
              ),
              node: TimelineNode(
                indicator: OutlinedDotIndicator(
                  color: blue,
                  size: 30,
                ),
                startConnector: SolidLineConnector(color: blue,),
                endConnector: SolidLineConnector(color: blue,),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            TimelineTile(
              contents: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('17th century - mid 18th century',style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: green
                ),),
              ),
              oppositeContents: GestureDetector(
                onTap: (){
                  showDialog(context: context,builder: (context){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: grey,
                      elevation: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: green,width: 4)
                                  ),
                                  child: Image(image: AssetImage('assets/the-night-watch.jpg'))
                              ),
                            ),
                            Text("Baroque", style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blue
                            )),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("${info['Baroque']}",textAlign: TextAlign.justify,style: GoogleFonts.montserrat(),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: green,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Baroque',
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: grey
                    ),),
                  ),
                ),
              ),
              node: TimelineNode(
                indicator: OutlinedDotIndicator(
                  color: blue,
                  size: 30,
                ),
                startConnector: SolidLineConnector(color: blue,),
                endConnector: SolidLineConnector(color: blue,),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            TimelineTile(
              oppositeContents: Padding(
                padding: const EdgeInsets.only(left: 40,right: 10),
                child: Text('late 18th century - mid 19th century',style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: green
                ),),
              ),
              contents: GestureDetector(
                onTap: (){
                  showDialog(context: context,builder: (context){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: grey,
                      elevation: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: green,width: 4)
                                  ),
                                  child: Image(image: AssetImage('assets/The_Soul_of_the_Rose.jpg'))
                              ),
                            ),
                            Text("Romanticism", style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blue
                            )),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("${info['Romanticism']}",textAlign: TextAlign.justify,style: GoogleFonts.montserrat(),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: green,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Romanticism',style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: grey
                    ),),
                  ),
                ),
              ),
              node: TimelineNode(
                indicator: OutlinedDotIndicator(
                  color: blue,
                  size: 30,
                ),
                startConnector: SolidLineConnector(color: blue,),
                endConnector: SolidLineConnector(color: blue,),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            TimelineTile(
              contents: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('mid 19th century - late 19th century',style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: green
                ),),
              ),
              oppositeContents: GestureDetector(
                onTap: (){
                  showDialog(context: context,builder: (context){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: grey,
                      elevation: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: green,width: 4)
                                  ),
                                  child: Image(image: AssetImage('assets/The_Stonebreakers.jpg'))
                              ),
                            ),
                            Text("Realism", style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blue
                            )),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("${info['Realism']}",textAlign: TextAlign.justify,style: GoogleFonts.montserrat(),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: green,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Realism',style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: grey
                    ),),
                  ),
                ),
              ),
              node: TimelineNode(
                indicator: OutlinedDotIndicator(
                  color: blue,
                  size: 30,
                ),
                startConnector: SolidLineConnector(color: blue,),
                endConnector: SolidLineConnector(color: blue,),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            TimelineTile(
              oppositeContents: Padding(
                padding: const EdgeInsets.only(left: 35,right: 10),
                child: Text('early 20th century',style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: green
                ),),
              ),
              contents: GestureDetector(
                onTap: (){
                  showDialog(context: context,builder: (context){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: grey,
                      elevation: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: green,width: 4)
                                  ),
                                  child: Image(image: AssetImage('assets/scream.jpg'))
                              ),
                            ),
                            Text("Expressionism", style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blue
                            )),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text("${info['Expressionism']}",textAlign: TextAlign.justify,style: GoogleFonts.montserrat(),),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: green,
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Expressionism',style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: grey
                    ),),
                  ),
                ),
              ),
              node: TimelineNode(
                indicator: OutlinedDotIndicator(
                  color: blue,
                  size: 30,
                ),
                startConnector: SolidLineConnector(color: blue,),
                endConnector: SolidLineConnector(color: blue,),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SolidLineConnector(
                color: blue,
              ),
            ),
            DotIndicator(
              size: 30,
              color:blue,
            ),
          ],
        ),
      ),
    );
  }
}
