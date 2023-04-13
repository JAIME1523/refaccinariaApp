import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/decoration/decaration.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/widget/custom_colum.dart';

class CreateRefaccionariaPage extends StatelessWidget {
  const CreateRefaccionariaPage({Key? key, required this.homeProvider})
      : super(key: key);
  final HomeProvider homeProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RefaccionariaFormProvider(),
      child: Builder(builder: (context) {
        final formProvder = Provider.of<RefaccionariaFormProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Agregar refaccionaria'),
          ),
          body: Form(
            key: formProvder.fromKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ColumName(name: 'Identificador'),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar Identificador';
                        return null;
                      },
                      onChanged: (value) {
                        formProvder.newRefac.identificador = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  // const ColumName(name: 'Identificador'),
                  // TextFormField(
                  //     validator: (value) {
                  //       if (value!.isEmpty) return 'Ingresar Identificador';
                  //       return null;
                  //     },
                  //     onChanged: (value) {
                  //       formProvder.newRefac.domicilio = value;
                  //     },
                  //     decoration:
                  //         DecorationCustom.registro(hint: 'Identificador')),
                  //           const SizedBox(
                  //   height: 20,
                  // ),

                  const ColumName(name: 'Domicio'),

                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Domicio';
                        return null;
                      },
                      onChanged: (value) {
                        formProvder.newRefac.domicilio = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Domicio')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Nivel'),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar Nivel';
                        return null;
                      },
                      onChanged: (value) {
                        formProvder.newRefac.nivelVenatas = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Nivel')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Descuento'),

                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar descuento';
                        return null;
                      },
                      onChanged: (value) {
                        formProvder.newRefac.descuento = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'descuento')),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.new_label),
              onPressed: () {
                homeProvider.addrefac(formProvder.newRefac);
                Navigator.pop(context);
              }),
        );
      }),
    );
  }
}
