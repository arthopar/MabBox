//
//  ViewModel.swift
//  Map
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import Foundation
import Common
import Core
import CoreLocation
import RxSwift

struct TilesModel {
    let url: String
    let sw: CLLocationCoordinate2D
    let ne: CLLocationCoordinate2D
}

struct MapPresentationModel {
    let coordinates: [CLLocationCoordinate2D]
    let tilesMode: [TilesModel]
}

final class ViewModel: BaseViewModel {
    private let requestManager: FieldsApiManager

    var mapModels = Variable<MapPresentationModel?>(nil)
    var selectedIndex = 0

    init(requestManager: FieldsApiManager) {
        self.requestManager = requestManager
    }

    func fetchList() {
        self.isLoading.value = true
        requestManager.makeRequest(parameters: FieldsRouter()) {[unowned self] response in
            self.isLoading.value = false
            var coordinates = [CLLocationCoordinate2D]()
            guard let data = self.responseHendler(response: response) else { return }
            guard let flight = data[self.selectedIndex].latestFlight else { return }

            let tiles = flight.tilesets
            let geometry = data[self.selectedIndex].geometry?.features.first?.geometry.coordinates.first?.first
            geometry?.forEach({ coordianates in
                guard let longitude = coordianates.first, let latitude = coordianates.last else { return }
                let clLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                coordinates.append(clLocation)
            })

            var tilesModel = [TilesModel]()
            tiles.forEach {
                guard let urlString = $0.exportGeotiff else { return }
                let model = TilesModel(url: urlString, sw: CLLocationCoordinate2D(latitude: flight.southWestLatitude, longitude: flight.southWestLongitude), ne: CLLocationCoordinate2D(latitude: flight.northEastLatitude, longitude: flight.northEastLongitude))
                tilesModel.append(model)
            }

            let model = MapPresentationModel(coordinates: coordinates, tilesMode: tilesModel)
            self.mapModels.value = model
        }
    }
}
