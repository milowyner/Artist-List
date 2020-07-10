//
//  ContentView.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var addArtistViewIsPresented = false
    
    var addButton: some View {
        Button(action: {
            self.addArtistViewIsPresented = true
        }) {
            Image(systemName: "plus")
            Text("Add Artist")
        }
        .sheet(isPresented: $addArtistViewIsPresented) {
            AddArtistView(isPresented: self.$addArtistViewIsPresented)
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
