class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool loading;

  ApiResponse({this.data, this.error, this.loading = false});

  factory ApiResponse.loading() => ApiResponse<T>(loading: true);

  factory ApiResponse.completed(T data) => ApiResponse<T>(data: data);

  factory ApiResponse.error(String error) => ApiResponse<T>(error: error);
  @override
  String toString() {
    return 'ApiResponse(data: $data, error: $error, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponse<T> &&
        other.data == data &&
        other.error == error &&
        other.loading == loading;
  }

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ loading.hashCode;
}
