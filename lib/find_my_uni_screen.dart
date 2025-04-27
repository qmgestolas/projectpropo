import 'package:flutter/material.dart';

class FindMyUniScreen extends StatefulWidget {
  @override
  _FindMyUniScreenState createState() => _FindMyUniScreenState();
}

class _FindMyUniScreenState extends State<FindMyUniScreen> {
  String? selectedBudget;
  String? selectedLocation;
  List<String> selectedPrograms = []; // Multiple programs can be selected
  List<String> selectedCourses = []; // Store selected courses for each program
  String searchProgramQuery = ''; // Initialize searchProgramQuery

  // Mapping of programs to specific courses
  final Map<String, List<String>> programCourses = {
    'Engineering': [
      'Electrical Engineering',
      'Mechanical Engineering',
      'Civil Engineering',
      'Computer Engineering',
      'Chemical Engineering',
    ],
    'Business': ['Marketing', 'Finance', 'Management', 'Accounting'],
    'Law': ['International Law', 'Criminal Law', 'Civil Law'],
    'Humanities': ['Philosophy', 'Sociology', 'Psychology', 'Linguistics'],
    'Information Technology': [
      'Software Engineering',
      'Cybersecurity',
      'Data Science',
      'Networking',
    ],
    'Health Sciences': ['Nursing', 'Pharmacy', 'Physical Therapy', 'Medicine'],
    'Education': [
      'Elementary Education',
      'Secondary Education',
      'Special Education',
      'Teaching English',
    ],
    'Criminology': [
      'Criminal Justice',
      'Forensic Science',
      'Law Enforcement',
      'Criminal Psychology',
    ],
    'Design and Arts': [
      'Graphic Design',
      'Interior Design',
      'Fashion Design',
      'Multimedia Arts',
    ],
    'Hotel Management': [
      'Tourism',
      'Hotel Operations',
      'Event Management',
      'Food and Beverage Management',
    ],
    'Architecture': [
      'Urban Planning',
      'Interior Architecture',
      'Landscape Architecture',
    ],
    'Economics': [
      'Microeconomics',
      'Macroeconomics',
      'Development Economics',
      'Environmental Economics',
    ],
    'International Studies': [
      'International Relations',
      'Global Politics',
      'Diplomacy',
      'International Trade',
    ],
    'Public Administration': [
      'Public Policy',
      'Governance',
      'Public Sector Management',
      'Nonprofit Management',
    ],
    'Design': ['Product Design', 'Industrial Design', 'User Experience Design'],
    'Technology': [
      'Information Systems',
      'Blockchain Technology',
      'Artificial Intelligence',
      'Big Data',
    ],
    'Social Sciences': [
      'Anthropology',
      'Political Science',
      'Sociology',
      'Human Geography',
    ],
    'Natural Sciences': [
      'Physics',
      'Chemistry',
      'Biology',
      'Environmental Science',
    ],
    'Arts': ['Fine Arts', 'Music', 'Theater Arts', 'Film Studies'],
    'Communication': [
      'Journalism',
      'Public Relations',
      'Advertising',
      'Broadcasting',
    ],
  };
  // Define a list of all available programs
  final List<String> allPrograms = [
    'Engineering',
    'Social Sciences',
    'Natural Sciences',
    'Business',
    'Law',
    'Humanities',
    'Information Technology',
    'Health Sciences',
    'Education',
    'Criminology',
    'Design and Arts',
    'Hotel Management',
    'Architecture',
    'Economics',
    'International Studies',
    'Public Administration',
    'Design',
    'Technology',
  ];

  // Updated mock data for universities with flexible budget ranges
  final List<Map<String, dynamic>> additionalUniversities = [
    {
      'name': 'University of the Philippines – Diliman',
      'programs': [
        {
          'name': 'Engineering',
          'courses': [
            'Civil Engineering',
            'Mechanical Engineering',
            'Electrical Engineering',
            'Chemical Engineering',
          ],
        },
        {
          'name': 'Social Sciences',
          'courses': [
            'Political Science',
            'Sociology',
            'Anthropology',
            'Psychology',
          ],
        },
        {
          'name': 'Natural Sciences',
          'courses': [
            'Physics',
            'Chemistry',
            'Biology',
            'Environmental Science',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱0 - ₱50,000',
    },
    {
      'name': 'Ateneo de Manila University',
      'programs': [
        {
          'name': 'Business',
          'courses': [
            'Marketing',
            'Finance',
            'Business Administration',
            'Entrepreneurship',
          ],
        },
        {
          'name': 'Law',
          'courses': [
            'Criminal Law',
            'Corporate Law',
            'International Law',
            'Civil Law',
          ],
        },
        {
          'name': 'Humanities',
          'courses': [
            'Philosophy',
            'Sociology',
            'Political Science',
            'Linguistics',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'De La Salle University – Manila',
      'programs': [
        {
          'name': 'Engineering',
          'courses': [
            'Mechanical Engineering',
            'Civil Engineering',
            'Electrical Engineering',
            'Industrial Engineering',
          ],
        },
        {
          'name': 'Business',
          'courses': ['Management', 'Marketing', 'Finance', 'Accounting'],
        },
        {
          'name': 'Information Technology',
          'courses': [
            'Software Engineering',
            'Cybersecurity',
            'Networking',
            'Data Science',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'University of Santo Tomas',
      'programs': [
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy', 'Medicine'],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Civil Engineering',
            'Mechanical Engineering',
            'Electrical Engineering',
          ],
        },
        {
          'name': 'Humanities',
          'courses': ['Sociology', 'Anthropology', 'Psychology', 'Philosophy'],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Far Eastern University',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Accounting', 'Marketing', 'Finance', 'Management'],
        },
        {
          'name': 'Education',
          'courses': [
            'Elementary Education',
            'Special Education',
            'Secondary Education',
          ],
        },
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy'],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Lyceum of the Philippines University',
      'programs': [
        {
          'name': 'Business',
          'courses': [
            'Marketing',
            'Finance',
            'Business Administration',
            'Accounting',
          ],
        },
        {
          'name': 'Criminology',
          'courses': [
            'Criminal Justice',
            'Criminal Law',
            'Forensic Science',
            'Law Enforcement',
          ],
        },
        {
          'name': 'Law',
          'courses': [
            'International Law',
            'Criminal Law',
            'Civil Law',
            'Corporate Law',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },

    {
      'name': 'De La Salle-College of Saint Benilde',
      'programs': [
        {
          'name': 'Design and Arts',
          'courses': [
            'Graphic Design',
            'Interior Design',
            'Multimedia Arts',
            'Animation',
          ],
        },
        {
          'name': 'Business',
          'courses': ['Management', 'Finance', 'Accounting', 'Marketing'],
        },
        {
          'name': 'Hotel Management',
          'courses': [
            'Tourism',
            'Hotel Operations',
            'Event Management',
            'Culinary Arts',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },

    {
      'name': 'Mapúa University',
      'programs': [
        {
          'name': 'Engineering',
          'courses': [
            'Electrical Engineering',
            'Mechanical Engineering',
            'Civil Engineering',
            'Industrial Engineering',
          ],
        },
        {
          'name': 'Information Technology',
          'courses': [
            'Software Engineering',
            'Data Science',
            'Cybersecurity',
            'Networking',
          ],
        },
        {
          'name': 'Architecture',
          'courses': [
            'Urban Planning',
            'Interior Architecture',
            'Landscape Architecture',
            'Building Technology',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },

    {
      'name': 'National University',
      'programs': [
        {
          'name': 'Business',
          'courses': [
            'Accounting',
            'Marketing',
            'Finance',
            'Business Management',
          ],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Electrical Engineering',
            'Mechanical Engineering',
            'Civil Engineering',
            'Industrial Engineering',
          ],
        },
        {
          'name': 'Information Technology',
          'courses': [
            'Software Engineering',
            'Cybersecurity',
            'Data Science',
            'Networking',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },

    {
      'name': 'Polytechnic University of the Philippines',
      'programs': [
        {
          'name': 'Engineering',
          'courses': [
            'Civil Engineering',
            'Mechanical Engineering',
            'Electrical Engineering',
          ],
        },
        {
          'name': 'Business',
          'courses': ['Marketing', 'Finance', 'Accounting'],
        },
        {
          'name': 'Education',
          'courses': ['Teaching English', 'Mathematics', 'Special Education'],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱0 - ₱50,000',
    },
  ];

  // New universities (remaining 17 universities)
  final List<Map<String, dynamic>> universities = [
    {
      'name': 'San Beda University',
      'programs': [
        {
          'name': 'Law',
          'courses': [
            'International Law',
            'Criminal Law',
            'Civil Law',
            'Corporate Law',
          ],
        },
        {
          'name': 'Business',
          'courses': [
            'Finance',
            'Accounting',
            'Marketing',
            'Business Administration',
          ],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Civil Engineering',
            'Mechanical Engineering',
            'Electrical Engineering',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱100,000+',
      'budgetAlt': '₱50,000 - ₱100,000',
    },

    {
      'name': 'University of Asia and the Pacific (UA&P)',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Accounting', 'Marketing', 'Finance', 'Management'],
        },
        {
          'name': 'Economics',
          'courses': [
            'Microeconomics',
            'Macroeconomics',
            'Development Economics',
            'Global Economics',
          ],
        },
        {
          'name': 'International Studies',
          'courses': [
            'International Relations',
            'Diplomacy',
            'Global Politics',
            'International Trade',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'San Sebastian College – Recoletos',
      'programs': [
        {
          'name': 'Business',
          'courses': [
            'Marketing',
            'Finance',
            'Accounting',
            'Business Administration',
          ],
        },
        {
          'name': 'Criminology',
          'courses': [
            'Criminal Justice',
            'Forensic Science',
            'Law Enforcement',
          ],
        },
        {
          'name': 'Education',
          'courses': [
            'Teaching English',
            'Secondary Education',
            'Special Education',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'University of the East',
      'programs': [
        {
          'name': 'Business',
          'courses': [
            'Marketing',
            'Finance',
            'Accounting',
            'Business Management',
          ],
        },
        {
          'name': 'Education',
          'courses': ['Teaching English', 'Mathematics', 'Special Education'],
        },
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy'],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Centro Escolar University',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Finance', 'Accounting', 'Marketing', 'Management'],
        },
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy'],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Civil Engineering',
            'Electrical Engineering',
            'Mechanical Engineering',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Pamantasan ng Lungsod ng Maynila',
      'programs': [
        {
          'name': 'Law',
          'courses': [
            'International Law',
            'Criminal Law',
            'Civil Law',
            'Corporate Law',
          ],
        },
        {
          'name': 'Business',
          'courses': [
            'Accounting',
            'Finance',
            'Marketing',
            'Business Administration',
          ],
        },
        {
          'name': 'Public Administration',
          'courses': ['Public Policy', 'Governance', 'Nonprofit Management'],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'University of Makati',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Marketing', 'Finance', 'Business Management'],
        },
        {
          'name': 'IT',
          'courses': [
            'Software Engineering',
            'Cybersecurity',
            'Networking',
            'Data Science',
          ],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Mechanical Engineering',
            'Electrical Engineering',
            'Civil Engineering',
          ],
        },
      ],
      'location': 'Metro Manila',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'University of San Carlos',
      'programs': [
        {
          'name': 'Engineering',
          'courses': [
            'Electrical Engineering',
            'Mechanical Engineering',
            'Civil Engineering',
          ],
        },
        {
          'name': 'Business',
          'courses': ['Marketing', 'Finance', 'Management'],
        },
        {
          'name': 'Design',
          'courses': ['Graphic Design', 'Interior Design', 'Product Design'],
        },
      ],
      'location': 'Cebu',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Far Eastern University – Makati',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Marketing', 'Finance', 'Accounting'],
        },
        {
          'name': 'Technology',
          'courses': [
            'Information Systems',
            'Data Science',
            'Artificial Intelligence',
          ],
        },
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy'],
        },
      ],
      'location': 'Makati',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'University of Negros Occidental – Recoletos',
      'programs': [
        {
          'name': 'Health Sciences',
          'courses': ['Nursing', 'Pharmacy', 'Physical Therapy'],
        },
        {
          'name': 'Education',
          'courses': ['Teaching English', 'Mathematics', 'Special Education'],
        },
        {
          'name': 'Business',
          'courses': ['Marketing', 'Accounting', 'Finance'],
        },
      ],
      'location': 'Bacolod',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
    {
      'name': 'Holy Angel University',
      'programs': [
        {
          'name': 'Business',
          'courses': ['Finance', 'Accounting', 'Marketing'],
        },
        {
          'name': 'Engineering',
          'courses': [
            'Electrical Engineering',
            'Mechanical Engineering',
            'Civil Engineering',
          ],
        },
        {
          'name': 'Law',
          'courses': ['International Law', 'Criminal Law', 'Civil Law'],
        },
      ],
      'location': 'Angeles City',
      'budget': '₱50,000 - ₱100,000',
      'budgetAlt': '₱100,000+',
    },
  ];

  // Function to match universities based on selected programs and budget
  List<Map<String, dynamic>> matchUniversities() {
    return [...universities, ...additionalUniversities].where((university) {
      bool matchesProgram = selectedPrograms.any(
        (program) => university['programs'].contains(program),
      );
      bool matchesLocation = university['location'] == selectedLocation;
      bool matchesBudget =
          university['budget'] == selectedBudget ||
          university['budgetAlt'] == selectedBudget;

      // Return true if program, location, and budget match
      return matchesProgram && matchesLocation && matchesBudget;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to ChooseScreen
          },
        ),
        title: Text('FindMyUni'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Budget selection
            Text('Select your budget range'),
            DropdownButton<String>(
              value: selectedBudget,
              onChanged: (String? newValue) {
                setState(() {
                  selectedBudget = newValue;
                });
              },
              items:
                  <String>[
                    '₱0 - ₱50,000',
                    '₱50,000 - ₱100,000',
                    '₱100,000+',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),

            // Program selection (allow multiple selection)
            SizedBox(height: 20),
            Text('Select your desired programs'),
            Wrap(
              spacing: 10,
              children:
                  allPrograms.map((program) {
                    return FilterChip(
                      label: Text(program),
                      selected: selectedPrograms.contains(program),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedPrograms.add(program);
                          } else {
                            selectedPrograms.remove(program);
                          }

                          // Reset selected courses when a new program is selected
                          if (selected) {
                            selectedCourses = []; // Reset the courses list
                          }
                        });
                      },
                    );
                  }).toList(),
            ),

            // Display courses for selected programs
            SizedBox(height: 20),
            if (selectedPrograms.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    selectedPrograms.map((program) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select courses for $program:'),
                          Wrap(
                            spacing: 10,
                            children:
                                programCourses[program]!.map((course) {
                                  return FilterChip(
                                    label: Text(course),
                                    selected: selectedCourses.contains(course),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedCourses.add(course);
                                        } else {
                                          selectedCourses.remove(course);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                          ),
                        ],
                      );
                    }).toList(),
              ),

            // Displaying selected courses
            SizedBox(height: 20),
            Text(
              'Selected Courses: ${selectedCourses.join(', ')}',
              style: TextStyle(fontSize: 16),
            ),

            // Location preference selection
            SizedBox(height: 20),
            Text('Select your preferred location'),
            DropdownButton<String>(
              value: selectedLocation,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue;
                });
              },
              items:
                  <String>[
                    'Metro Manila',
                    'Regional',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
            ),

            // Submit Button to find matching universities
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // On button press, navigate to the matching results
                if (selectedPrograms.isNotEmpty &&
                    selectedLocation != null &&
                    selectedBudget != null) {
                  List<Map<String, dynamic>> results = matchUniversities();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(results[index]['name']!),
                            subtitle: Text(
                              '${results[index]['programs'].join(', ')} - ${results[index]['location']}',
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
              child: Text('Find Matching Universities'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
