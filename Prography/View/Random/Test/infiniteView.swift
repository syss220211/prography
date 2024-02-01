//
//  infiniteView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI

struct InfiniteCardSwipeView: View {
    @State private var offset: CGFloat = 0

    let cardData: [CardModel] // Assuming you have a model to represent your card data

    var body: some View {
        ZStack {
            ForEach(cardData.indices, id: \.self) { index in
                CardView(card: cardData[index])
                    .offset(x: calculateOffset(for: index))
            }
        }
        .gesture(DragGesture()
            .onChanged { value in
                withAnimation {
                    offset = value.translation.width
                }
            }
            .onEnded { value in
                withAnimation {
                    if value.predictedEndTranslation.width > 100 {
                        offset = UIScreen.main.bounds.width
                    } else if value.predictedEndTranslation.width < -100 {
                        offset = -UIScreen.main.bounds.width
                    } else {
                        offset = 0
                    }
                }
            }
        )
    }

    private func calculateOffset(for index: Int) -> CGFloat {
        let cardWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 20
        let totalOffset = CGFloat(index) * (cardWidth + spacing)
        return totalOffset - offset
    }
}

struct CardModel {
    // Add properties relevant to your card data
}

struct CardView: View {
    let card: CardModel

    var body: some View {
        // Customize your card view here using the provided card data
        Text("Card Content")
            .frame(width: UIScreen.main.bounds.width - 40, height: 200)
            .background(Color.blue)
            .cornerRadius(16)
    }
}

struct InfiniteCardSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        let cardData = [CardModel(), CardModel(), CardModel()] // Sample card data
        InfiniteCardSwipeView(cardData: cardData)
    }
}
