//
//  Tabs.swift
//  XconTest
//
//  Created by GH on 2024/3/18.
//

import SwiftUI

struct Tabs: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        NavigationStack {
            switch selectedTab {
            case .home:
                Home()
            case .categories:
                Categories()
            case .orders:
                Home()
            case .tracker:
                Home()
            }
            
            HStack {
                Spacer()
                TabButton(icon: "house", tab: .home)
                Spacer()
                TabButton(icon: "square.grid.2x2", tab: .categories)
                Spacer()
                TabButton(icon: "list.clipboard", tab: .orders)
                Spacer()
                TabButton(icon: "mappin.and.ellipse.circle", tab: .tracker)
                Spacer()
            }
            .animation(.linear(duration: 0.1), value: selectedTab)
        }
    }
    
    func TabButton(icon: String, tab: Tab) -> some View {
        Image(systemName: icon)
            .font(.title)
            .fontWeight(.light)
            .symbolVariant(selectedTab == tab ? .fill : .none)
            .foregroundColor(selectedTab == tab ? .blue : .gray)
            .onTapGesture {
                selectedTab = tab
            }
            .shadow(radius: 2)
            .frame(width: 50, height: 50)
    }
}

enum Tab {
    case home
    case categories
    case orders
    case tracker
}

#Preview {
    Tabs()
}
