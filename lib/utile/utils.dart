class Utils {
  static String url = "http://10.0.2.2:8080";
  //static String url = "https://africultureserver.herokuapp.com";
  //"http://localhost:8080";
  static Uri lienUrl(String path) {
    return Uri.http(
      'localhost:8080',
      '/$path',
    );
  }
}
