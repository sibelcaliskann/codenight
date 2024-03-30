import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:untitled1/constant/renkler.dart';
import 'package:untitled1/data/entity/yapilacaklar.dart';
import 'package:untitled1/ui/cubit/anasayfa_cubit.dart';
import 'package:untitled1/ui/views/detay_sayfa.dart';
import 'package:untitled1/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.grey,
      appBar: AppBar(backgroundColor: Constant.darkWhite,
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ):const Text("Görevler",style: TextStyle(color: Constant.dark),),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu=false;
            });
            context.read<AnasayfaCubit>().yapilacaklariYukle();
          }, icon: const Icon(Icons.clear,color: Constant.yellow,)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu=true;
            });
          }, icon: const Icon(Icons.search,color: Constant.yellow,),)
        ],

      ),
      body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
        builder: (context,yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty)
          {
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context,indeks){
                var yapilacak=yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(yapilacak: yapilacak)))
                        .then((value) {
                      context.read<AnasayfaCubit>().yapilacaklariYukle();
                    });
                    print("${yapilacak.yapilacak_adi}");
                  },
                  child: Card(
                    child: SizedBox(height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(yapilacak.yapilacak_adi,style: TextStyle(fontSize: 20, color: Constant.gray),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${yapilacak.yapilacak_adi} Silinsin mi? "),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id);
                                    },
                                  ),
                                )
                            );
                          }, icon: const Icon(Icons.clear,color: Constant.yellow,),)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else
          {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const KayitSayfa()))
                .then((value) {
              context.read<AnasayfaCubit>().yapilacaklariYukle();
            });
          }, child: const Text("+",style: TextStyle(fontSize: 20,color: Constant.gray),)),
    );
  }
}