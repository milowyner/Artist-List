//
//  AddArtistView.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct AddArtistView: View {
    
    @Binding var isPresented: Bool
    @Binding var artistList: [Artist]
    
    @State var name = ""
    @State var birthYear = ""
    @State var city = ""
    @State var country = ""
    
    let rowHeight: CGFloat = 50
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Cancel button
            HStack {
                Spacer()
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cancel")
                }
                .padding()
            }
            
            // Title
            Text("Add a New Artist")
                .font(.title)
            
            // Input rows
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Name:").frame(height: rowHeight)
                    Text("Birth Year:").frame(height: rowHeight)
                    Text("City:").frame(height: rowHeight)
                    Text("Country:").frame(height: rowHeight)
                }
                VStack(spacing: 0) {
                    TextField("", text: $name).frame(height: rowHeight)
                    TextField("", text: $birthYear).frame(height: rowHeight)
                    TextField("", text: $city).frame(height: rowHeight)
                    TextField("", text: $country).frame(height: rowHeight)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Spacer()
            
            // Save Artist button
            Button(action: {
                // TODO: Validate birthYear is actually an Int
                let newArtist = Artist(name: self.name, birthYear: Int(self.birthYear)!, city: self.city, country: self.country)
                self.artistList.insert(newArtist, at: 0)
                self.isPresented = false
            }) {
                Text("Save Artist")
            }
            .padding()
        }
    }
}

struct AddArtistView_Previews: PreviewProvider {
    static var previews: some View {
        AddArtistView(isPresented: .constant(true), artistList: .constant([]))
    }
}
