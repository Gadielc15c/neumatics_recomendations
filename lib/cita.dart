// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:neumatics_recomendations/MySql.dart';
import 'user_responses.dart';

class AgendarCitaScreen extends StatefulWidget {
  final UserResponses userResponses;
  final Map<String, String> tireDetails;

  AgendarCitaScreen({Key? key, required this.userResponses, required this.tireDetails}) : super(key: key);

  @override
  _AgendarCitaScreenState createState() => _AgendarCitaScreenState();
}

class _AgendarCitaScreenState extends State<AgendarCitaScreen> {
  DateTime? selectedDate;

  void confirmarCita() async {
  if (selectedDate != null) {
    String nombre = widget.userResponses.userName;
    String contacto = widget.userResponses.userContact;
    String fechaCita = selectedDate!.toIso8601String();
    String recomendacion = widget.tireDetails["Nombre"]!;
    String durezaCaucho = widget.userResponses.selectedHardness;
    String estiloConduccion = widget.userResponses.selectedDrivingStyle;
    String estructuraNeumatico = widget.userResponses.selectedTireStructure;
    String tipoAmbiente = widget.userResponses.selectedEnvironment;
    String alturaAnchura = widget.userResponses.selectedTireSize;
    String tipoVehiculo = widget.userResponses.selectedVehicleType;
// El primer campo negro debe llamarse siempre table 

    var datosCita = {
      'table': 'citas',
      'nombre_usuario': nombre,
      'contacto': contacto,
      'fecha_cita': fechaCita,
    };

    var datosRecomendacion = {
      'table': 'recomendaciones',
      'nombre_usuario': nombre,
      'recomendacion': recomendacion,
      'url_imagen': widget.tireDetails["url_imagen"],
    };

    var datosRespuestasUsuario = {
      'table': 'respuestas_usuario',
      'nombre_usuario': nombre,
      'dureza_caucho': durezaCaucho,
      'estilo_conduccion': estiloConduccion,
      'estructura_neumatico': estructuraNeumatico,
      'tipo_ambiente': tipoAmbiente,
      'altura_anchura': alturaAnchura,
      'tipo_vehiculo': tipoVehiculo,
    };

    await DatabaseHelper.insertDynamic(datosCita);
    await DatabaseHelper.insertDynamic(datosRecomendacion);
    await DatabaseHelper.insertDynamic(datosRespuestasUsuario);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cita Agendada con Éxito'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Tu cita ha sido agendada para el $fechaCita.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendar Cita')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Seleccionar Fecha de Cita'),
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
              ),
              if (selectedDate != null) Text("Fecha seleccionada: ${selectedDate!.toIso8601String()}"),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Confirmar Cita'),
                onPressed: confirmarCita,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


