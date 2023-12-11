import 'package:bloc/bloc.dart';
import 'package:clinic_app/Helper/cache_helper.dart';
import 'package:clinic_app/Helper/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



 void login({required String email,required String password})
 {
    emit(LoginLoadingState());
    DioHelper.postData(url: '/login', data: {
     'email':email,
     'password':password,
    }).then((value) {
     print(value.data['data']['token']);
      print(value.data['data']["username"]);
     CacheHelper.saveData(key: 'token', value: value.data['data']['token']);
     CacheHelper.saveData(key: "username", value: value.data['data']["username"]);
     print(CacheHelper.getData(key: 'token'));
      print(CacheHelper.getData(key: "username"));
     emit(LoginSucessState());
    }).catchError((onError){
    if (onError is DioException) {
        print(onError.response);
      }
    });
 }
}
