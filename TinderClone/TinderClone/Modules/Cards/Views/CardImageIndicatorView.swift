//
//  CardImageIndicatorView.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .red : .gray)
                    .frame(width: indicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

extension CardImageIndicatorView {
    var indicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 20
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 2, imageCount: 4)
}
