//
//  Categories.swift
//  XconTest
//
//  Created by GH on 2024/3/19.
//

import SwiftUI

struct Categories: View {
    let items = Array(1...10)
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        Rectangle()
                            .scaledToFit()
                            .foregroundStyle(.black.opacity(0.5))
                            .background {
                                Image("sampleImage")
                                    .resizable()
                                    .scaledToFill()
                            }
                            .overlay {
                                Text("Placeholder")
                                    .font(.title)
                                    .foregroundStyle(.quaternary)
                                    .bold()
                            }
                            .clipped()
                    }
                }
                .padding(.horizontal, 10)
            }
            .toolbar {
                ToolbarItem {
                    Text("pup")
                }
            }
        }
    }
}

#Preview {
    Categories()
}
