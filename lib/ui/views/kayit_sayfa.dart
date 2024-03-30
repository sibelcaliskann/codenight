import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:untitled1/constant/renkler.dart';
import 'package:untitled1/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {

  var tfYapilacakAdi=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Yeni Görev",style: TextStyle(color: Constant.dark,)),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakAdi,decoration: const InputDecoration(hintText: "Görev"),),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfYapilacakAdi.text);
              }, child: const Text("Kaydet",style: TextStyle(fontSize: 20,color: Constant.yellow),))
            ],

          ),
        ),
      ),
    );
  }
}
