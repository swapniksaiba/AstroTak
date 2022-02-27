import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchApiData {
  List<String> _categories = ['Love', 'Career', 'Money', 'Health']; // Option 2
  String _selectedCategory = 'Love';

  List<String> _suggestedQuestion = [
    'When is the right for me to introduce my boyfriend / girlfriend?',
    'Doubtful about taking my relationship to next level?',
    'How will I meet my potential life partner',
    'Is my Wife/Husband faithful?',
    'Will I meet my true love?',
    'When will I get in relationship?'
  ];

  Future<Map<String, dynamic>> fetchSwapTokensList(int platformId) async {
    final response = await http
        .get(Uri.parse('https://api.1inch.exchange/v4.0/$platformId/tokens'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var responseJson = json.decode(response.body);
      Map<String, dynamic> body =
          responseJson['tokens'] as Map<String, dynamic>;
      body.forEach((key, value) {
        print('$value\n');
      });
      // fromToken = swapTokensList[0];
      // toToken = swapTokensList[1];
      // print(responseJson);
      print('helloo');

      return responseJson['tokens'];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    // throw (response);
  }
}
