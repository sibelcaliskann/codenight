import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/constant/renkler.dart';
import 'package:untitled1/data/entity/yapilacaklar.dart';
import 'package:untitled1/ui/cubit/detay_sayfa_cubit.dart';


class DetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacak;
  DetaySayfa({required this.yapilacak});


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}




class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacakAdi=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var yapilacak=widget.yapilacak;
    tfYapilacakAdi.text=yapilacak.yapilacak_adi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Detay",style: TextStyle(color: Constant.dark)),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakAdi,decoration:  InputDecoration.collapsed(hintText: "Görev"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.yapilacak.yapilacak_id, tfYapilacakAdi.text);
              }, child: const Text("Güncelle",style: TextStyle(fontSize: 20,color: Constant.yellow)))
            ],
          ),
        ),
      ),
    );
  }
}