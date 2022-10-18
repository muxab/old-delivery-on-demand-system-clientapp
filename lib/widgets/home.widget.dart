import 'package:client/statics/fonts.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.name,
    required this.company,
    required this.isRep,
  }) : super(key: key);

  final String name;
  final String company;
  final bool isRep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
        ),
        child: Card(
          elevation: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 80,
                        width: 60,
                        child: Icon(Icons.person),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: darkMediumText(name),
                        ),
                        darkSmallText(isRep ? company : ""),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
