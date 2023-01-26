import 'package:flutter/material.dart';

class MySearchList extends StatelessWidget {
  const MySearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf6f6fa),
      body: Column(
        children: [
          Container(
            height: 132,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Tv shows, movies and more',
                    prefixIcon: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MySearchList()));
                      },
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                    suffixIcon: const Icon(Icons.close),
                    filled: true,
                    fillColor: const Color(0xFFf2f2f6),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
