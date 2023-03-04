class FetchDataException implements Exception {
  String showMessage = "-*Fetch Data Exception*-";
}

class BadRequestException implements Exception {
  String showMessage = "-*Bad Request Exception*-";
}

enum ExceptionMessages { fetchData, badRequest }
