import 'package:flutter/material.dart';
import 'package:neumatics_recomendations/question_screen.dart';
import 'package:provider/provider.dart';
import 'user_responses.dart';

class UserRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario de Usuarios")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserResponses>(
          builder: (context, userResponses, child) {
            return Column(
              children: [
                TextField(
                  onChanged: userResponses.setUserName,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Ingrese el nombre',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  onChanged: userResponses.setUserContact,
                  decoration: const InputDecoration(
                    labelText: 'Número de Contacto',
                    hintText: 'Ingrese el número de contacto',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  QuestionsScreen(),
                      ),
                    );
                  },
                  child: const Text('Continuar'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
