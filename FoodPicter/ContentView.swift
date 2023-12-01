//
//  ContentView.swift
//  FoodPicter
//
//  Created by Bernard Bk on 6/25/23.
//

import SwiftUI

 
struct ContentView: View {
    let food = ["漢堡", "沙拉", "披薩", "義大利麵", "炸雞", "刀削麵", "火鍋", "牛肉麵", "關東煮"]
  
    
    
    
    @State private var selectedFood: String?
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(spacing: 30 ) {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("隨便選個吃吧!")
                    .font(.largeTitle)
                    .bold()
                if selectedFood != .none {
                    Text(selectedFood ?? "")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                        .id(selectedFood)
                        .transition(.asymmetric(
                            insertion: .opacity
                                .animation(.easeInOut(duration:0.5).delay(0.2)),
                            removal: .opacity
                                .animation(.easeInOut(duration: 0.4))))
                    
                }
                
                if #available(iOS 15.0, *) {
                    Button(role: .none){
                        selectedFood = food.shuffled() .first { $0 != selectedFood }
                    }label: {
                        Text(selectedFood == .none ? "來選吧！" : "給我別的")
                            .frame(width: 200)
                            .animation(.none, value: selectedFood)
                            .transformEffect(.identity)
                        
                    }
                    .padding(.bottom, -10)
                } else {
                    // Fallback on earlier versions
                }
                
                if #available(iOS 15.0, *) {
                    Button(role: .none){
                        selectedFood = .none
                    }label: {
                        Text("不選了")
                            .frame(width: 200)
                    }
                    .buttonStyle(.bordered)
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(Color(.secondarySystemBackground))
            .font(.title)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .animation(.easeInOut(duration: 0.6), value: selectedFood)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
