import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin_app/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {


  var tfTahmin= TextEditingController();
  int randomSayi = 0;
  int kalanHak = 5;
  String yardim ="";

  //Sayfa açıldıgı anda random sayi üretilecek
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomSayi = Random().nextInt(101); //0-100 arası random deger üretir
    print("Rastgele Sayi = $randomSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Tahmin Hakkı : $kalanHak", style: TextStyle(color: Colors.redAccent, fontSize: 30.0),),
            Text("Yardım:$yardim", style: TextStyle(color: Colors.black38, fontSize: 25.0),),

             Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType:TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Tahmin:",
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
                ),
              ),
            ),

            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                child: const Text("Tahminde Bulun",style: TextStyle(fontSize:20.0,color: Colors.deepPurpleAccent),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                onPressed: (){

                  int tahmin = int.parse(tfTahmin.text);

                  setState(() {
                    kalanHak -=1;
                  });

                  if(tahmin  == randomSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true,)));
                    return;
                  }
                  if(tahmin < randomSayi){
                    setState(() {
                      yardim = "Tahminini Artır";
                    });
                  }
                  if (tahmin > randomSayi){
                    setState(() {
                      yardim = "Tahminii Azalt";
                    });
                  }

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc:false,)));
                  }

                  tfTahmin.text = "" ;


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
