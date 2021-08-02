import 'package:careerfinder/src/models/job_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class JobEvents extends Equatable {
  const JobEvents();

  @override
  List<Object> get props => [];
}

class StartEvent extends JobEvents {}


class JobLoadedEvent extends JobEvents{
    final List<JobModel> jobModelList;
  JobLoadedEvent({@required this.jobModelList});
}

class LoggedoutEvent extends JobEvents{}