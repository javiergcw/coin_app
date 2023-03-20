import 'package:coin_flutter/utils/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _case = TextEditingController();
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Envianos tú comentario'),
                    UISizedBox.gapH10,
                    const Text(
                        '¿Haz encontrado algún bug, tienes alguna pregunta?'),
                    const Text('Utiliza este formulario para informarnos'),
                    UISizedBox.gapH20,
                    const Text('Cuentanos tu experiencia'),
                    Wrap(
                      spacing: 20,
                      children: [
                        Icon(
                          Icons.sentiment_very_satisfied,
                          size: 40,
                        ),
                        Icon(
                          Icons.sentiment_dissatisfied,
                          size: 40,
                        ),
                        Icon(
                          Icons.mood_bad,
                          size: 40,
                        ),
                      ],
                    ),
                    UISizedBox.gapH10,
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
                      style: TextStyle(color: Colors.black),
                    ),
                    Wrap(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 120,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text("Bug"),
                            value: "bug",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text("Consulta"),
                            value: "Consulta",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text("Otros"),
                            value: "otros",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(
                                () {
                                  gender = value.toString();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Enviar solicitud'),
                      ),
                    )
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
