import 'package:flutter/material.dart';
import 'package:learning_flutter/service/firebase_auth_service.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard'), centerTitle: true, actions: [
          SizedBox(
            width: 50,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/listViewScreen'),
              child: Icon(Icons.pedal_bike),
            ),
          ),
          SizedBox(
            width: 50,
            child: GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        icon: Icon(Icons.warning),
                        title: Text('Signout User'),
                        content: Text('Are you sure you want to signout?'),
                        actions: [
                          InkWell(
                            child: Text('Ok'),
                            onTap: () {
                              final firebaseAuthService = FirebaseAuthService();
                              firebaseAuthService.signOutUser();
                              Navigator.of(dialogContext).pop();
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                          ),
                          InkWell(
                            child: Text('Cancel'),
                            onTap: () {
                              Navigator.of(dialogContext).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Icon(Icons.logout),
            ),
          ),
          SizedBox(
            width: 50,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/toppicks'),
              child: Icon(Icons.star),
            ),
          )
        ]),
        body: ListView(
          children: [
            // SizedBox(
            //   height: 5,
            // ),
            Image(
              image: Image.asset('assets/images/beautiful_scenery.jpg').image,
              height: 500,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Beautiful scenery',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Beautiful scenery is like a lovely painting. Imagine a big blue sky with fluffy white clouds. Below, there is a bright green field full of pretty flowers of all colors. A little stream flows gently, sparkling in the sunlight. Tall trees stand around, their leaves rustling in the wind. Birds are singing sweet songs, flying high in the sky. Far away, you can see big hills covered with green trees. The sun sets, painting the sky with colors of orange and pink. This is beautiful scenery, which makes us feel happy and calm. It’s like nature’s own art.'
              'Beautiful scenery is like a painting filled with amazing colors. Imagine you are standing in a large, green field. Bright, yellow sunflowers are all around you, standing tall and proud. The sky above is a clear, bright blue with fluffy, white clouds that look like cotton candy. A little stream flows nearby, its water sparkling in the sunlight. You can hear the soft sound it makes as it moves along. Birds are singing sweet songs from the trees nearby. Their chirping sounds like music to your ears. Now and then, you see a pretty butterfly with colorful wings flying from one flower to another. It feels like you are in a dream. All around you, there is peace and quiet. The air smells fresh, like after a rain shower. You feel happy and calm. This is what beautiful scenery can do. It can make you feel good and forget all your worries. So, always take time to enjoy the beauty of nature. It is a gift for all of us to cherish.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'Beautiful scenery is like a magical painting come to life. It’s the kind of view that takes your breath away and makes your heart feel light. Imagine standing on a hilltop, looking out at a wide, open field. The field is a bright, vibrant green, full of tall, waving grass. In the distance, there are trees with leaves in all shades of green. Some trees have flowers in pink, yellow, and white, adding splashes of color to the scene. Beyond the trees, you can see mountains. They are tall and majestic, their peaks covered in snow that glows in the sunlight. The sky above is a clear, brilliant blue, with fluffy white clouds scattered here and there. As the sun sets, the sky takes on shades of pink, orange, and purple, making the scenery even more beautiful. The beauty of the scene is not just in how it looks, but also in how it makes you feel. It makes you feel calm and peaceful, and you can’t help but smile. Beautiful scenery is a gift from nature, and it’s something we should all appreciate and protect. So, next time you see a beautiful view, take a moment to enjoy it. It’s a simple pleasure that can make your day a little bit brighter.',
                style: TextStyle(fontSize: 20))
          ],
        ));
  }
}
