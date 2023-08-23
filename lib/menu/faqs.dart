import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 167, 45, 204),
        title: const Text(
          'FAQs',
          style: TextStyle(color: Color.fromARGB(255, 246, 240, 240), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          color: const Color.fromARGB(255, 246, 240, 240),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqData[index].question),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqData[index].answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

final List<FAQItem> faqData = [
  FAQItem(
    question: 'What is the purpose of this app?',
    answer: 'This app helps users track their workout progress...',
  ),
  FAQItem(
    question: 'How do I create an account?',
    answer: 'To create an account, go to the Sign Up page...',
  ),
  FAQItem(
    question: 'How much time will it take to show results?',
    answer: 'Consistency in your workout routine will show results in just 30 days.',
  ),
  FAQItem(
    question: 'Is the focus on specific body parts beneficial?',
    answer: 'Yes, it is. You can save time by focusing on specific body parts.',
  ),
  FAQItem(
    question: 'Is this app useful for weight gain?',
    answer: 'No, this app is designed for weight loss. Please use other applications for weight gain.',
  ),
  FAQItem(
    question: 'Can we reduce facial fat?',
    answer: 'Yes, you can. We provide separate facial workouts to help reduce facial fat.',
  ),
];
