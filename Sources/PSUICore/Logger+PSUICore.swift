import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    static var psUICore = Logger(subsystem: subsystem, category: "PSUICore")
}
