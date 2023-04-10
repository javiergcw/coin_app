import 'package:coin_flutter/providers/providerHelper/ProviderState.dart';

import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _case = TextEditingController();
  String? option;

  int? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.questionIsometric,
                        width: 230,
                      ),
                    ),
                    UISizedBox.gapH10,
                    const Text(
                      'Envianos tú comentario',
                      style: TitleContainerQuiz,
                    ),
                    UISizedBox.gapH10,
                    const Text(
                      '¿Haz encontrado algún bug, tienes alguna pregunta?',
                      style: bodyBlack,
                    ),
                    const Text('Utiliza este formulario para informarnos',
                        style: bodyBlack),
                    UISizedBox.gapH20,
                    const Text('Cuentanos tu experiencia', style: bodyBlack),
                    Wrap(
                      spacing: 20,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIcon = 1;
                            });
                          },
                          child: Icon(
                            Icons.sentiment_very_satisfied,
                            size: 40,
                            color: _selectedIcon == 1 ? UIColors.redMain : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIcon = 2;
                            });
                          },
                          child: Icon(
                            Icons.sentiment_dissatisfied,
                            size: 40,
                            color: _selectedIcon == 2 ? UIColors.redMain : null,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIcon = 3;
                            });
                          },
                          child: Icon(
                            Icons.mood_bad,
                            size: 40,
                            color: _selectedIcon == 3 ? UIColors.redMain : null,
                          ),
                        ),
                      ],
                    ),
                    UISizedBox.gapH20,
                    const Text('Comentanos que ha ocurrido'),
                    UISizedBox.gapH4,
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-ZÑ\s]')),
                      ],
                      controller: _case,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.black),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UISizedBox.gapH20,
                        const Text('Seleccione una opción',
                            style: TitleContainerQuiz),
                        Container(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            children: [
                              Radio(
                                value: "bug",
                                groupValue: option,
                                onChanged: (value) {
                                  setState(() {
                                    option = value.toString();
                                  });
                                },
                              ),
                              const Text('Bug')
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Consulta",
                              groupValue: option,
                              onChanged: (value) {
                                setState(() {
                                  option = value.toString();
                                });
                              },
                            ),
                            const Text('Consulta')
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "otros",
                              groupValue: option,
                              onChanged: (value) {
                                setState(
                                  () {
                                    option = value.toString();
                                  },
                                );
                              },
                            ),
                            const Text("Otros"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!_case.text.isEmpty &&
                              option != null &&
                              _selectedIcon != null) {
                            debugPrint('Enviado');

                            String? user = await ProviderState().getUserMail();

                            ProviderState().guardarFormulario(
                                _case.text,
                                user.toString(),
                                option.toString(),
                                _selectedIcon.toString());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Todos los campos son requeridos'),
                              ),
                            );
                          }
                        },
                        child: const Text('Enviar solicitud'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
