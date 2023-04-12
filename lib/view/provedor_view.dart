import 'package:flutter/material.dart';
import 'package:refaccionaria/models/models.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class ProvedorView extends StatelessWidget {
  final List<ProvedoreModel> listaProvedores;

  const ProvedorView({Key? key, required this.listaProvedores})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    const Text(
      'Lista de proveedores',
      style: TextStyle(fontSize: 17),
    ),
    ...listaProvedores.map((provedor) => CustomCardDetalle(
        eliminar: () {},
        height: 200,
        widget: Column(
          children: [
            RowCustom(text1: 'Nombre', text2: provedor.nombre),
            RowCustom(text1: 'Tipo', text2: provedor.tipoProvedor),
          ],
        )))
      ],
    );
  }
}
