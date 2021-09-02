import 'package:flutter/material.dart';
import 'package:starwars_app/models/people_model.dart';
import 'package:starwars_app/theme.dart/text_style.dart';

class DetailScreen extends StatelessWidget {
  final People people;

  const DetailScreen({
    Key? key,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General Information',
                style: headingTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Name',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.name,
                    style: titleTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Height',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.height + ' cm',
                    style: titleTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Mass',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.mass + ' kg',
                    style: titleTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Hair Color',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.hairColor,
                    style: titleTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Skin Color',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.skinColor,
                    style: titleTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Birth Year',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    people.birthYear,
                    style: titleTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Vehicles Information',
                style: headingTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              people.vehicles.length == 0
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              people.vehicles[index],
                              style: titleTextStyle,
                            ),
                            Divider(
                              height: 40,
                              thickness: 1,
                            )
                          ],
                        );
                      },
                      itemCount: people.vehicles.length,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
