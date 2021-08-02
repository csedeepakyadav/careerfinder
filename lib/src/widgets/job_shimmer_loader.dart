import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class JobShimmerLoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.012, horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.015, horizontal: width * 0.03),
      height: height * 0.24,
      width: width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 3),
            spreadRadius: 4)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: true,
            child: Container(
              color: Colors.white,
              height: height * 0.025,
              width: width * 0.5, 
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Container(
                color: Colors.white,
                height: height * 0.03,
                width: width * 0.15,
              )),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 7,
                          width: width * 0.02,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: 30,
              ),
              Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pin_drop_sharp,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 7,
                          width: width * 0.1,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            height: height * 0.04,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                 
                  child: Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  //  height: height * 0.0,
                  width: width * 0.7,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          enabled: true,
                          child: Container(
                            margin: EdgeInsets.only(left: width * 0.03),
                            color: Colors.white,
                            height: 7,
                            width: width * 0.2,
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
