import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_bloc/data/Models/user/user.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = '/users';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('${args.name}'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'name : ${args.name ?? ''}',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'username : ${args.username ?? ''}',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'email : ${args.email ?? ''}',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'address:',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'street : ${args.address!.street ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                      sizedBox(),
                      Row(
                        children: [
                          Text(
                            'suite: ${args.address!.suite ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                      sizedBox(),
                      Row(
                        children: [
                          Text(
                            'city : ${args.address!.city ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                      sizedBox(),
                      Row(
                        children: [
                          Text(
                            'zipcode : ${args.address!.zipcode ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'geo:',
                      style: myStyle(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'lat : ${args.address!.geo!.lat ?? ''}',
                            style: myStyle2(),
                          ),
                          sizedBox(),
                          Text(
                            'lng : ${args.address!.geo!.lng ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'email : ${args.phone ?? ''}',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'website : ${args.website ?? ''}',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Row(
                  children: [
                    Text(
                      'company info :',
                      style: myStyle(),
                    ),
                  ],
                ),
                sizedBox(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name: : ${args.company!.name ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                      sizedBox(),
                      Row(
                        children: [
                          Text(
                            'Phrase : ${args.company!.catchPhrase ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                      sizedBox(),
                      Row(
                        children: [
                          Text(
                            'BS: : ${args.company!.bs ?? ''}',
                            style: myStyle2(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle myStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle myStyle2() {
  return TextStyle(fontSize: 16);
}

SizedBox sizedBox() {
  return SizedBox(
    height: 15,
  );
}
