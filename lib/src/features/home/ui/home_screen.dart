import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  String imageName = "assets/images/patterns/adapter_image.png";

  final images = const [
    "assets/images/patterns/adapter_image.png",
    "assets/images/patterns/mvvm_image.jpeg",
    "assets/images/patterns/block_image.png",
    "assets/images/patterns/adapter_image.png"
  ];

  final patterns = [
    {
      'number': '1',
      'title': 'MVC (Model-View-Controller)',
      'description': 'Разделение на модель, представление и контроллер',
      'image_url': 'assets/images/patterns/mvc_image.jpg'
    },
    {
      'number': '2',
      'title': 'MVVM (Model-View-ViewModel)',
      'description': 'Использование ViewModel для связывания данных',
      'image_url': 'assets/images/patterns/mvvm_image.jpeg'
    },
    {
      'number': '3',
      'title': 'BLoC (Business Logic Component)',
      'description': 'Управление состоянием через потоки и события',
      'image_url': 'assets/images/patterns/block_image.png'
    },
    {
      'number': '4',
      'title': 'Adapter',
      'description': 'Использование несовместимых типов данных посредством приведения одного к другому',
      'image_url': 'assets/images/patterns/adapter_image.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              _buildSoftwareCard(),

              _buildImageSection(),

              _buildPatternsList(),

              _buildDeveloperInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[700]!, Colors.blue[500]!],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'АРХИТЕКТУРНЫЕ ПАТТЕРНЫ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter Development',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoftwareCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Архитектурные паттерны в Flutter',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Архитектурные паттерны - это проверенные решения для организации кода '
                'и разделения ответственности между компонентами приложения. '
                'В Flutter популярны MVC, MVP, MVVM, BLoC и другие.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Image.asset(images[index])
          );
        },
      ),
    );
  }


  Widget _buildPatternsList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: patterns.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _handleTap(patterns[index]['title']!);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.blue.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        patterns[index]["number"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patterns[index]["title"]!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue[800],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          patterns[index]["description"]!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDeveloperInfo() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Алексенко Дмитрий Тарасович',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Группа: ИКБО-06-22',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[600],
            ),
          ),
        ],
      ),
    );
  }

  void _handleTap(String title){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar( content: Text(title),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {

          },
        ),
        duration: const Duration(seconds: 3),
      ), );
  }
}
