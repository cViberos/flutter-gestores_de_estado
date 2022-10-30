class Usuario {
  final String nombre;
  int edad;
  List<String>? profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    this.profesiones,
  }) : assert(nombre != null);

  /**
   * assert : Lo que hace es forzar un error, si la condición definida no se 
   * cumple entonces lanza un error, se puede agregar tantas como deseemos, ej:
   *  : assert(nombre != null),
   *  : assert(nombre != 'gato'),
   *  : assert(nombre != 'n'),
   */
}
