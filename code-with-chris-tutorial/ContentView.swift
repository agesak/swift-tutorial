//
//  ContentView.swift
//  code-with-chris-tutorial
//
//  Created by Kareha on 1/25/21.
//

//link pages and include buttons

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
//            GeometryReader { geometry in
                        MainView()
//                            .frame(width: geometry.size.width, height: geometry.size.height)
//                    }
            
            Spacer()
            
            Image("dog").resizable().aspectRatio(contentMode: .fit)
            
            Spacer()
            
            HStack() {
                Spacer()
                Text("Hello!").padding().background(Color.blue)
                Text("Hello world")
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    var body: some View {
        Button(action: {
            print("Open the side menu")
        }) {
            Text("Show Menu")
        }
    }
}
