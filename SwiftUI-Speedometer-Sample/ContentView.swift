//
//  ContentView.swift
//  SwiftUI-Speedometer-Sample
//
//  Created by ekayaint on 31.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct Home : View {
    let colors = [Color("Color1"), Color("Color2")]
    @State var progress : CGFloat = 0
    
    var body: some View{
        VStack{
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
