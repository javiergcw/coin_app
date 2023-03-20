import 'package:coin_flutter/screens/home/views/widgets/line.dart';
import 'package:coin_flutter/screens/profile/widgets/SectionProfile.dart';
import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        const Text(
          "Ajustes de cuenta",
          style: titleProfile,
        ),
        GestureDetector(
          onTap: () {
            _showSheet(context);
          },
          child: SectionProfile(
            icon: Icons.qr_code_rounded,
            subtitle: 'Ingresa tu Qr',
            title: 'Tu QR',
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.height,
          height: 0.5,
          decoration: BoxDecoration(
            color: UIColors.gray,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SectionProfile(
          icon: Icons.line_axis_sharp,
          subtitle: 'Observa tus avances',
          title: 'Graficas',
        ),
      ],
    );
  }
}

void _showSheet(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // set this to true
    builder: (_) {
      return DraggableScrollableSheet(
        maxChildSize: 0.75,
        expand: false,
        builder: (_, controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  /*              Image(image: image)
                      
                       */

                  Text(
                    'Coin Wrap es una aplicación diseñada exclusivamente para fines educativos y está disponible solo para estudiantes y profesores que se encuentren actualmente inscritos en una institución educativa. Los estudiantes solo pueden recibir monedas si son asignadas por su profesor a través de la aplicación, por lo que Coin Wrap no tiene la responsabilidad de verificar si los puntos son asignados de manera justa o no. Los estudiantes deben utilizar la aplicación de manera responsable y ética, evitando acosar o intimidar a otros estudiantes o profesores. Si se descubre que la aplicación está siendo utilizada de manera inapropiada, el equipo de Coin Wrap se reserva el derecho de retirar la aplicación de cualquier estudiante o institución educativa. Asimismo, Coin Wrap no se hace responsable por la pérdida de puntos o cualquier problema técnico que impida a los estudiantes utilizar la aplicación de manera adecuada. Los premios canjeados por los estudiantes serán entregados según la disponibilidad de los mismos, y se registrarán en su historial de premios en la aplicación, permitiendo a los estudiantes verificar si el premio ha sido entregado o no. Por último, el equipo de Coin Wrap se reserva el derecho de modificar estas políticas y condiciones en cualquier momento sin previo aviso, por lo que es responsabilidad del usuario revisar periódicamente estas políticas y condiciones para estar al tanto de cualquier cambio.',
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
