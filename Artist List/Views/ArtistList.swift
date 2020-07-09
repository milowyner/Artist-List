//
//  ArtistList.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

struct ArtistList: View {
    var body: some View {
        List(artistData) { artist in
            ArtistRow(artist: artist)
        }
    }
}

struct ArtistList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList()
    }
}
