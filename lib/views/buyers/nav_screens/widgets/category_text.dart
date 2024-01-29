import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  CategoryText({super.key});

  final List<String> _categoryLabels = [
    'album',
    'drama',
    'movie',
    'photo',
    'variety show',
    "MV",
    "Season Greetings"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryLabels.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ActionChip(
                          backgroundColor: Colors.yellow.shade900,
                          onPressed: () {},
                          label: Center(
                            child: Text(
                              _categoryLabels[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
