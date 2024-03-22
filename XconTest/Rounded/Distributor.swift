//
//  Distributor.swift
//  XconTest
//
//  Created by GH on 2024/3/20.
//

import SwiftUI

struct Distributor: View {
    @State var productType: ProductType = .case3
    @Namespace var animation

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Circle()
                    .frame(height: 50)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .fontWeight(.light)
                    
                    Text("Placeholder")
                        .font(.title)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                }
                .symbolRenderingMode(.hierarchical)
                .font(.largeTitle)
                .tint(.primary)
                .padding(.trailing, 8)
            }
            .background {
//                Capsule()
//                    .stroke(lineWidth: 1)
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 22) {
                    ForEach(ProductType.allCases, id: \.self) { type in
                        ProductTypeView(type: type)
                    }
                }
                .padding(.horizontal, 25)
            }
            
            ForEach(1..<5, id: \.self) { _ in
                VStack(alignment: .leading) {
                    Text("Placeholder")
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.background)
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .background(Color(uiColor: .systemGray6))
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType) -> some View {
        Button {
            withAnimation {
                productType = type
            }
        } label: {
            Text(type.rawValue)
                .tracking(1)
                .bold()
                .fontDesign(.rounded)
                .foregroundStyle(productType == type ? .pink : .gray)
                .padding(.bottom, 15)
                .overlay {
                    if productType == type {
                        Capsule()
                            .frame(height: 3)
                            .offset(y: 10)
                            .foregroundStyle(.pink)
                        //  自定义高亮动画
                            .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                    }
                }
        }
    }
}

#Preview {
    Distributor()
}

enum ProductType: String, CaseIterable {
    case case1
    case case2
    case case3
    case case4
}

