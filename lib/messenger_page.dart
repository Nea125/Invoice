import 'dart:convert';
import 'dart:io';
import 'package:ceatechart/recoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_voice_processor/flutter_voice_processor.dart';
class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});
  @override
  State<MessengerPage> createState() => _MessengerPageState();
}
class _MessengerPageState extends State<MessengerPage> {
  
  final messegerController = TextEditingController();
  // ignore: unused_field
  VoiceProcessor? _voiceProcessor = VoiceProcessor.instance;
  XFile? filepicker;
  File? fileimage;
  ImagePicker imagePicker = ImagePicker();
  String? pathImage;
  File? file;
  String? imageName;
  File? fileCompress;
  bool check = false;
  final messTextController = TextEditingController();
  
  // compress Image
   Future<File> compressImage(File file)async{
    File fileCompress = await FlutterNativeImage.compressImage(file.path,quality: 70);
    debugPrint('Before compress size =${file.lengthSync()}');
    debugPrint('After compress size=${fileCompress.lengthSync()}');
    return fileCompress;
  }
  Future<void> getImage(String type)async{
   filepicker = await imagePicker.pickImage(source: type=="Camera" ? ImageSource.camera : ImageSource.gallery);
  
   if(filepicker!=null){
    setState(() {
      fileimage = File(filepicker!.path);
      List<int> byte = fileimage!.readAsBytesSync();
      pathImage = base64Encode(byte);
     
      compressImage(fileimage!);

    });
   }
  }

  // upload image aftter compress
 Future<void> uploadImage({required String type})async{
    var xFile = await imagePicker.pickImage(source: type=='Camera'? ImageSource.camera: ImageSource.gallery);
    if(xFile==null) return;
     
        file = File(xFile.path);
        imageName=xFile.name;
        
        // call method compressimage
         fileCompress = await compressImage(file!);
       
        // Upload to firebase storage
       
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: const Color.fromARGB(
                255, 255, 64, 236) // Change the color of the icon here
            ),
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/logan.jpeg'),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cambodia",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Power By Messenger",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.phone,
              color: const Color.fromARGB(255, 255, 64, 236)
                  .withOpacity(0.9),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(
              Icons.error,
              color: const Color.fromARGB(255, 255, 64, 236).withOpacity(0.9),
            ),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: pathImage==null? BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.grey
                )
               ) : BoxDecoration(
                //color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  10
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(base64Decode(pathImage!)),
                )
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                      getImage("Camera");
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.blue,)
                  ),
             GestureDetector(
                onTap: (){
                      getImage("Gallery");
                },
                child: GestureDetector(
                  child: const Icon(
                    Icons.image,
                    color: Colors.blue,),
                )
                  ),
              GestureDetector(
                onTap: (){
                      getImage("Camera");
                },
                child: GestureDetector(
                  onTap: ()
                  {
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>const Recorder()));
                  },
                  child: const Icon(
                    Icons.settings_voice,
                    color: Colors.blue,),
                )
                  ),
              SizedBox(
                  width: 200,
                  height: 40,
                  child: TextFormField(
                             controller: messegerController,
                             validator: (value) {
                               if (messegerController.text.isNotEmpty) {
                                 setState(() {
                                   check = !check; // Set check to true if the text is empty
                                 });
                                 return 'Please enter a message';
                               }
                               return null; // Return null if validation succeeds
                             },
                             decoration: InputDecoration(
                               
                                 filled: true,
                                 hintText: "Message",
                                 fillColor: Colors.white,
                                 suffixIcon: const Icon(
                                   Icons.mood,
                                   color: Colors.blue,
                                 ),
                                 border: OutlineInputBorder(
                                   borderSide: BorderSide.none,
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 contentPadding: const EdgeInsets.only(top: 0, left: 20),
                               ),
                                         )),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0),
                      color: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                           
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child:  CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: check==true? InkWell(
                    onTap: (){
                      print("Message : ${messegerController.text}");
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  ):
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
