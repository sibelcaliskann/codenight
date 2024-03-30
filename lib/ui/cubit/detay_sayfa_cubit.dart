import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data/repo/yapilacaklardoa_repo.dart';

class DetaySayfaCubit extends Cubit<void>{
  DetaySayfaCubit():super(0);

  var krepo=YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id,String yapilacak_ad) async{
    await krepo.guncelle(yapilacak_id,yapilacak_ad);
  }
}