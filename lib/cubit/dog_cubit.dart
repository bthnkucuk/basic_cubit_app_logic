import 'package:bloc/bloc.dart';
import 'package:medium/dog_model.dart';
import 'package:medium/dog_services.dart';
import 'package:meta/meta.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  DogCubit() : super(DogInitial()) {
    loadDog();
  }

  final _services = DogServices();

  void loadDog() async {
    try {
      emit(DogLoading());
      final response = await _services.fetchDog();
      emit(DogLoaded(response));
    } catch (e) {
      emit(DogError(e.toString()));
    }
  }
}
