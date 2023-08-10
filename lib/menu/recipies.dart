import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  DietPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIET PLAN',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor:
            const Color.fromARGB(255, 147, 76, 175), 
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "To achieve better results, you need a better diet.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 18),
                DietCard(
                  title: 'Breakfast',
                  image:
                      'assest/image/assets/break fast.jpeg', 
                  foods: [
                    'Whole-grain cereal',
                    'Greek yogurt',
                    'Fresh fruits',
                    'Nuts',
                  ],
                ),
                SizedBox(height: 18),
                DietCard(
                  title: 'Lunch',
                  image: 'assest/image/assets/lunch.jpeg',
                  foods: [
                    'Grilled chicken',
                    'Brown rice',
                    'Steamed vegetables',
                  ],
                ),
                SizedBox(height: 18),
                DietCard(
                  title: 'Snack',
                  image: 'assest/image/assets/snack.jpeg',
                  foods: [
                    'Almonds',
                    'Carrot sticks',
                    'Hummus',
                  ],
                ),
                SizedBox(height: 18),
                DietCard(
                  title: 'Dinner',
                  image:
                      'assest/image/assets/dinner.jpeg', 
                  foods: [
                    'Salmon fillet',
                    'Quinoa',
                    'Green salad',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DietCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> foods;

  const DietCard({super.key, required this.title, required this.image, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var food in foods)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.circle, size: 8),
                            const SizedBox(width: 8),
                            Text(food),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
