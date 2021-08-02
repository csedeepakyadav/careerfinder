import 'package:careerfinder/src/bloc/jobBloc/job_event.dart';
import 'package:careerfinder/src/bloc/jobBloc/job_states.dart';
import 'package:careerfinder/src/repositories/job_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class JobBloc extends Bloc<JobEvents, JobState> {
  JobRepository jobRepository;
  JobBloc({@required JobState initialState, @required this.jobRepository})
      : super(initialState);

  @override
  Stream<JobState> mapEventToState(JobEvents event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = false;
    isLoggedIn = prefs.getBool('loggedIn');

    if (event is StartEvent) {
      yield JobLoadingState();
      try {
        var data = await jobRepository.fetchJobs();
        yield JobLoadedState(jobModelList: data);
      } catch (e) {
        yield JobErrorState(message: "some error occured");
      }
    } else if (event is LoggedoutEvent) {
      await prefs.clear();
      yield LoggedoutState();
    }
  }
}
