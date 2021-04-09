class Job {
  String ref;
  DateTime time;
  int noOfBedrooms;
  List<int> extras;
  String instructions;
  Map location;

  Job(
      {this.time,
      this.noOfBedrooms,
      this.extras = const [],
      this.instructions,
      this.location,
      this.ref});
}
