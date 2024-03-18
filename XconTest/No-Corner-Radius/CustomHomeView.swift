//
//  CustomHomeView.swift
//  XconTest
//
//  Created by GH on 2024/3/16.
//

import SwiftUI

struct CustomHomeView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Categories()
                    .tabItem {
                        Label("Tab 2", systemImage: "2.circle")
                    }
                
                Home()
                    .tabItem {
                        Image(systemName: "1.circle")
                    }
            }
        }
    }
}

struct Categories: View {
    let items = Array(1...10)
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
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
                        .clipped()
                        .overlay {
                            Text("Placeholder")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("aweq")
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

enum sample: String, CaseIterable {
    case a
    case b
    case c
}

#Preview {
    CustomHomeView()
}

struct HeadPoster: View {
    var body: some View {
        VStack(alignment: .leading) {
            //            HStack {
            //                Image(systemName: "person")
            //
            //                Spacer()
            //
            //                Image(systemName: "bell")
            //            }
            //            .font(.title)
            //            .padding(.top, 60)
            
            Text("Welcome to XXX!")
                .font(.title)
                .bold()
                .padding(.top, 160)
            
            Text("Subtitle Subtitle Subtitle")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            TabView {
                ForEach(sample.allCases, id: \.rawValue) { sample in
                    HStack {
                        Image("sampleImage")
                            .resizable()
                            .scaledToFill()
                            .containerRelativeFrame(.horizontal) { wid, _ in
                                wid * 0.4
                            }
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Takoyaki")
                                .fontDesign(.serif)
                                .font(.title3)
                                .bold()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Also known as Chuka Ika Sansai or Squid and Vegetable")
                                
                                Text("Light crispy and chewy texture.")
                                
                                Text("Refreshing and perfect side dish for meal.")
                            }
                            .foregroundStyle(.secondary)
                            .font(.caption2)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(8)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                }
            }
            .tabViewStyle(.page)
            .frame(height: 160)
            .background(Color("CardBackground"))
        }
        .padding(.horizontal)
        .background {
            Rectangle()
                .frame(height: 280, alignment: .top)
                .foregroundStyle(Color(uiColor: .systemMint).opacity(0.5))
                .overlay {
                    Text("Logo")
                        .font(.system(size: 80, design: .rounded))
                        .fontWeight(.black)
                        .opacity(0.2)
                }
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LowInventory: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<8) { _ in
                    VStack {
                        Image("sampleImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 100)
                            .clipped()
                        
                        HStack(spacing: 0) {
                            Text("Cookie Sandwich")
                                .fontWeight(.light)
                                .font(.caption2)
                                .frame(width: 60)
                            
                            Spacer()
                            
                            Text("10")
                                .font(.title2)
                                .frame(alignment: .top)
                            
                            Text("p")
                                .frame(alignment: .bottom)
                        }
                        .padding(.trailing, 4)
                    }
                    .padding(.bottom, 4)
                    .background(Color("CardBackground"))
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .padding(.leading)
    }
}

struct OthersSection: View {
    let series = ["Kani Series", "Unagi Series", "Shrimp Series", "Frozen Fish", "Japanese Products", "Retail Series"]
    
    var body: some View {
        ForEach(series, id: \.self) { series in
            VStack {
                HStack {
                    Text(series)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                
                HStack(spacing: 10) {
                    ForEach(0..<3) { _ in
                        Image("sampleImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
                
                HStack {
                    Spacer()
                    
                    Text("Check")
                        .padding(.vertical, 6)
                        .frame(width: 80)
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .inset(by: 0.5)
                                .stroke(Color.gray)
                        }
                    Text("Order")
                        .foregroundStyle(.background)
                        .frame(width: 80)
                        .padding(.vertical, 6)
                        .background(.primary, in: .rect(cornerRadius: 4))
                }
            }
            .padding()
            .background(Color("CardBackground"))
            .padding(.horizontal)
        }
        
        Spacer()
            .frame(height: 100)
    }
}


//struct InventoryCategory: View {
//    @Binding var isInventory: Bool
//    
//    var body: some View {
//        HStack {
//            Text("Inventory")
//                .frame(maxWidth: .infinity)
//                .foregroundStyle(isInventory ? .primary : .tertiary)
//            
//            Divider()
//                .background(.primary)
//            
//            Text("Category")
//                .foregroundStyle(!isInventory ? .primary : .tertiary)
//                .frame(maxWidth: .infinity)
//        }
//        .font(.title)
//        .padding(.horizontal, 32)
//        .onTapGesture {
//            self.isInventory.toggle()
//        }
//    }
//}

struct Home: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                // MARK: - Header
                HeadPoster()
                
                // MARK: - Switcher
//                InventoryCategory(isInventory: $isInventory)
                
                // MARK: - Content
                HStack {
                    SectionTitle(title: "You are low on...")
                    
                    NavigationLink {
                        
                    } label: {
                        Text("more")
                        
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.primary)
                }
                .padding(.top, 32)
                .padding(.horizontal)
                
                LowInventory()
                
                SectionTitle(title: "Others")
                    .padding(.leading)
                    .padding(.top, 32)
                
                OthersSection()
            }
            .background(Color("MainBackground"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "person")
                        .font(.title3)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "bell")
                        .font(.title3)
                }
            }
        }
        .ignoresSafeArea()
        
    }
}
