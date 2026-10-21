enum ImagePickerType {
  camera(title: 'Camera'),
  gallery(title: 'Gallery'),
  delete(title: 'Delete');

  final String title;

  const new({required this.title});

  static const sources = [camera, gallery];
}
