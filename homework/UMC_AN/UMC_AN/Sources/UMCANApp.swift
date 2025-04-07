import SwiftUI

@main
struct UMCANApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabBar()
            } else {
                LoginView()
            }
        }
    }
}
