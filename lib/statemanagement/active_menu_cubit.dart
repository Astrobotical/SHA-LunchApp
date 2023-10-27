import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/active_menu_state.dart';

class ActiveMenuCubit extends Cubit<ActiveMenuState> {
  ActiveMenuCubit() : super(ActiveMenuInitial());
}
