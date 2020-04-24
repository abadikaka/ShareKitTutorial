//
//  SelectorView.swift
//  SelectorUIViewKitTutorial
//
//  Created by Michael Abadi Santoso on 1/27/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import SwiftUI

public struct BaseView: View {
    let user: [User]
    
    public var body: some View {
        SelectorView(user: user)
    }
}

private struct SelectorView: View {
    let user: [User]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(user, id: \.id) { user in
                    VStack(alignment: .leading) {
                        Text("NAME: \(user.name)")
                        Text("JOB: \(user.job)").padding(.top, 10)
                    }
                }
            }.navigationBarTitle("User")
        }
    }
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(user: [User(id: "test", name: "Michael", job: "Programmer")])
    }
}
