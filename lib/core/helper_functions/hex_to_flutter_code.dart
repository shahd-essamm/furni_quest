String hexToFlutterColor(String hex) {
  hex = hex.replaceAll('#', '');
  return '0xFF$hex';
}