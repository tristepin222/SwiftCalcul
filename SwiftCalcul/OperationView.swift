//
//  OperationView.swift
//  SwiftCalcul
//
//  Created by tristepin222 on 15.03.2024.
//

import SwiftUI


struct OperationView: View {

    @ObservedObject var viewModel: OperationViewModel
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            
            VStack {
                Spacer()

                // Text display
                HStack {
                    Spacer()
                    Text(viewModel.value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                // Our buttons
                ForEach(viewModel.buttons, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                viewModel.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(0)
                            })
                        }
                    }
                    .padding(-3)
                }
                
            }
        }
    }


    func buttonWidth(item: ButtonType) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (0)) / 4
    }

    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.height - (5*40)) / 5
    }
}
