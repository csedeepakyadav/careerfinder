import 'package:careerfinder/src/models/job_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

class JobInitState extends JobState {}

class JobLoadingState extends JobState {}

class JobLoadedState extends JobState {
  final List<JobModel> jobModelList;
  JobLoadedState({@required this.jobModelList});
}

class JobErrorState extends JobState {
  final String message;
  JobErrorState({@required this.message});
}


class LoggedoutState extends JobState{}