import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/decoration/decaration.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/widget/widget.dart';

class CreateWorkshopPage extends StatelessWidget {
  const CreateWorkshopPage({Key? key, required this.providerRefac})
      : super(key: key);
  final RefacionariaProvider providerRefac;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TallerFormProvider(),
      child: Builder(builder: (context) {
        final tallerProvider = Provider.of<TallerFormProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Agregar Taller'),
          ),
          body: Form(
            key: tallerProvider.fromKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ColumName(name: 'Nombre'),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar nombre';
                        return null;
                      },
                      onChanged: (value) {
                        tallerProvider.newTaller!.nombre = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Razón social'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newTaller!.razonSocial = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar razon';
                        return null;
                      },
                      decoration:
                          DecorationCustom.registro(hint: 'Razón social')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Domicilio'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newTaller!.domicilio = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar Domicilio';
                        return null;
                      },
                      decoration: DecorationCustom.registro(hint: 'Domicilio')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Tipo'),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Selecciona una opción",
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'selecciona uno';
                        }
                        return null;
                      },
                      items: tallerProvider.listTipos.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        tallerProvider.newTaller!.tipo = value!;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Monto ventas'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newTaller!.montoVnetas = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar monto';
                        return null;
                      },
                      decoration:
                          DecorationCustom.registro(hint: 'Monto ventas')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'encargado'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newTaller!.encargado = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar encargado';
                        return null;
                      },
                      decoration: DecorationCustom.registro(hint: 'encargado')),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child:const Icon(Icons.new_label),
              onPressed: () {
                final resp = tallerProvider.validateFrom();
                if (resp) {
                  providerRefac.agregarTaller(tallerProvider.newTaller!);
                  Navigator.pop(context);
                }
              }),
        );
      }),
    );
  }
}


