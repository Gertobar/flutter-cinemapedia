import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});



  Stream<String> getLoadingMessages(){
      const messages = <String>[
    'Cargando peliculas',
    'Listo o no hay voy',
    'No contaban con mi astucia',
    'La vas a matar perro',
    'Voy a desayunar',
    'Tardando mas de lo esperado :(',
  ];
  return Stream.periodic(const Duration(microseconds: 1200),(step){
    return messages[step];
  }).take(messages.length);
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please wait'),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(strokeWidth: 2,),
          const SizedBox(height: 10,),
          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if(!snapshot.hasData) return const Text('Loading...');

              return Text(snapshot.data!);
            },
            )

        ],
      ),
    );
  }
}