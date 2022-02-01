part of 'api.dart';

class ApiClient {
  static late String _apiKey;
  static late String _authKey;
  static late String _token = "";
  static late String _baseURL;

  static setBaseUrl(String url) {
    _baseURL = url;
  }

  static setApiKey(String key, String auth) {
    _apiKey = key;
    _authKey = auth;
  }

  static setToken(String token) {
    _token = token;
  }

  String _generateJWT(String body) {
    final header = "eyJhbGciOiAiSFMyNTYiLCJ0eXAiOiAiSldUIn0";
    final timestamp = 1643733515; //DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();

/*
payload = {
    iat: iat,
    iss: sKey,
    sid: sid,
};
*/
    Map<String, dynamic> payload = {
      "iat": timestamp,
      "iss": _apiKey,
      "sid": _token
    };

    final sKey = _token.isEmpty
        ? _authKey + timestamp.toString()
        : _authKey + timestamp.toString() + _token;
    final payloadBase64 = base64Url.encode(utf8.encode(jsonEncode(payload))).replaceAll("=", "");
    final hash256 = sha256.convert(utf8.encode(sKey)).toString();
    final hash2564 = base64Url.encode(utf8.encode(hash256)).toString();
    final hmacSha256 = Hmac(sha256, utf8.encode(hash2564));
    final signature =
        hmacSha256.convert(utf8.encode(header + "." + payloadBase64));
    final sign64 =
        base64Url.encode(signature.bytes).toString().replaceAll("=", "");

    return "$header.$payloadBase64.$sign64";
  }

  Future<ApiResponse> getRequest(String endpoint, String method,
      [Map<String, dynamic>? params]) async {
    var apiURL = Uri.parse(_baseURL + endpoint);
    var client = HttpClient();

    print("URL: " + apiURL.toString());
    print("Params: " + params.toString());

    return client.openUrl(method, apiURL).then((HttpClientRequest request) {
      final jsonBody = jsonEncode(params);
      final jwt = _generateJWT(jsonBody);

      request.headers.set("Content-Type", "application/json");
      request.headers
          .set("Authorization", "Bearer " + jwt);

      request.add(utf8.encode(jsonBody));

      return request.close();
    }).then((response) async {
      var responseString = await utf8.decoder.bind(response).join();
      log(responseString);
      Map<String, dynamic> result = json.decode(responseString);
      var resp = ApiResponse.fromJson(result);
      if (response.statusCode == 200) {
        if (!resp.success) {
          throw Exception(resp.message);
        }
        return resp;
      } else {
        print("Error: " + resp.message);
        throw Exception(resp.message);
      }
    }).catchError((e) {
      if (e is SocketException) {
        var msg = e.message;
        if (e.osError != null) {
          msg = e.osError!.message;
        }
        throw Exception(msg);
      } else if (e is JsonUnsupportedObjectError) {
        throw Exception(e.toString());
      } else {
        throw e;
      }
    });
  }

  Future<ApiResponse> post(String endpoint, Map<String, dynamic> params) async {
    return getRequest(endpoint, "POST", params);
  }
}
