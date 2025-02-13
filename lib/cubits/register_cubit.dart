import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/cubits/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> registerUser({required String email,required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    }
    on FirebaseAuthException catch(ex)
    {
      if(ex.code=='weak-password')
      {
        emit(RegisterFailure(errorMessage: 'weak-password'));
      }
      else if(ex.code=='email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email-already-in-use'));
      }
    }
    catch(ex)
    {
      emit(RegisterFailure(errorMessage: 'There  was an error please try again'));
    }
  }
}