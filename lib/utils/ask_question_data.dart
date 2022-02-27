import 'dart:convert';
import 'package:astrotak/models/categories.dart';
import 'package:http/http.dart' as http;

final List<CategoryModel> _apiCategories = [];

class FetchData {
  Future fetchCategories() async {
    final response = await http.get(Uri.parse(
        'https://staging-api.astrotak.com/api/question/category/all'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var responseJson = json.decode(response.body);
      List<dynamic> body = responseJson['data'];
      body.forEach((value) {
        print('$value\n');
        _apiCategories.add(CategoryModel(
            value['id'],
            value['name'],
            value['description'] != null ? value['description'] : "",
            value['price'],
            value['suggestions']));
      });
      print('helloo');

      // return responseJson['tokens'];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    // throw (response);
  }

  List<CategoryModel> getCategories() {
    return _apiCategories;
  }
}
