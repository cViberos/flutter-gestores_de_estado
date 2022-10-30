class Usuario {
  final String nombre;
  int edad;
  List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    this.profesiones,
  });

  /// Este es un metodo que regresa un usuario
  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
