import 'package:dio/dio.dart';
import 'package:medium/dog_model.dart';

class DogServices {
  Future<DogModel> fetchDog() async {
    final uri = Uri.parse("https://dog.ceo/api/breeds/image/random");

    final response = await Dio().getUri(uri);

    return DogModel.fromJson(response.data);
  }
}
