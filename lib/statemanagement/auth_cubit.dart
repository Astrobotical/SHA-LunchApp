import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
}
