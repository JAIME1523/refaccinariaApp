import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class EmpleadoView extends StatelessWidget {
  final List<EmpleadoModel> listaEmpleado;
  const EmpleadoView({Key? key, required this.listaEmpleado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Lista de empleados',
          style: TextStyle(fontSize: 17),
        ),
        ...listaEmpleado.map((empleado) => CustomCardDetalle(
          eliminar: (){},
          widget: Column(
            children: [
                RowCustom(text1: 'Nombre', text2: empleado.nombre),
                RowCustom(text1: 'Identificador', text2: empleado.id.toString()),
                RowCustom(text1: 'Sexo', text2: empleado.sexo),
                RowCustom(text1: 'NSS', text2: empleado.nss),
                RowCustom(text1: 'Sueldo', text2: empleado.sueldo.toString()),
                RowCustom(text1: 'días de vacaciones', text2: empleado.diaVacaciones.toString()),
            ],
          )))
      ],
    );
  }
}
