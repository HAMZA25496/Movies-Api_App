import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class  DetailScreen extends StatefulWidget {
  String imgPath;
  String overView;
  String title;
  String releaseDateText;
   DetailScreen(this.imgPath,this.releaseDateText,this.title,this.overView, {super.key} );

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var isScreenPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: isScreenPortrait?   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.imgPath}',),
                        fit: BoxFit.cover)),
                height: size.height * 0.50,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Watch',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                     Text(
                      'In Theaters ${widget.overView}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            minimumSize: const Size(169.0, 50.0),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Get Tickets',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 45,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1.5,color: Colors.lightBlueAccent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          )

                        ),

                        icon: const Icon(Icons.play_arrow,color: Colors.white,),
                        label: const Text(
                          'Watch Trailor',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 34.0,
                    )
                  ],
                )),
            const SizedBox(
              height: 27.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Genres',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          backgroundColor: Colors.teal),
                      onPressed: () {},
                      child: const Text("Action")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          backgroundColor: const Color(0xFFE26CA5)),
                      onPressed: () {},
                      child: const Text("Thriller")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          backgroundColor: const Color(0xFF564CA3)),
                      onPressed: () {},
                      child: const Text("Science")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          backgroundColor: const Color(0xFFCD9D0F)),
                      onPressed: () {},
                      child: const Text("Fiction")),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Overview",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text( widget.releaseDateText,

                  style: GoogleFonts.poppins()),
            ),
          ],
        ): Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imgPath),
                        fit: BoxFit.cover)),
                height: size.height,
                width:  size.width * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 20.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Watch',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'in Theaters Decemeber 22.2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                     Row(
                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(15.0),
                           child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.lightBlueAccent,
                                 minimumSize: const Size(169.0, 50.0),
                               ),
                               onPressed: () {},
                               child: const Text(
                                 'Get Tickets',
                                 style: TextStyle(
                                   fontSize: 14.0,
                                   fontWeight: FontWeight.w600,
                                 ),
                               )),
                         ),
                         const SizedBox(
                           width: 10.0,
                         ),
                         SizedBox(
                           height: 45,
                           child: OutlinedButton.icon(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                                 side: const BorderSide(width: 1.5,color: Colors.lightBlueAccent),
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0)
                                 )),

                             icon: const Icon(Icons.play_arrow,color: Colors.white,),
                             label: const Text(
                               'Watch Trailor',
                               style: TextStyle(
                                   fontSize: 14.0,
                                   color: Colors.white,

                                   fontWeight: FontWeight.w600),
                             ),
                           ),
                         ),
                       ],
                     ),
                    const SizedBox(
                      height: 34.0,
                    )
                  ],
                )),
            const SizedBox(
              height: 27.0,
            ),
            SizedBox(
              width: size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Genres',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                backgroundColor: Colors.teal),
                            onPressed: () {},
                            child: const Text("Action")),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                backgroundColor: const Color(0xFFE26CA5)),
                            onPressed: () {},
                            child: const Text("Thriller")),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                backgroundColor: const Color(0xFF564CA3)),
                            onPressed: () {},
                            child: const Text("Science")),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                backgroundColor: const Color(0xFFCD9D0F)),
                            onPressed: () {},
                            child: const Text("Fiction")),
                      ],
                    ),
                       const SizedBox(
                         height: 30.0,
                       ),

                    const Text(
                      "Overview",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(widget.imgPath,
                        style: GoogleFonts.poppins()),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
