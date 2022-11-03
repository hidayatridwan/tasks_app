import 'package:tasks_app/blocs/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial(switchValue: false)) {
    on<ThemeLightEvent>((event, emit) {
      emit(const ThemeState(switchValue: true));
    });
    on<ThemeDarkEvent>((event, emit) {
      emit(const ThemeState(switchValue: false));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
