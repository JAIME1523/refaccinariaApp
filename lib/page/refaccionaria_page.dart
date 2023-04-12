import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/models/models.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/view/view.dart';
import 'package:refaccionaria/widget/custom_nav_menu.dart';
import 'package:refaccionaria/widget/widget.dart';

class RefacionariaPage extends StatelessWidget {
  final Refaccionaria spareparts;
  const RefacionariaPage({Key? key, required this.spareparts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RefacionariaProvider(),
        child: _ContainerRefacionaria(spareparts: spareparts));
  }
}

class _ContainerRefacionaria extends StatelessWidget {
  const _ContainerRefacionaria({
    required this.spareparts,
  });

  final Refaccionaria spareparts;

  @override
  Widget build(BuildContext context) {
    final refacProvider = Provider.of<RefacionariaProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Refaccionaria'),
      ),
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Text('Datos de la refac'),
          RowCustom(text1: 'identificador', text2: spareparts.identificador),
          RowCustom(text1: 'Domicilio', text2: spareparts.domicilio),
          RowCustom(text1: 'Nivel', text2: spareparts.nivelVenatas),
          RowCustom(text1: 'descuento', text2: spareparts.descuento.toString()),

          refacProvider.viewStatus == ViewsStatus.talleres
              ? TallerView(
                  talleres: spareparts.listaTalleres!,
                )
              : refacProvider.viewStatus == ViewsStatus.empleados
                  ? EmpleadoView(
                      listaEmpleado: spareparts.listaEmpleado!,
                    )
                  : ProvedorView(
                      listaProvedores: spareparts.listaProvedores!,
                    )
        ],
      )),
      bottomNavigationBar:const _Nav(),
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refacProvider =
        Provider.of<RefacionariaProvider>(context, listen: false);

    return CustomNavMenu(
      backgroundColor: ThemeData.dark().primaryColor,
      activeColor: Colors.white,
      items: [
        CustomNavButto(
            tilte: 'Talleres',
            onPressed: () {
              refacProvider.viewStatus = ViewsStatus.talleres;
            },
            icon: Icons.shopping_cart_outlined),
        CustomNavButto(
            tilte: 'Empleados',
            onPressed: () {
              refacProvider.viewStatus = ViewsStatus.empleados;
            },
            icon: Icons.emoji_people),
        CustomNavButto(
            tilte: 'Provedores',
            onPressed: () {
              refacProvider.viewStatus = ViewsStatus.provedor;
            },
            icon: Icons.manage_accounts_sharp),
      ],
    );
  }
}
