import 'package:careerfinder/src/bloc/jobBloc/job_event.dart';
import 'package:careerfinder/src/bloc/jobBloc/job_bloc.dart';
import 'package:careerfinder/src/bloc/jobBloc/job_states.dart';
import 'package:careerfinder/src/constants/contants.dart';
import 'package:careerfinder/src/models/job_model.dart';
import 'package:careerfinder/src/widgets/job_card_widget.dart';
import 'package:careerfinder/src/widgets/job_shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  JobBloc _jobBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  handleDrawer() {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  String name = "";

  Future<String> getName() async {
    String userName = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("name");
    return userName;
  }

  @override
  void initState() {
    _jobBloc = BlocProvider.of<JobBloc>(context);
    _jobBloc..add(StartEvent());
    getName().then((userName) {
      setState(() {
        name = userName;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<JobBloc, JobState>(
      listener: (BuildContext context, JobState state) {
        //print(state);
        if (state is LoggedoutState) {
          Navigator.pushReplacementNamed(context, '/preauthscreen');
        }
      },
      builder: (BuildContext context, JobState state) {
        if (state is JobLoadingState) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Stack(
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          enabled: true,
                          child: Container(
                            width: width,
                            height: 50,
                            color: Colors.grey,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Icon(
                                    Icons.sort,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return JobShimmerLoaderWidget();
                        }),
                  ),
                ],
              ),
            ),
          );
        } else if (state is JobLoadedState) {
          List<JobModel> jobModelList = [];
          jobModelList = state.jobModelList;
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              leading: GestureDetector(
                onTap: handleDrawer,
                child: Icon(
                  Icons.sort,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: buttonBgGradient),
              ),
              actions: [
                Icon((Icons.search)),
                SizedBox(
                  width: 20,
                ),
                Icon((Icons.local_drink)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  new Container(
                    height: height * 0.3,
                    decoration: BoxDecoration(gradient: buttonBgGradient),
                    child: new DrawerHeader(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          child: Text(
                            name[0].toUpperCase(),
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: primaryBlue),
                          )),
                    )),
                  ),
                  Container(
                      height: height * 0.77,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: <Widget>[
                              ListTile(
                                title: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                onTap: () {
                                  _scaffoldKey.currentState.openEndDrawer();
                                },
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.black,
                                ),
                              ),
                              Divider(),
                              ListTile(
                                title: Text('Privacy Policy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                leading: Icon(Icons.book, color: Colors.black),
                                onTap: () {},
                              ),
                              Divider(),
                              ListTile(
                                title: Text('Logout',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                leading:
                                    Icon(Icons.logout, color: Colors.black),
                                onTap: () {
                                  _jobBloc..add(LoggedoutEvent());
                                },
                              ),
                            ],
                          ),
                          Container(
                            width: width,
                            color: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "hello",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: jobModelList.length,
                itemBuilder: (context, index) {
                  return JobCard(
                    author: jobModelList[index].author == null
                        ? ""
                        : jobModelList[index].author,
                    designation: jobModelList[index].designation == null
                        ? ""
                        : jobModelList[index].designation,
                    jobLocation: jobModelList[index].jobLocation == null
                        ? ""
                        : jobModelList[index].jobLocation,
                    technology: jobModelList[index].technology == null
                        ? ""
                        : jobModelList[index].technology,
                  );
                }),
          );
        } else if (state is JobErrorState) {
          String error = state.message;

          return Center(child: Text(error));
        } else {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.green,
          ));
        }
      },
    );
  }
}
