import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 42, 26, 0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(66),
                child: Image.asset(
                  'assets/img/profile_1.jpg',
                  width: 132,
                  height: 132,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Nima Kazemi',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '@nima',
                style: TextStyle(color: Colors.black.withOpacity(0.3)),
              ),
              const SizedBox(height: 32),
              Container(
                height: 450,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(89, 158, 158, 158),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact info',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 14, 0, 4),
                        child: Text(
                          'Phone number',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.3)),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 14, 0, 4),
                        child: Text(
                          'Age',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.3)),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
