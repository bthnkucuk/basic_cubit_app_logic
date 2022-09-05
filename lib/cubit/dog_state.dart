part of 'dog_cubit.dart';

@immutable
abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final DogModel dog;

  DogLoaded(this.dog);
}

class DogError extends DogState {
  final String error;

  DogError(this.error);
}
