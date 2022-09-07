import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class ProductImageCubit extends Cubit<String> {
  ProductImageCubit(super.initialState);

  getImage({required imageUrl}){
    emit(imageUrl);
  }

}
