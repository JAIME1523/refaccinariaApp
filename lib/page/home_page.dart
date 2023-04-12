import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refaccionaria/page/page.dart';
import 'package:refaccionaria/provider/provider.dart';
import 'package:refaccionaria/widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeProvider(), child: const _ContenidoHome());
  }
}

class _ContenidoHome extends StatelessWidget {
  const _ContenidoHome();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: ListView(
            children: [
              const Center(
                  child: Text('Vista de refaccionaria',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              ...homeProvider.refaccionarias.map((e) => CustomCard(
                  widget: Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Identificador',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            e.identificador,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(e.nombre,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(e.nivelVenatas,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RefacionariaPage(
                                  spareparts: e,
                                )));
                  })),
            ],
          ),
        )),
      ),
    );
  }
}
