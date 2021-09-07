import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slurp/bar_repository.dart';

import 'bar.dart';

class BarCubit extends Cubit<List<Bar>> {
  BarCubit() : super(<Bar>[]);

  void load() {
    BarRepository.getPlaces().listen((bar) => emit(state..add(bar)));
  }

  void toggleFavorite(Bar bar) {
    Bar updatedBar = bar.copyWith(isFavorite: !bar.isFavorite);
    int index = state.indexOf(bar);

    state[index] = updatedBar;

    emit(List.from(state));
  }
}
