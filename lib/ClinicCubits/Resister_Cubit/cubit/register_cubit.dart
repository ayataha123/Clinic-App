import 'package:bloc/bloc.dart';
import 'package:clinic_app/Helper/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../Helper/dio_helper.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit() : super(RegisterCubitInitial());

  void register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String gender,
      required String passwordConfirmation}) async {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: '/register',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'password': password,
        'password_confirmation': passwordConfirmation
      },
    ).then((value) {
      print(value.data['data']['token']);
      CacheHelper.saveData(key: "token", value: value.data['data']['token']);
      print(CacheHelper.getData(key: 'token'));
      emit(RegisterSucessState());
    }).catchError((onError) {
      if (onError is DioException) {
        print(onError.response);
      }
    });
  }
}
