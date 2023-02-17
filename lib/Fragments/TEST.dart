import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class TEST extends StatefulWidget {
  const TEST({super.key});

  @override
  State<TEST> createState() => _TESTState();
}

class _TESTState extends State<TEST> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // homepage2KSH (85:33)
      padding: EdgeInsets.fromLTRB(13, 109, 12, 204),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // autogroupclbj8ed (LZZ1XtnRNekZQ1r9HXcLbj)
            margin: EdgeInsets.fromLTRB(0, 0, 0, 58),
            width: double.infinity,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  // autogrouptpa1DAH (LZZ1mtP73k7F5NexNwTPa1)
                  padding: EdgeInsets.fromLTRB(0, 2, 23, 0),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // ligaWfB (85:43)
                        margin: EdgeInsets.fromLTRB(0, 0, 24, 0),
                        padding: EdgeInsets.fromLTRB(10, 10, 8, 11.33),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffff0000)),
                          color: Color(0xa0ff0000),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Center(
                          // liga1Mvh (85:45)
                          child: SizedBox(
                            width: 40,
                            height: 36.67,
                            child: Image(
                              image: AssetImage('assets/league/LIGA.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // prleague4aD (85:34)
                        margin: EdgeInsets.fromLTRB(0, 0, 23, 0),
                        padding: EdgeInsets.fromLTRB(11, 7, 7, 6),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff5045d0)),
                          color: Color(0xc65045cf),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Center(
                          // prleague1v6d (85:36)
                          child: SizedBox(
                            width: 40,
                            height: 45,
                            child: Image(
                              image: AssetImage('assets/league/PRLEAGUE.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // serieaQXb (85:37)
                        padding: EdgeInsets.fromLTRB(11, 8, 11.1, 10),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xf447bfe5),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Center(
                          // seriea1WKj (85:39)
                          child: SizedBox(
                            width: 35.9,
                            height: 40,
                            child: Image(
                              image: AssetImage('assets/league/SERIE-A.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // league1ctZ (85:40)
                  margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                  width: 60,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        // ellipse88c1 (85:41)
                        left: 1,
                        top: 1,
                        child: Align(
                          child: SizedBox(
                            width: 58,
                            height: 58,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: Color(0xb5428ce3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ligue11R5K (85:42)
                        left: 0,
                        top: 0,
                        child: Align(
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image(
                              image: AssetImage('assets/league/ligue-1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // bandesligaiKK (85:46)
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  padding: EdgeInsets.fromLTRB(10, 12, 8, 10.44),
                  decoration: BoxDecoration(
                    color: Color(0x913c5d90),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Center(
                    // bandesliga1nKB (85:48)
                    child: SizedBox(
                      width: 40,
                      height: 35.56,
                      child: Image(
                        image: AssetImage('assets/league/BANDESLIGA.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // autogroupjuwfhS9 (LZZ2Dsdoav4ECBakQhjuwf)
            margin: EdgeInsets.fromLTRB(10, 0, 166, 241),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // vectorcZ7 (85:56)
                  margin: EdgeInsets.fromLTRB(0, 0, 12.13, 0),
                  width: 21.88,
                  height: 25,
                  // child:
// Image.network(
//   [Image url],
//   width:  21.88,
//   height:  25,
// ),
                ),
                Text(
                  // upcomingmatchWPb (85:54)
                  'Upcoming Match',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000)),
                )
              ],
            ),
          ),
          Container(
            // autogrouptb8vbA9 (LZZ2SsG9rW2ikb3eRatB8V)
            margin: EdgeInsets.fromLTRB(12, 0, 281, 0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // vector6Mo (85:57)
                  margin: EdgeInsets.fromLTRB(0, 0, 13, 1.33),
                  width: 25,
                  height: 16.67,
//   child:
// Image.network(
//   [Image url],
//   width:  25,
//   height:  16.67,
// ),
                ),
                Text(
                  // newsnEd (85:55)
                  'News',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
