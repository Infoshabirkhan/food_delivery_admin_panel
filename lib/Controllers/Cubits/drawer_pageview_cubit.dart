import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class DrawerPageviewCubit extends Cubit<int> {
  DrawerPageviewCubit(super.initialState);

  getIndex({required index}){
    emit(index);
  }
}
