//
//  Background.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-20.
//

import SwiftUI

struct Background: View {
    
    @State private var var_x1 = 1
    @State private var var_x2 = 1
    @State private var var_x3 = 1
    @State private var var_x4 = 1
    @State private var var_x5 = 1
    
    var blurred: Bool
    
    var body: some View {
//        if blurred{
            ZStack{
                
                Rectangle().fill(Color.gray)
                
                
                Capsule().fill(Color(red: 0.4627, green: 0.8392, blue: 1.0))
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .padding(.top, 40)
                    .padding(.bottom, 40)
                    .border(Color.blue, width: 0.5)
                    .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 15).padding(.trailing,15).padding(.bottom, 20).padding(.top, 10))
                
                    .overlay(Capsule().stroke(Color.black, lineWidth: 4.0).padding(.leading, 35).padding(.trailing,35).padding(.bottom, 40).padding(.top, 40))
                    
                    
                    
                Circle().trim(from: 0.5, to: 1.0).opacity(0)
                    .background(Circle().trim(from: 0.5, to: 1.0).foregroundColor(Color.black))
//                    .trim(from: 0.5, to: 1)
                    .padding(.leading, 35)
                    .padding(.trailing,35)
                    .padding(.bottom,500)
                    
//                can't fill and trim at the same time
                    
                    
//                    .strokeBorder(Color.black, lineWidth: 20)
//                    .background(Circle().fill(Color.blue))
                
                
                
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 120,height: 100)
                    .offset(x: CGFloat(350*Double(var_x1) + 1.0), y: 10)
                    .animation(.easeInOut(duration: 6).repeatForever(autoreverses: false))
                    .onAppear { self.var_x1 *= -1}
                
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x2) + 1.0), y: 200)
                    .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false))
                    .onAppear { self.var_x2 *= -1}
                
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x3) + 10.0), y: 150)
                    .animation(.easeInOut(duration: 12).repeatForever(autoreverses: false))
                    .onAppear { self.var_x3 *= -1}
                
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 120,height: 100)
                    .offset(x: CGFloat(350*Double(var_x4) + 5.0), y: -70)
                    .animation(.easeInOut(duration: 8).repeatForever(autoreverses: false))
                    .onAppear { self.var_x4 *= -1}
                
                Image(systemName: "cloud")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .offset(x: CGFloat(350*Double(var_x5) + 10.0), y: -120)
                    .animation(.easeInOut(duration: 15).repeatForever(autoreverses: false))
                    .onAppear { self.var_x5 *= -1}
                
                
                
                
                Rectangle().fill(Color.gray).border(width: 3,edges: [.leading],color: .black)
                    .padding(.leading, 378)
                    .padding(.trailing, 0)
                    .padding(.top, 213)
                    .padding(.bottom, 200)
                
                Rectangle().fill(Color.gray).border(width: 3,edges: [.trailing],color: .black)
                    .padding(.leading, 0)
                    .padding(.trailing, 378)
                    .padding(.top, 213)
                    .padding(.bottom, 200)
                    
                    
                    
                    
        
                
                
                
                
          }
//            .background(Color.gray)
            .ignoresSafeArea()
        
            
        
    }
    
}
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(blurred: false)
    }
}
