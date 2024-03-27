abstract class IServerStrategy {
  String url = "";
  String scheme = "http";
  int timeout = 30000;
}

class ITestServerImpl implements IServerStrategy {
  @override
  String scheme = "http";

  @override
  int timeout = 30000;

  @override
  String url = "20.244.97.117";
}

class ILiveServerImpl implements IServerStrategy {
  @override
  String scheme = "http";

  @override
  int timeout = 30000;

  @override
  String url = "20.244.97.117";
}
