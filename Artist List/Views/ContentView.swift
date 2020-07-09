//
//  ContentView.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var addButton: some View {
        Button(action: {}) {
            Image(systemName: "plus")
            Text("Add Artist")
        }
    }
    
    var body: some View {
        NavigationView {
            ArtistList()
                .navigationBarTitle("Artist List")
                .navigationBarItems(trailing: addButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
