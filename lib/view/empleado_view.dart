import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/page/page.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class EmpleadoView extends StatelessWidget {
  const EmpleadoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refacProvider = Provider.of<RefacionariaProvider>(context);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Lista de empleados',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            if (refacProvider.spareparts!.listaEmpleado!.isEmpty)
              const Text('No tienen ningun dato'),
            ...refacProvider.spareparts!.listaEmpleado!
                .map((empleado) => CustomCardDetalle(
                    mostrar: false,
                    eliminar: () {
                      refacProvider.deleteEmpleado(empleado);
                    },
                    widget: Column(
                      children: [
                        RowCustom(text1: 'Nombre', text2: empleado.nombre),
                        RowCustom(
                            text1: 'Identificador',
                            text2: empleado.id.toString()),
                        RowCustom(text1: 'Sexo', text2: empleado.sexo),
                        RowCustom(text1: 'NSS', text2: empleado.nss),
                        RowCustom(
                            text1: 'Sueldo', text2: empleado.sueldo.toString()),
                        RowCustom(
                            text1: 'días de vacaciones',
                            text2: empleado.diaVacaciones.toString()),
                      ],
                    )))
          ],
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Column(
            children: [
              const Text('Aagregar '),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CreateEmployeePage(
                                  providerRefac: refacProvider,
                                )));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ],
    );
  }
}
