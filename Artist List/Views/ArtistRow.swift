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
        VStack(spacing: 8) {
            HStack {
                Text(artist.name)
                    .font(.system(size: 19, weight: .semibold))
                Spacer()
            }
            HStack {
                Text("Born ")
                    .foregroundColor(.secondary)
                + Text(String(format: "%d", artist.birthYear))
                    .foregroundColor(Color("ArtistDetail"))
                + Text(" in ")
                    .foregroundColor(.secondary)
                + Text("\(artist.city), \(artist.country)")
                    .foregroundColor(Color("ArtistDetail"))
                Spacer()
            }
            .font(.system(size: 15, weight: .medium))
        }
        .padding([.top, .bottom], 8)
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtistRow(artist: artistData[0]).previewLayout(.sizeThatFits)
    }
}
