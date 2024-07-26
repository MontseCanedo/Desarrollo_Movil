import 'package:flutter/material.dart';
import 'package:punto_venta/widgets/card_view.dart';
//import 'package:punto_venta/utils/responsive.dart';

class BranchOfficeSelectionPage extends StatefulWidget {
  static const routeName = 'bOffice';
  const BranchOfficeSelectionPage({super.key});
  @override
  State<BranchOfficeSelectionPage> createState() =>
      _BranchOfficeSelectionPageState();
}

class _BranchOfficeSelectionPageState extends State<BranchOfficeSelectionPage> {
  @override
  Widget build(BuildContext context) {
    //final Responsive responsive = Responsive.of(context);
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 10, 108, 181),
          title: const Text(
            'Reporte de Ventas',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: const [
                    CardView(
                      colors: Color.fromARGB(255, 190, 1, 97),
                      id: 'Nº Ticket 1',
                      date: 'Fecha: 31/10/2023',
                      user: 'Usuario: Ttp admin',
                      status: 'Status: 1',
                      total: 'Total: \$500',
                      quantityProducts: 'Cantidad de productos: 5',
                    ),
                    CardView(
                      colors: Color.fromARGB(255, 255, 255, 1),
                      id: 'Nº Ticket 2',
                      date: 'Fecha: 31/10/2023',
                      user: 'Usuario: Ttp admin',
                      status: 'Status: 1',
                      total: 'Total: \$500',
                      quantityProducts: 'Cantidad de productos: 5',
                    ),
                    CardView(
                      colors: Color.fromARGB(255, 190, 1, 97),
                      id: 'Nº Ticket 3',
                      date: 'Fecha: 31/10/2023',
                      user: 'Usuario: Ttp admin',
                      status: 'Status: 1',
                      total: 'Total: \$500',
                      quantityProducts: 'Cantidad de productos: 5',
                    ),
                    CardView(
                      colors: Color.fromARGB(255, 255, 255, 1),
                      id: 'Nº Ticket 4',
                      date: 'Fecha: 31/10/2023',
                      user: 'Usuario: Ttp admin',
                      status: 'Status: 1',
                      total: 'Total: \$500',
                      quantityProducts: 'Cantidad de productos: 5',
                    ),
                    CardView(
                      colors: Color.fromARGB(255, 190, 1, 97),
                      id: 'Nº Ticket 5',
                      date: 'Fecha: 31/10/2023',
                      user: 'Usuario: Ttp admin',
                      status: 'Status: 1',
                      total: 'Total: \$500',
                      quantityProducts: 'Cantidad de productos: 5',
                    ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
