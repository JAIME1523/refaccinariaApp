import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/decoration/decaration.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/widget/widget.dart';

class CreateProviderPage extends StatelessWidget {
  const CreateProviderPage({Key? key, required this.providerRefac})
      : super(key: key);
  final RefacionariaProvider providerRefac;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvedorFormProvider(),
      child: Builder(builder: (context) {
        final provedorProvider = Provider.of<ProvedorFormProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Agregar provedor'),
          ),
          body: Form(
            key: provedorProvider.fromKey,
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
                        provedorProvider.newPovedor.nombre = value;
                      },
                      decoration: DecorationCustom.registro(hint: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  const ColumName(name: 'Tipo de provedor'),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: "Tipo de provedor",
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'selecciona uno';
                        }
                        return null;
                      },
                      items: provedorProvider.listTipo.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        provedorProvider.newPovedor.tipoProvedor = value!;
                      }),
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
                final resp = provedorProvider.validateFrom();
                if (resp) {
                  providerRefac.agregarProvedor(provedorProvider.newPovedor);
                  Navigator.pop(context);
                }
              }),
        );
      }),
    );
  }
}
