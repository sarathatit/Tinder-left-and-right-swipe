//
//  CardView.swift
//  TinderClone
//
//  Created by Sarath kumar on 02/08/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var xoffset: CGFloat = 0
    @State private var degree: Double = 0
    @State private var currentImageIndex = 0
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizeConstants.cardWidth,
                        height: SizeConstants.cardHeight
                    )
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xoffset, screenCutOff: SizeConstants.screenCutOff)
            }
            
            
            UserInfoView(user: user)
                .frame(width: SizeConstants.cardWidth)
        }
        .frame(
            width: SizeConstants.cardWidth,
            height: SizeConstants.cardHeight
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .offset(x: xoffset)
        .rotationEffect(.degrees(degree))
        .animation(.snappy, value: xoffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    onDrageChanged(value)
                }).onEnded({ value in
                    onDrageEnded(value)
                })
        )
        
    }
}

private extension CardView {
    var user: User {
        model.user
    }
    
    var imageCount: Int {
        model.user.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xoffset = 0
        degree = 0
    }
    
    func swipeRight() {
        xoffset = 500
        degree = 12
    }
    
    func swipeLeft() {
        xoffset = -500
        degree = -12
    }
}

private extension CardView {
    
    func onDrageChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xoffset = value.translation.width
        degree = Double(value.translation.width / 25)
    }
    
    func onDrageEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) < abs(SizeConstants.screenCutOff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    CardView(model: CardModel(user: MockData.users[1]))
}
