//
//  StartButton.swift
//  GoFast
//
//  Created by Everton Carneiro on 20/01/21.
//

import SwiftUI

typealias OnClickHandler = (() -> Void)


struct StartButton: View {
    
    @Binding var onClick: OnClickHandler
    
    var body: some View {
        Button(action: onClick ) {
            Image(systemName: "playpause.fill")
                .font(.system(size: 30, weight: .regular))
                .foregroundColor(Color(.systemIndigo))
                .padding(.all, 20)
                .background(Color("button"))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 10)
                .clipShape(Circle())
                
        }
        



    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(onClick: .constant {
            print("ok")
        })
        .previewLayout(.sizeThatFits)
    }
}
