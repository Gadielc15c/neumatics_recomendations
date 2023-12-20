import 'package:flutter/material.dart';
import 'package:neumatics_recomendations/tire_recommendation.dart';
import 'package:provider/provider.dart';
import 'user_responses.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  void _goToRecommendationScreen(
      BuildContext context, UserResponses userResponses) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            TireRecommendationScreen(userResponses: userResponses),
      ),
    );  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Bienvenido, ${Provider.of<UserResponses>(context, listen: false).userName}")),
      body: Consumer<UserResponses>(
        builder: (context, userResponses, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              DropdownButtonFormField<String>(
                value: userResponses.selectedHardness.isNotEmpty
                    ? userResponses.selectedHardness
                    : null,
                hint: const Text('Seleccione la dureza del caucho'),
                onChanged: (newValue) =>
                    userResponses.setSelectedHardness(newValue ?? ''),
                items: <String>[
                  'Caucho Duro',
                  'Caucho Semiblando',
                  'Caucho Suave'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: userResponses.selectedDrivingStyle.isNotEmpty
                    ? userResponses.selectedDrivingStyle
                    : null,
                hint: const Text('Qué estilo de conducción frecuenta?'),
                onChanged: (newValue) =>
                    userResponses.setSelectedDrivingStyle(newValue ?? ''),
                items: <String>[
                  'Baja Velocidad',
                  'Media Velocidad',
                  'Alta Velocidad'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: userResponses.selectedTireStructure.isNotEmpty
                    ? userResponses.selectedTireStructure
                    : null,
                hint: const Text(
                    'Qué preferencia tiene acerca de la estructura interna del neumático?'),
                onChanged: (newValue) =>
                    userResponses.setSelectedTireStructure(newValue ?? ''),
                items: <String>['Radial', 'Diagonal']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: userResponses.selectedEnvironment.isNotEmpty
                    ? userResponses.selectedEnvironment
                    : null,
                hint: const Text('En qué tipo de ambiente suele movilizarse?'),
                onChanged: (newValue) =>
                    userResponses.setSelectedEnvironment(newValue ?? ''),
                items: <String>['Seco', 'Mojado', 'Ambos']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: userResponses.selectedTireSize.isNotEmpty
                    ? userResponses.selectedTireSize
                    : null,
                hint: const Text(
                    'Qué preferencia tiene con relación a la altura/anchura del neumático?'),
                onChanged: (newValue) =>
                    userResponses.setSelectedTireSize(newValue ?? ''),
                items: <String>['Alta', 'Media', 'Baja']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButtonFormField<String>(
                value: userResponses.selectedVehicleType.isNotEmpty
                    ? userResponses.selectedVehicleType
                    : null,
                hint: const Text('Qué tipo de vehículo usted conduce?'),
                onChanged: (newValue) =>
                    userResponses.setSelectedVehicleType(newValue ?? ''),
                items: <String>['Sedán', 'SUV']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                child: const Text('Agregar Recomendación'),
                onPressed: () =>
                    _goToRecommendationScreen(context, userResponses),
              ),
            ],
          );
        },
      ),
    );
  }
}
