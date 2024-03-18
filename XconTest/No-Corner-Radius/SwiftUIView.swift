//
//  SwiftUIView.swift
//  XconTest
//
//  Created by GH on 2024/3/18.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isInventory = true

    var body: some View {
            NavigationStack {
                TabView {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            // 使用LazyVStack配合pinnedViews来实现标题固定效果
                            LazyVStack(pinnedViews: [.sectionHeaders]) {
                                // 第一个分组
                                Section(header: headerView(title: "分组 1")) {
                                    // 这里填充第一个分组的内容
                                    ForEach(0..<5) { item in
                                        Text("分组 1 - 项目 \(item)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(10)
                                    }
                                }

                                // 第二个分组
                                Section(header: headerView(title: "分组 2")) {
                                    // 这里填充第二个分组的内容
                                    ForEach(0..<5) { item in
                                        Text("分组 2 - 项目 \(item)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        .ignoresSafeArea()
                    }
                    .tabItem {
                        Label("Tab 1", systemImage: "1.circle")
                    }
                    
                    Text("Placeholder")
                        .tabItem {
                            Label("Tab 2", systemImage: "2.circle")
                        }
                }
            }
        }

        // 创建一个函数来生成每个分组的头部视图
        @ViewBuilder
        func headerView(title: String) -> some View {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
        }
}

#Preview {
    SwiftUIView()
}
