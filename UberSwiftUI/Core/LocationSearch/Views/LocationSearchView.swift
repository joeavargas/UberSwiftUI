//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/17/22.
//

import SwiftUI

struct LocationSearchView: View {
    @EnvironmentObject var locationSearchVM: LocationSearchViewModel
    @State private var startLocationText = ""
    @Binding var showLocationSearchView: Bool
    
    var body: some View {
        VStack {
            //MARK: header view
            HStack {
                // indicator view
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Circle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $locationSearchVM.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            Divider()
                .padding(.vertical)
            //MARK: list view
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(locationSearchVM.results, id: \.self){ result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                locationSearchVM.selectedLocation(result.title)
                                showLocationSearchView.toggle()
                            }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearchView: .constant(false))
    }
}
