//
//  ContentView.swift
//  Machine game
//
//  Created by vipin on 27/11/24.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return  Path { path in
            let p1 = CGPoint( x: 0, y: 20)
            let p2 = CGPoint( x: 0, y: rect.height - 20)
            let p3 = CGPoint( x: rect.width/2, y: rect.height)
            let p4 = CGPoint( x: rect.width, y: rect.height - 20)
            let p5 = CGPoint( x: rect.width, y: 20)
            let p6 = CGPoint( x: rect.width/2, y: 0)
            
            path.move(to: p6)
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 10)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 10)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 10)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 10)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 10)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 10)

        }
    }
    
}


enum Choice : Int , Identifiable {
    var id : Int {
        rawValue
    }
    case success
    case failure
}


struct ContentView: View {
    @State public var symbols = ["cap" , "man" , "thor"]
    @State public var numbers = [0,1,2]
    @State public var counter = 0
    @State private var showingAlert : Choice?
    
    var body: some View {
        ZStack{
            Image("avengers").resizable().ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 70){
                HStack {
                    Image("fire").resizable().scaledToFit().frame(width: 70, height: 70).shadow(color : .black , radius : 3  , x : 5 , y : 5)
                    Text("Slot Machine")
                        .font(.system(size: 35))
                        .fontWeight(.black)
                        .shadow(color: .orange , radius: 3 , x: 5 , y: 5)
                    Image("fire").resizable().scaledToFit().frame(width: 70, height: 70).shadow(color : .black , radius : 3  , x : 5 , y : 5)
                } .frame(width : .infinity ,height : 50 , alignment : .center)
                VStack(spacing :45){
                    HStack(spacing : 100){
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100 , height: 120 , alignment: .center).overlay(Image(symbols[numbers[0]])
                                .resizable()
                                .scaledToFit()
                                .frame(width : 80 , height : 80 , alignment: .center)
                                .shadow(color : .gray , radius : 4 , x :4 , y: 5)
                                                                                          
                            )
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100 , height: 120 , alignment: .center).overlay(Image(symbols[numbers[1]])
                                .resizable()
                                .scaledToFit()
                                .frame(width : 80 , height : 80 , alignment: .center)
                                .shadow(color : .gray , radius : 4 , x :4 , y: 5)
                                                                                          
                            )
                    }
                    Hexagon()
                        .fill(Color.white.opacity(0.8))
                        .frame(width: 100 , height: 120 , alignment: .center).overlay(Image(symbols[numbers[2]])
                            .resizable()
                            .scaledToFit()
                            .frame(width : 80 , height : 80 , alignment: .center)
                            .shadow(color : .gray , radius : 4 , x :4 , y: 5)
                                                                                      
                        )
                    HStack(spacing : 100){
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100 , height: 120 , alignment: .center).overlay(Image(symbols[numbers[0]])
                                .resizable()
                                .scaledToFit()
                                .frame(width : 80 , height : 80 , alignment: .center)
                                .shadow(color : .gray , radius : 4 , x :4 , y: 5)
                                                                                          
                            )
                        Hexagon()
                            .fill(Color.white.opacity(0.8))
                            .frame(width: 100 , height: 120 , alignment: .center).overlay(Image(symbols[numbers[1]])
                                .resizable()
                                .scaledToFit()
                                .frame(width : 80 , height : 80 , alignment: .center)
                                .shadow(color : .gray , radius : 4 , x :4 , y: 5)
                                                                                          
                            )
                      }
                 }
                Button{
                    self.numbers[0] = Int.random(in : 0...self.symbols.count-1)
                    self.numbers[1] = Int.random(in : 0...self.symbols.count-1)
                    self.numbers[2] = Int.random(in : 0...self.symbols.count-1)
                    
                    
                    counter+=1
                    
                    
                    if Set(self.numbers).count == 1 { // If all elements in numbers are the same
                        self.showingAlert = .success // Show success alert if all numbers match
                        counter = 0
                    }
                    
                   
                     if counter > 5 {
                        self.showingAlert = .failure
                        counter = 0
                    }
                   
                    
                } label : {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.blue.opacity(0.8))
                        .overlay(Text("Spin")
                            .fontWeight(.black)
                            .font(.title)
                        )
                        .foregroundColor(.white)
                        .frame(width : 200 , height : 50 , alignment: .center )
                        .shadow(color : .black , radius : 2 , x : 4 , y : 4)
                }
            }
            .alert(item: $showingAlert) { alert -> Alert in
                switch alert {
                 case .success:
                     return Alert(title: Text("You Won"), message: Text("Born with charm and a smile !!!"), dismissButton: .cancel())
                 case .failure:
                     return Alert(title: Text("Oops, you lost"), message: Text("Better luck next time"), dismissButton: .cancel())
                 }
            }
                
            }
        }
    }


#Preview {
    ContentView()
}


