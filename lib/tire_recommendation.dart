// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:neumatics_recomendations/cita.dart';
import 'user_responses.dart';

class TireRecommendation {
  final Map<String, Map<String, String>> perfilesLlantas = {
    "Neumatico1": {
      "Nombre": "HT",
      "dureza_caucho": "Caucho Suave",
      "estilo_conduccion": "Baja Velocidad",
      "estructura_neumatico": "Radial",
      "tipo_ambiente": "Seco",
      "altura_anchura": "Alta",
      "tipo_vehiculo": "Sedán",
      "url_imagen":
          "https://autofashion.com.do/6357-large_default/235-70r16-neumatico-sailun-terramax-ht.jpg"
    },
    "Neumatico2": {
      "Nombre": "AT",
      "dureza_caucho": "Caucho Duro",
      "estilo_conduccion": "Media Velocidad",
      "estructura_neumatico": "Radial",
      "tipo_ambiente": "Ambos",
      "altura_anchura": "Media",
      "tipo_vehiculo": "SUV",
      "url_imagen":
          "https://www.jeepaccesorios.cl/wp-content/uploads/2021/04/neumatico-fuel-at-1.jpg"
    },
    "Neumatico3": {
      "Nombre": "MT",
      "dureza_caucho": "Caucho Duro",
      "estilo_conduccion": "Alta Velocidad",
      "estructura_neumatico": "Diagonal",
      "tipo_ambiente": "Ambos",
      "altura_anchura": "Alta",
      "tipo_vehiculo": "4x4",
      "url_imagen":
          "https://www.jeepaccesorios.cl/wp-content/uploads/2021/04/Neumatico-mt.jpg"
    },
  };

  String getRecommendedTireProfile(UserResponses responses) {
    var u_responses = responses;
    print(u_responses);
    String recommendedProfileKey = "";
    int highestScore = 0;

    perfilesLlantas.forEach((key, profile) {
      int score = 0;
      if (profile["dureza_caucho"] == responses.selectedHardness) score += 10;
      if (profile["estilo_conduccion"] == responses.selectedDrivingStyle) {
        score += 20;
      }
      if (profile["estructura_neumatico"] == responses.selectedTireStructure) {
        score += 15;
      }
      if (profile["tipo_ambiente"] == responses.selectedEnvironment) {
        score += 10;
      }
      if (profile["altura_anchura"] == responses.selectedTireSize) score += 20;
      if (profile["tipo_vehiculo"] == responses.selectedVehicleType) {
        score += 25;
      }

      if (score > highestScore) {
        highestScore = score;
        recommendedProfileKey = key;
      }
    });

    return recommendedProfileKey;
  }
}

class TireRecommendationScreen extends StatelessWidget {
  final UserResponses userResponses;

  const TireRecommendationScreen({Key? key, required this.userResponses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TireRecommendation tireRecommendation = TireRecommendation();
    String recommendedProfileKey =
        tireRecommendation.getRecommendedTireProfile(userResponses);
    Map<String, String>? tireDetails =
        tireRecommendation.perfilesLlantas[recommendedProfileKey];

    return Scaffold(
      appBar: AppBar(title: Text('Recomendación de Neumático')),
      body: tireDetails != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Container(
                      width: 400,
                      height: 400,
                      child: ClipRRect(
                        child: Image.network(
                          tireDetails["url_imagen"]!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Agendar Cita'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AgendarCitaScreen(
                              userResponses: userResponses,
                              tireDetails: tireDetails),
                        ),
                      );
                    },
                  ),

                  Card(
                    child: ListTile(
                      title: Text('Recomendación de Neumático'),
                      subtitle: Text('${tireDetails["Nombre"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Dureza del Caucho'),
                      subtitle: Text('${tireDetails["dureza_caucho"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Estilo de Conducción'),
                      subtitle: Text('${tireDetails["estilo_conduccion"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Estructura Neumático'),
                      subtitle: Text('${tireDetails["estructura_neumatico"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tipo de Ambiente'),
                      subtitle: Text('${tireDetails["tipo_ambiente"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Altura/Anchura'),
                      subtitle: Text('${tireDetails["altura_anchura"]}'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Tipo de Vehículo'),
                      subtitle: Text('${tireDetails["tipo_vehiculo"]}'),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                  'No se pudo determinar una recomendación basada en las respuestas.')),
    );
  }
}
