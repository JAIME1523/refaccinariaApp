import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/models/models.dart';
import 'package:refaccionaria/page/page.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class ProvedorView extends StatelessWidget {
  const ProvedorView({
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
              'Lista de proveedores',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            if (refacProvider.spareparts!.listaEmpleado!.isEmpty)
              const Text('No tienen ningun dato'),
            ...refacProvider.spareparts!.listaProvedores!
                .map((provedor) => CustomCardDetalle(

                    mostrar: false,
                    eliminar: () {},
                    height: 130,
                    widget: Column(
                      children: [
                        RowCustom(text1: 'Nombre', text2: provedor.nombre),
                        RowCustom(text1: 'Tipo', text2: provedor.tipoProvedor),
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
                            builder: (_) => CreateProviderPage(
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
