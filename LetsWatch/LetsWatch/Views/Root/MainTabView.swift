import SwiftUI

struct MainTabView: View {
    enum Tab: String {
        case home = "Filter"
        case feed = "Feed"
        case history = "History"
    }
    
    @State private var selectedIndex: Tab = .home
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .tabItem {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                    Text(Tab.home.rawValue)
                }
                .tag(Tab.home)
            
            PopularMoviesView()
                .tabItem {
                    Image(systemName: "house")
                    Text(Tab.feed.rawValue)
                }
                .tag(Tab.feed)

            HistoryView()
                .tabItem {
                    Image(systemName: "clock")
                    Text(Tab.history.rawValue)
                }
                .tag(Tab.history)

        }
        .tint(Color("Primary"))
    }
}
