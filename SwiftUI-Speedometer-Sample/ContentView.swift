//
//  ContentView.swift
//  SwiftUI-Speedometer-Sample
//
//  Created by ekayaint on 31.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home : View {
    let colors = [Color("Color1"), Color("Color2")]
    @State var progress : CGFloat = 0
    
    var body: some View{
        VStack{
            Speedometer(progress: $progress)
            HStack(spacing: 25){
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)){
                        progress = (progress + 10) > 100 ? 100 : progress + 10
                    }
                    
                }) {
                    Text("Update")
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }.background(Capsule()
                    .stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)){
                        progress = 0
                    }
                }) {
                    Text("Reset")
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }.background(Capsule()
                    .stroke(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                
            } //: HStack
            .padding(.top, 55)
        } //: VStack
    }
}

struct Speedometer : View {
    let colors = [Color("Color1"), Color("Color2")]
    @Binding var progress : CGFloat
    
    func setProgress() -> CGFloat {
        return (progress / 2) * 0.01
    }
    
    func setArrow() -> Double{
        let value = progress / 100
        return Double(value*180)
    }
    
    var body: some View{
        ZStack {
            ZStack{
                Circle().trim(from: 0, to: 0.5)
                    .stroke(Color.black.opacity(0.1), lineWidth: 55)
                    .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: 180))
                
                Circle().trim(from: 0, to: setProgress())
                    .stroke(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .init(degrees: 180)), lineWidth: 55)
                    .frame(width: 280, height: 280)
                    .rotationEffect(.init(degrees: 180))
            } //: ZStack
            
            ZStack(alignment: .bottom){
                colors[0].frame(width: 2, height: 95)
                Circle().fill(colors[0]).frame(width: 15, height: 15)
            } //: ZStack
            .offset(y: -35)
            .rotationEffect(.init(degrees: -90))
            .rotationEffect(.init(degrees: setArrow()))
            
        } //: ZStack
        .offset(y: 140)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
