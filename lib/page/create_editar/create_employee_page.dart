import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/decoration/decaration.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/widget/widget.dart';

class CreateEmployeePage extends StatelessWidget {
  const CreateEmployeePage({Key? key, required this.providerRefac})
      : super(key: key);
  final RefacionariaProvider providerRefac;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmpleadoFormProvider(),
      child: Builder(builder: (context) {
        final tallerProvider = Provider.of<EmpleadoFormProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Agregar empleado'),
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
                        tallerProvider.newEmpleado!.nombre = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Sexo'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newEmpleado!.sexo = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar Sexo';
                        return null;
                      },
                      decoration: DecorationCustom.registro(hint: 'Sexo')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'NSS'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newEmpleado!.nss = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Ingresar NSS';
                        return null;
                      },
                      decoration: DecorationCustom.registro(hint: 'NSS')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Nivel'),
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
                      items: tallerProvider.listNivel.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        tallerProvider.newEmpleado!.nivel = value!;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Sueldo'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newEmpleado!.sueldo = value;
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
                  const ColumName(name: 'Dias de vacaciones'),
                  TextFormField(
                      onChanged: (value) {
                        tallerProvider.newEmpleado!.diaVacaciones = value;
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
              child: const Icon(Icons.new_label),
              onPressed: () {
                final resp = tallerProvider.validateFrom();
                if (resp) {
                  providerRefac.agregarEmpleado(tallerProvider.newEmpleado!);
                  Navigator.pop(context);
                }
              }),
        );
      }),
    );
  }
}
