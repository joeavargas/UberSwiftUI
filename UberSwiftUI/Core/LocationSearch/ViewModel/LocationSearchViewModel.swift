//
//  LocationSearchViewModel.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/17/22.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init(){
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    // MARK: - Helper Functions
    func selectedLocation(_ location: String) {
        self.selectedLocation = location
        print("DEBUG: selected location", self.selectedLocation)
    }
}

// MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
