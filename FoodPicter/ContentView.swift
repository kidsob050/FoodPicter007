//
//  ContentView.swift
//  FoodPicter
//
//  Created by Bernard Bk on 6/25/23.
//

import SwiftUI

 
struct ContentView: View {
    let food = Food.examples
    @State private var selectedFood: Food?
    var body: some View {
        ScrollView{
            if #available(iOS 15.0, *) {
                VStack(spacing: 30 ) {
                    Group {
                        if selectedFood != .none{
                            Text(selectedFood!.image)
                                .font(.system(size: 200))
                                
                                
                        } else{
                            Image("dinner")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                        }
                    }.frame(height: 250)
                    
                    
                    Text("隨便選個吃吧!")
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 250, height: 80, alignment: .center)
                        .border(.black)
                    if selectedFood != .none {
                        HStack {
                            Text(selectedFood!.name)
                                .font(.largeTitle)
                                .foregroundColor(.pink)
                                .id(selectedFood!.name)
                                .transition(.asymmetric(
                                    insertion: .opacity
                                        .animation(.easeInOut(duration:0.5).delay(0.2)),
                                    removal: .opacity
                                    .animation(.easeInOut(duration: 0.4))))
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.secondary)
                        }
                        Text("熱量 \(selectedFood!.calorie.formatted())大卡")
                        HStack {
                            VStack (spacing: 12){
                                Text("蛋白質")
                                Text(selectedFood!.protein.formatted() + "g")
                            }
                            
                            Divider().frame(width: 1).padding(.horizontal)
                            VStack (spacing: 12){
                                Text("脂肪")
                                Text(selectedFood!.fat.formatted() + "g")
                            }
                            Divider().frame(width: 1).padding(.horizontal)
                            VStack (spacing: 12){
                                Text("碳水")
                                Text(selectedFood!.carb.formatted() + "g")
                            }
                        }
                        .font(.title2)
                        .padding(.horizontal)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
                        
                        
                        Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                            GridRow {
                                Text("蛋白質")
                                Text("脂肪")
                                Text("碳水")
                            }.frame(width: 50).background(.blue)
                            
                            Divider()
                                .gridCellUnsizedAxes(.horizontal)
                                .padding(.horizontal, -10)
                            
                            GridRow {
                                Text(selectedFood!.protein.formatted() + "g")
                                Text(selectedFood!.fat.formatted() + "g")
                                Text(selectedFood!.carb.formatted() + "g")
                            }
                        }
                        .font(.title2)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
                    }
                    
                    Spacer().layoutPriority(1)
                    
                    
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
                .frame(maxWidth: .infinity)
                .font(.title)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .animation(.easeInOut(duration: 0.6), value: selectedFood)
            }
        }.background(Color(.secondarySystemBackground))
    }
}

extension ContentView {
    init (selectedFood: Food) {
        _selectedFood = State(wrappedValue: selectedFood)
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedFood: .examples.first!)
    }
}
