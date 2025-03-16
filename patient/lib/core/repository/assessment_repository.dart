abstract interface class AssessmentsRepository {
  // The abstract repository class will define the methods that the repository must implement.
  Future<List<Map<String, dynamic>>> fetchAssessmentById(String id);
  Future<void> submitAssessment(Map<String, dynamic> assessment);
}
