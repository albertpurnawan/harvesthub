abstract class IWorkTasksRemote {
  Future<List<Map<String, dynamic>>> fetchTasks();
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> body);
  Future<Map<String, dynamic>> updateTask(int id, Map<String, dynamic> body);
}

class WorkTasksRemoteStub implements IWorkTasksRemote {
  final String baseUrl;
  const WorkTasksRemoteStub({this.baseUrl = 'https://api.example.com'});

  @override
  Future<List<Map<String, dynamic>>> fetchTasks() async {
    return Future.value(const []);
  }

  @override
  Future<Map<String, dynamic>> createTask(Map<String, dynamic> body) async {
    return Future.value(body);
  }

  @override
  Future<Map<String, dynamic>> updateTask(int id, Map<String, dynamic> body) async {
    return Future.value({...body, 'id': id});
  }
}
