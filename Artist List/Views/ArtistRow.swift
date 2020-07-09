//
//  ArtistRow.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct ArtistRow: View {
    
    let artist: Artist
    
    var body: some View {
        Text(artist.name)
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtistRow(artist: artistData[0]).previewLayout(.fixed(width: 375, height: 80))
    }
}
