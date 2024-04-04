import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/constants.dart';
import 'package:rmo_food/src/pages/services/cafe/data/model/cafe.dart';
import 'package:rmo_food/src/pages/services/cafe/data/repo/cafe_repo.dart';

part 'cafe_state.dart';

class CafeCubit extends Cubit<CafeState> {
  final CafeRepositoryImpl _cafeRepositoryImpl = CafeRepositoryImpl();
  CafeCubit() : super(CafeInitial());

  void fetchCafeList() async {
    emit(CafeListFetching());
    try {
      CafeModel? cafeModel = await _cafeRepositoryImpl.fetchCafeList();
      if (cafeModel != null) {
        emit(CafeListFetched(cafeModel: cafeModel));
        return;
      }
      throw RMOConst.defaultError;
    } on String catch (e) {
      emit(CafeListFetchError(e.toString()));
    } catch (e) {
      emit(CafeListFetchError(RMOConst.defaultError));
    }
  }
}
