import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/data/repo/yapilacaklardoa_repo.dart';


class KayitSayfaCubit extends Cubit<void>{
  KayitSayfaCubit():super(0);

  var krepo=YapilacaklarDaoRepository();

  Future<void> kaydet(String yapilacak_ad) async{
    await krepo.kaydet(yapilacak_ad);
  }
}