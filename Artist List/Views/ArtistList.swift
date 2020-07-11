//
//  ContentView.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct ArtistList: View {
    
    @State var addArtistViewIsPresented = false
    @State var artists = artistData
    
    struct ButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(size: 15, weight: .semibold))
                .padding([.top, .bottom], 6)
                .padding([.leading, .trailing], 8)
                .accentColor(.blue)
                .background(Color.blue.saturation(0.5).opacity(0.1))
                .cornerRadius(10)
        }
    }
    
    var addButton: some View {
        Button(action: {
            self.addArtistViewIsPresented = true
        }) {
            Image(systemName: "plus")
            Text("Add Artist")
        }
        .modifier(ButtonStyle())
        .sheet(isPresented: $addArtistViewIsPresented) {
            AddArtistView(isPresented: self.$addArtistViewIsPresented, artistList: self.$artists)
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(artists) { artist in
                    ArtistRow(artist: artist)
                }
                .onMove(perform: move(from:to:))
                .onDelete(perform: delete(at:))
            }
            .navigationBarTitle("Artist List")
            .navigationBarItems(leading: EditButton().modifier(ButtonStyle()), trailing: addButton)
        }
    }
    
    // MARK: - Editing the list
    
    func move(from source: IndexSet, to destination: Int) {
        // TODO: Fix bug where the cells of artists with longer city/country names
        //       only expand when moved, and stay expanded after leaving edit mode
        
        artists.move(fromOffsets: source, toOffset: destination)
        artists.save()
    }
    
    func delete(at offsets: IndexSet) {
        artists.remove(atOffsets: offsets)
        artists.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList()
    }
}
