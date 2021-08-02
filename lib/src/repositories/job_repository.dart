import 'dart:convert';

import 'package:careerfinder/src/models/job_model.dart';

import 'package:http/http.dart' as http;

class JobRepository {
  Future<List<JobModel>> fetchJobs() async {
    List<JobModel> jobList = [];
    try {
      var response = await http.get(Uri.parse(
          "https://career-finder.aaratechnologies.in/job/api/all_job"));
    //  print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
     //   print(data);
        if (data["staus"] == "true") {
          for (var item in data["data"]) {
            JobModel jobModel = new JobModel.fromJson(item);
            jobList.add(jobModel);
          }
        }
      }
      return jobList;
    } catch (e) {
      print(e);
      return jobList;
    }
  }
}
