class Result {
  final bool success;
  final String? errorMessage;

  Result({
    required this.success,
    this.errorMessage,
  });

  factory Result.success() => Result(success: true);

  factory Result.failure(String message) => Result(success: false, errorMessage: message);
}
