class TutorialListPages {
  String imagePath;
  String title;
  String subtitle;

  TutorialListPages(
    this.imagePath,
    this.title,
    this.subtitle,
  );
}

var listPages = [
  TutorialListPages(
      'assets/images/tutorial/cam.png',
      'Toma una foto de tu documento',
      'Mediante la aplicación podrás escanear el documento fácilmente'),
  TutorialListPages(
      'assets/images/tutorial/printer.png',
      'Ya estás listo empezar',
      'Ahora puedes comenzar a convertir tu texto a braille'),
];
