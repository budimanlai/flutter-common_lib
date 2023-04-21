part of 'api.dart';

class ApiClient {
  static late String _apiKey;
  static late String _authKey;
  static late String _token = "";
  static late String _baseURL;
  static late String _issuer;

  static setBaseUrl(String url) {
    _baseURL = url;
  }

  static setIssuerBy(String issuer) {
    _issuer = issuer;
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
    final timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).floor();

    Map<String, dynamic> payload = {
      "sub": _apiKey,
      "iat": timestamp,
      "iss": _issuer,
      "ses": _token
    };

    final sKey = _apiKey + "." + timestamp.toString() + "." + _token + "." + _authKey;
    final payloadBase64 = base64Url.encode(utf8.encode(jsonEncode(payload))).replaceAll("=", "");
    final hash256 = sha256.convert(utf8.encode(sKey));
    final hmacSha256 = Hmac(sha256, hash256.bytes);
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
    print("Request: " + params.toString());

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
      
      Map<String, dynamic> result = json.decode(responseString);
      var resp = ApiResponse.fromJson(result);
      if (response.statusCode == 200) {
        if (!resp.success) {
          throw Exception(resp.message);
        }

        print("response: $responseString");

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
