import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Samuel's Profile Page",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> content = [
    {
      'title': 'Pengalaman',
      'description': 'Pengalaman yang didapat selama kuliah',
      'details': [
        'Network Engineer Intern di PT. XYZ',
        'Chief Operational Officer di PT. Murah Rezeki Tbk.',
        'Dosen Peternak Lele di Universitas Peternakan Ikan Lele'
      ],
    },
    {
      'title': 'Pendidikan',
      'description': 'Pendidikan yang ditempuh',
      'details': [
        'MIPA, SMA Negeri 78 IKN',
        'S1 Ilmu Lele di Universitas Peternakan Ikan Lele',
        'S2 Catfish Management di Tokyo Institute of Catfish Farm'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0), // Padding applied to the AppBar title
          child: Text(
            'Profile Page',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 127, 255),
      ),
      body: Column(
  children: [
    // The Stack widget wrapped in a SizedBox to provide constraints
    SizedBox(
  height: 350, // Adjusted height to fit the new content
  child: Stack(
    fit: StackFit.expand,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 50),
        color: const Color.fromARGB(255, 12, 95, 190),
      ),
      Align(
        alignment: Alignment.center, // Center the content horizontally
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimize the space taken by Column
          children: [
            // Circular image
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://media.licdn.com/dms/image/v2/D5603AQEJ1Y5lBbMlRg/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1687708929510?e=1736985600&v=beta&t=HV-MqWZy36LK40gamWNh5M9IjM6XnrfyXDdzGGZmQPc'
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Add the texts below the image
            const SizedBox(height: 10), // Spacing between image and text
            const Text(
              'Samuel Hutagalung',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5), // Spacing between texts
            const Text(
              '5026221067',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5), // Spacing between texts
            const Text(
              'funfact: suka meong',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

    // Expanded ListView to avoid overflow
    Expanded(
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 228, 255, 165),
            child: ListTile(
              title: Text(
                content[index]['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(content[index]['description']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ContentDetailPage(content: content[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),
  ],
),
    );
  }
}

class ContentDetailPage extends StatelessWidget {
  final Map<String, dynamic> content;

  ContentDetailPage({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0), // Padding applied to the AppBar title
          child: Text(
            content['title']!,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 127, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              content['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              content['description'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: content['details'].length,
              itemBuilder: (context, index) {
                return Text(
                  '- ${content['details'][index]}',
                  style: TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
