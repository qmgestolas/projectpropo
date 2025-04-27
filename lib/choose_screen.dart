import 'package:flutter/material.dart';
import 'find_my_uni_screen.dart'; // Import the FindMyUniScreen

class ChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(
          'Choose Your Feature',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // "Hello! Greetings" text
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'Hello! Greetings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          // Spacer
          SizedBox(height: 30),
          // Feature Buttons
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FindMyUni Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to FindMyUniScreen when clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FindMyUniScreen(),
                          ),
                        );
                      },
                      child: Text('FindMyUni'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        foregroundColor: Colors.blue, // Text color stays blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: 15),
                    // UNIquiz Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to UNIquiz screen
                      },
                      child: Text('UNIquiz'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        foregroundColor: Colors.blue, // Text color stays blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: 15),
                    // UNIbudget Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to UNIbudget screen
                      },
                      child: Text('UNIbudget'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        foregroundColor: Colors.blue, // Text color stays blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: 15),
                    // UNIpare Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to UNIpare screen
                      },
                      child: Text('UNIpare'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        foregroundColor: Colors.blue, // Text color stays blue
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
