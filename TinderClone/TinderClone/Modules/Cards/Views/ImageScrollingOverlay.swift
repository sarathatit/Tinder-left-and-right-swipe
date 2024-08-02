//
//  ImageScrollingOverlay.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    if currentImageIndex > 0 {
                        currentImageIndex -= 1
                    }
                }
            Rectangle()
                .onTapGesture {
                    if currentImageIndex < imageCount - 1 {
                        currentImageIndex += 1
                    }
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 2)
}
