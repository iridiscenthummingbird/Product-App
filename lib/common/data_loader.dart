class DataLoader<T> {
  final T data;
  final Future<T> updateFuture;

  DataLoader(
    this.data,
    this.updateFuture,
  );
}
