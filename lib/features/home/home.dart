import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Dummy stream for demonstration (replace with your backend stream)
  Stream<Map<String, dynamic>> get userStream async* {
    await Future.delayed(const Duration(seconds: 1));
    yield {
      "name": "Forhad Ali",
      "phone": "+8801714438125",
      "email": "forhadj35@gmail.com",
      "dateOfBirth": "1999-03-10"
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          }

          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoTile("Name", data["name"]),
                _buildInfoTile("Phone", data["phone"]),
                _buildInfoTile("Email", data["email"]),
                _buildInfoTile("Date of Birth", data["dateOfBirth"]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value ?? "", overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
