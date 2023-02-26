import 'package:flutter/material.dart';
import 'package:sayitahmin_app/TahminEkrani.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),

    );
  }
}



class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key,});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}


class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Tahmin Oyunu", style: TextStyle(color: Colors.black45, fontSize: 30.0),),

            Image.asset("/Users/mertaksoy/AndroidStudioProjects/sayitahmin_app/resimler/zar_resmi.png"),


            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                child: Text("OYUNA BAŞLA",style: TextStyle(fontSize:20.0, color: Colors.red),),
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
