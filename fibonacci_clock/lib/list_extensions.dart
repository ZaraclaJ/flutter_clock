extension ListExtensions on List<int> {
  List<int> operator *(int other) {
    return this.map((i) => i * other).toList();
  }

  List<int> operator &(List<int> other) {
    final result = this.toList();
    for (var i = 0; i < this.length; i++) {
      result[i] += other[i];
    }
    return result;
  }
}
