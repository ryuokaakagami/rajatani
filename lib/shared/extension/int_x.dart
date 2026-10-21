extension IntX on int {
  String get toCompact {
    if (this < 1000) return toString();

    if (this < 1000000) {
      return '${_formatValue(this / 1000)}K';
    }

    if (this < 1000000000) {
      return '${_formatValue(this / 1000000)}M';
    }

    return '${_formatValue(this / 1000000000)}B';
  }

  String _formatValue(double value) {
    final truncated = (value * 10).truncateToDouble() / 10;
    return truncated.toString().replaceAll(RegExp(r'\.0$'), '');
  }
}
