class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });

  /*
  COPIA DE INSTANCIAS
   Metodo que se usa para cambiar el valor de cualquier propiedad de un modelo
   Recibe el valor de cada una de forma opcional.
   Retorna una nueva instancia con el valor nuevo.
   Cuando creamos una nueva instancia, estas pueden recibir valores nulos, por lo
   tanto le asignamos el valor que ya esta en la instancia anterior
  */
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
