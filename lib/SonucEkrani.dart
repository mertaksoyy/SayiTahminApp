import 'package:flutter/material.dart';
import 'package:sayitahmin_app/main.dart';

class SonucEkrani extends StatefulWidget {
   SonucEkrani({required this.sonuc});
   bool sonuc;

   @override
  State<SonucEkrani> createState() => _SonucEkraniState();


}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuc Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("/Users/mertaksoy/AndroidStudioProjects/sayitahmin_app/resimler/mutlu_yuz.png") : Image.asset("/Users/mertaksoy/AndroidStudioProjects/sayitahmin_app/resimler/uzgun_yuz.jpg"),

            Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz", style: TextStyle(color: Colors.black45, fontSize: 30.0),),


            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                child: Text("TEKRAR DENE",style: TextStyle(fontSize:20.0, color: Colors.white),),
                style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
}
