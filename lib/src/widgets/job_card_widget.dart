import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String designation;
  final String author;
  final String jobLocation;
  final String technology;

  JobCard({@required this.designation, @required this.author, @required this.jobLocation, @required this.technology});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.012, horizontal: width * 0.02),
          padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.03),
      height: height * 0.26,
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
          Text(
            designation,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Text(
            author,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.4),
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
                    Text(
                      "2-3",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.4),
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
                    Text(
                      jobLocation,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
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
                Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
               Container(
               //  height: height * 0.0,
                 width: width * 0.7,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount:technology.split(' ') == null ? 0 : technology.split(' ').length,

                   itemBuilder: (context, index)
                 {
                   return  Text(
                    "${technology.split(' ')[index]} , ",
                    style: TextStyle(fontSize: 14, color: Colors.black),
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
