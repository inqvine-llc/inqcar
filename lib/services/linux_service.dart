class LinuxService {
  static final LinuxService _instance = LinuxService._();
  LinuxService._();
  static LinuxService getInstance() {
    return _instance;
  }
}
