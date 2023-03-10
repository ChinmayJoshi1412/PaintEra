import 'dart:io';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:paintera/Color%20Constants.dart';
class classification_page extends StatefulWidget {
  const classification_page({Key? key}) : super(key: key);

  @override
  State<classification_page> createState() => _classification_pageState();
}

class _classification_pageState extends State<classification_page> {
  File? resized;
  File? pickedImage;
  bool isImageLoaded = false;
  List? results;
  String confidence = "";
  String name = "";
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
  getImageFromGallery() async{
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);
    if(tempStore!=null)
      {
        setState(() {
          pickedImage = File(tempStore.path);
          isImageLoaded = true;
        });
      }
  }

  applymodel(File file) async{
    var result = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(result);
    setState(() {
      results = result;
      String str = results![0]["label"];
      name = str.substring(2);
      print("$str");
      print("$name");
    });
  }

  loadmodel() async{
    var resultant = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt");
    print(resultant);
  }
  @override
  void initState() {
    super.initState();
    loadmodel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*Text("Era Classification", style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: blue
                  ))*/
                  SizedBox(height: 20,),
                  Container(
                    height: 350,
                    width: 350,
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: green,width: 4)
                      ),
                      child: isImageLoaded==true?Image(image: FileImage(File(pickedImage!.path))):
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Upload an image to classify',style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: green
                          )),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("""NOTE: The image classifier used only considers 5 eras, which may result in incorrect classification of paintings outside of these eras.When interpreting the results, we recommend verifying them with additional sources or experts in the field.""",style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: green
                            ),textAlign: TextAlign.justify,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("$name",style: GoogleFonts.montserrat(
                    color: blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  isImageLoaded==true?Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: green,
                      child: Container(
                        width: 350,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text("${info[name]}",style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: grey
                        ),
                        textAlign: TextAlign.justify,),
                      ),
                    ),
                  ):
                  Container(),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: yellow,
        onPressed: ()async{
          await getImageFromGallery();
          await applymodel(pickedImage!);
        },
        child: Icon(Icons.upload),
      ),

    );
  }
}
