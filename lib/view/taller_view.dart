import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class TallerView extends StatelessWidget {
  final List<TallerModel> talleres;
  const TallerView({Key? key, required this.talleres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Column(
      children: [
        const Text(
          'Lista de talleres',
          style: TextStyle(fontSize: 17),
        ),
        const SizedBox(
          height: 20,
        ),
        ...talleres.map((taller) => CustomCardDetalle(
              eliminar: () {},
              onTap: () {},
              text: 'Refacciones',
              widget: Column(
        children: [
          RowCustom(text1: 'Nombre', text2: taller.nombre),
          RowCustom(
              text1: 'razón social', text2: taller.razonSocial),
          RowCustom(text1: 'domicilio', text2: taller.domicilio),
          RowCustom(text1: 'tipo', text2: taller.tipo),
          RowCustom(
              text1: 'Monto Ventas',
              text2: taller.montoVnetas.toString()),
          RowCustom(
              text1: 'Encargado', text2: taller.encargado!.nombre),
        ],
              ),
            ))
      ],
    ),
    Positioned(
      top: 10,
      right: 10,
      child: Column(
        children: [
          const Text('Aagregar taller'),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
    ),
      ],
    );
  }
}
