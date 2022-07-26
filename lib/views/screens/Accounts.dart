import 'package:flutter/material.dart';
import '../../common/widgets/constants.dart';

class Accounts extends StatelessWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Christopher\nSomoye',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white70,
                      backgroundImage: NetworkImage(
                        'https://search.brave.com/images?origin=search&q=Image%20of%20Elon%20musk',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 5, 8, 8),
                child: TextButton(
                  onPressed: () {},
                  // style: ButtonStyle(
                  //   backgroundColor: ,
                  // ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: kMainPrimaryColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '5.0',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
