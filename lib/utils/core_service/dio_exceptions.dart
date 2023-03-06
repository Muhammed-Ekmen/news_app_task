class FetchDataException implements Exception {
  String showMessage = "-*Fetch Data*-";
}

class BadRequestException implements Exception {
  String showMessage = "-*Bad Request*-";
}

class SocketException implements Exception {
  String showMessage = "-*Internet Problem*-";
}

class ServerException implements Exception {
  String showMessage = "-*Server Error*-";
}
