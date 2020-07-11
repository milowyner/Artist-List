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
    
    // Used so that an artist can only be added when all the info is filled in and validated
    var saveArtistDisabled: Bool {
        name.isEmpty || birthYear.isEmpty || city.isEmpty || country.isEmpty
            || Int(birthYear) == nil
    }
    
    let rowHeight: CGFloat = 50
    
    var body: some View {
        VStack() {
            
            // Cancel button
            HStack {
                Spacer()
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cancel")
                }
                .modifier(SmallButtonStyle())
                .padding()
            }
            
            // Title
            Text("Add a New Artist")
                .font(.title)
                .bold()
            
            // Input rows
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Name:").frame(height: rowHeight)
                    Text("Birth Year:").frame(height: rowHeight)
                    Text("City:").frame(height: rowHeight)
                    Text("Country:").frame(height: rowHeight)
                }
                .font(.system(size: 17, weight: .medium))
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
                // saveArtistDisabled makes sure birthYear is an Int before this is run
                let newArtist = Artist(name: self.name, birthYear: Int(self.birthYear)!, city: self.city, country: self.country)
                self.artistList.insert(newArtist, at: 0)
                self.artistList.save()
                self.isPresented = false
            }) {
                Text("Save Artist")
            }
            .disabled(saveArtistDisabled)
            .modifier(LargeButtonStyle(disabled: saveArtistDisabled))
            .padding()
        }
    }
}

struct AddArtistView_Previews: PreviewProvider {
    static var previews: some View {
        AddArtistView(isPresented: .constant(true), artistList: .constant([]))
    }
}
