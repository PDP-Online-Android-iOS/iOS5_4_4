//
//  ContentView.swift
//  Task 4
//
//  Created by Ogabek Matyakubov on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingAlert = false
    @State var isSheet = false
    
    var actionSheet: ActionSheet {
        let title = "iOS"
        let message = "Here we go"
        return ActionSheet(title: Text(title), message: Text(message), buttons: [
            .default(Text("OK"), action: {
                print("OK Pressed")
            }),
            .destructive(Text("NO"), action: {
                print("NO Pressed")
            })
        ])
    }
    
    var body: some View {
        TabView {
            Button(action: {
                showingAlert = true
            }, label: {
                Text("Alert Dialog")
                    .font(.title)
                    .frame(width: .infinity, height: .infinity)
                    
            }).alert(isPresented: $showingAlert, content: {
                let title = "iOS"
                let message = "Here we go"
                return Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("NO")) {
                    print("NO Pressed")
                }, secondaryButton: .default(Text("OK")) {
                    print("OK Pressed")
                })
            }).tabItem({
                Image(systemName: "circle")
                Text("Alert")
            })
            
            Button(action: {
                isSheet = true
            }, label: {
                Text("Action Sheet")
                    .font(.title)
                    .frame(width: .infinity, height: .infinity)
                    
            }).actionSheet(isPresented: $isSheet, content: {
                self.actionSheet
            }).tabItem({
                Image(systemName: "circle")
                Text("Sheet")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
