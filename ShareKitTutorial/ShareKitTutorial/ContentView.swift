//
//  ContentView.swift
//  ShareKitTutorial
//
//  Created by Michael Abadi Santoso on 1/27/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import SwiftUI
import SelectorUIViewKitTutorial

struct ContentView: View {
    @State private var showModal = false
    
    var body: some View {
        Button(action: {
            self.showModal = true
        }) {
            Text("Show Selector")
        }.sheet(isPresented: self.$showModal) {
            SelectorView()
        }
    }
}

struct SelectorView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let scene = SelectorEngine()
    
    let users = [
        User(id: "sas", name: "Michael", job: "Programmer"),
        User(id: "saddd", name: "Niramon", job: "QA")
    ]
    
    var body: some View {
        scene.getSelectorView(withUsers: users)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
