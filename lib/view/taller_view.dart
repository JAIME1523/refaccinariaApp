import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/page/page.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/widget.dart';

class TallerView extends StatelessWidget {
  // final List<TallerModel> talleres;
  const TallerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refacProvider = Provider.of<RefacionariaProvider>(context);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Lista de talleres',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            if (refacProvider.spareparts!.listaTalleres!.isEmpty)
              const Text('No tienen ningun dato'),
            ...refacProvider.spareparts!.listaTalleres!
                .map((taller) => CustomCardDetalle(
                      eliminar: () {
                        refacProvider.deleteTaller(taller);
                      },
                      mostrar: false,
                      onTap: () {},
                      text: 'Refacciones',
                      widget: Column(
                        children: [
                          RowCustom(text1: 'Nombre', text2: taller.nombre),
                          RowCustom(
                              text1: 'razón social', text2: taller.razonSocial),
                          RowCustom(
                              text1: 'domicilio', text2: taller.domicilio),
                          RowCustom(text1: 'tipo', text2: taller.tipo),
                          RowCustom(
                              text1: 'Monto Ventas',
                              text2: taller.montoVnetas.toString()),
                          RowCustom(
                              text1: 'Encargado',
                              text2: taller.encargado!),
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
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>  CreateWorkshopPage(providerRefac: refacProvider,)));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ],
    );
  }
}
