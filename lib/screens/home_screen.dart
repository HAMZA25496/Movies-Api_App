import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieuitest/api/api_controller.dart';
import 'package:movieuitest/screens/detail_screen.dart';
import 'package:movieuitest/movies_list.dart';
import 'package:http/http.dart' as http;
import 'package:movieuitest/models/upcoming_api.dart';
import 'package:provider/provider.dart';
import '../provider/search_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool searchOpt = true;
  //
  // List<UpcomingApiClass> upcomingApi = [];
  //
  // Future<List<UpcomingApiClass>?> apicall() async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/upcoming?api_key=93adf2f46c9055080f4690b7b3bdd363'));
  //   var dataList = jsonDecode(response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in dataList) {
  //       List<UpcomingApiClass> upcomingApi = [];
  //
  //       upcomingApi.add(UpcomingApiClass.fromJson(index));
  //     }
  //     return upcomingApi;
  //   } else {
  //     return upcomingApi;
  //   }
  // }

  // bool SearchOpt = false;
  // bool searchOpt =true ;

  TextEditingController textController = TextEditingController();

  // @override
  // void initState() {
  //     // _foundmovies = _movies;
  //   super.initState();
  // }
  //
  //    void _runFilter( String enteredKeyword){
  //      List<Map<String, dynamic>>? results =[];
  //      if(enteredKeyword.isEmpty){
  //        results =_movies;
  //      }
  //      else{
  //        // results=_foundmovies.where((user) =>
  //      }
  //
  //    }
  late Future<UpComingApiModel> futureData;

  @override
  void initState() {
    futureData = ApiController().getApiData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchServiceModel>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print("Build Widget call ");
    }
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFf6f6fa),
            body: SingleChildScrollView(child: Consumer<SearchServiceModel>(
                builder: (BuildContext context, searchservice, child) {
              return Column(children: [
                searchservice.searchOpt
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              'Watch',
                              style: TextStyle(fontSize: 20),
                            ),
                            const Spacer(),
                            Consumer<SearchServiceModel>(
                                builder: (context, value, child) {
                              return IconButton(
                                  onPressed: () {
                                    value.searchOptScreen(false);
                                  },
                                  icon: const Icon(Icons.search));
                            }
                            )
                          ],
                        ),
                      )
                    : Container(
                        color: const Color(0xffFFFFFF),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0, bottom: 25.0),
                          child: Card(
                            // color: Constants.lightThemeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ListTile(
                              horizontalTitleGap: 0.0,
                              leading: GestureDetector(
                                onTap: () {
                                  // widget.showSearchedList();
                                  // servicesServices.showSearchedListFun(true);
                                },
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              title: TextField(
                                controller: textController,

                                onChanged: (value) {
                                  setState(() {
                                    // showOrgList= true;

                                    // movies.where((element) => element.toString().contains(value)).toList();
                                  });
                                },
                                // controller: widget.searchTextController,
                                // decoration: Constants.textFieldDecoration,
                                // onChanged: (val) {
                                // servicesServices.showSmallCardsFun(true);
                                // if(widget.searchTextController.text.isNotEmpty){
                                // servicesServices.showOrigenalListFun(false);
                                // }else{
                                // servicesServices.showOrigenalListFun(true);
                                // }
                                // },
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                // onChanged: onSearchTextChanged,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setState(() {
                                    textController.text = "";
                                  });
                                  // widget.searchTextController.clear();
                                  // // widget.hideSmallCards();
                                  // // widget.hideSearchedList();
                                  // servicesServices.showSearchedListFun(false);
                                  // servicesServices.showSmallCardsFun(false);
                                  // onSearchTextChanged('');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15.0,
                ),
                Consumer<SearchServiceModel>(
                    builder: (context, searchService, child) {
                  return FutureBuilder<UpComingApiModel>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return searchService.searchOpt
                              ? SizedBox(
                                  height: 700,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0, top: 10.0),
                                    child: ListView.builder(
                                        itemCount:
                                            snapshot.data?.results?.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailScreen(snapshot.data?.results![index].posterPath, snapshot.data?.results![
                                                                        index].overview, snapshot.data?.results![index].title, snapshot.data
                                                                    ?.results![
                                                                        index]
                                                                    .releaseDate)));
                                              },
                                              child: Card(
                                                elevation: 0,
                                                shadowColor: Colors.black,
                                                child: Container(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .bottomStart,
                                                  width: 163.0,
                                                  height: 180.0,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${snapshot.data?.results![index].posterPath}'),
                                                        fit: BoxFit.cover,
                                                      )),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            bottom: 15.0),
                                                    child: Text(
                                                      snapshot
                                                          .data
                                                          ?.results![index]
                                                          .title,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )
                              : textController.text.isEmpty
                                  ? SizedBox(
                                      height: 700.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: GridView.builder(
                                            itemCount:
                                                snapshot.data?.results?.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3 / 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10,
                                            ),
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailScreen(
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .posterPath,
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .overview,
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .title,
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .releaseDate)));
                                                },
                                                child: Container(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .bottomStart,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data?.results![index].posterPath}'),
                                                        fit: BoxFit.fill,
                                                      )),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20.0,
                                                            bottom: 15.0),
                                                    child: Text(
                                                      snapshot
                                                          .data
                                                          ?.results![index]
                                                          .title,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 40.0),
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Top Results',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const Divider(
                                          indent: 20.0,
                                          endIndent: 20.0,
                                        ),
                                        SizedBox(
                                          height: size.height,
                                          child: ListView.builder(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              itemCount: snapshot
                                                  .data?.results?.length,
                                              itemBuilder: (context, index) {
                                                return snapshot.data!
                                                        .results![index].title
                                                        .toLowerCase()
                                                        .contains(textController
                                                            .text
                                                            .toLowerCase()
                                                            .trim()
                                                            .toString())
                                                    ? Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        20.0,
                                                                    left: 20.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) => DetailScreen(
                                                                            snapshot.data?.results![index].posterPath,
                                                                            snapshot.data?.results![index].overview,
                                                                            snapshot.data?.results![index].title,
                                                                            snapshot.data?.results![index].releaseDate)));
                                                              },
                                                              child: Container(
                                                                height: 100.0,
                                                                width: 130,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10.0),
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              NetworkImage('https://image.tmdb.org/t/p/w600_and_h900_bestv2${snapshot.data?.results![index].posterPath}'),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        )),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 21.0,
                                                          ),
                                                          SizedBox(
                                                            width: 130,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .title,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      ?.results![
                                                                          index]
                                                                      .title,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black12),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              right: 10.0,
                                                            ),
                                                            child: Icon(
                                                              Icons.more_horiz,
                                                              color: Colors
                                                                  .lightBlueAccent,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : Container();
                                              }),
                                        )
                                      ],
                                    );
                        } else
                          return CircularProgressIndicator();
                      });
                })
              ]);
            }))));
  }
}
