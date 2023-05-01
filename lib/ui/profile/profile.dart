import 'package:flutter/material.dart';
import 'package:nexo_project/data/user.dart';

class ProfileScreen extends StatefulWidget {
  final UserEntity user;
  final int index;

  const ProfileScreen({super.key, required this.user, required this.index});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController phoneNumberController;
  late TextEditingController ageController;
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    phoneNumberController = TextEditingController(text: user.date);
    ageController = TextEditingController(text: user.age.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: Theme.of(context).textTheme.labelLarge,
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
                  'assets/img/profile_${widget.index}.jpg',
                  width: 132,
                  height: 132,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                '@${user.name}',
                style: Theme.of(context).textTheme.labelSmall,
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
                      Text(
                        'Contact info',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 14, 0, 4),
                        child: Text(
                          'Phone number',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      WhiteTextField(controller: phoneNumberController),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 14, 0, 4),
                        child: Text(
                          'Age',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      WhiteTextField(controller: ageController),
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

class WhiteTextField extends StatelessWidget {
  const WhiteTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
