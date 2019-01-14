//
//  ViewController.swift
//  Map
//
//  Created by Artak Tsatinyan on 1/13/19.
//  Copyright © 2019 Artak Tsatinyan. All rights reserved.
//

import UIKit
import Mapbox
import Common

final class ViewController: BaseViewController<ViewModel>, MGLMapViewDelegate {
    @IBOutlet weak var mapView: MGLMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var layers: [MGLRasterStyleLayer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchList()
        mapView.delegate = self
        
        bindViewModel()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.mapModels.asObservable()
            .filter { $0 != nil }
            .subscribe(onNext: {[unowned self] model in
                self.drawShape(model!)
                self.createTiel(model!)
            })
            .disposed(by: disposeBag)
    }
    
    private func createTiel(_ model: MapPresentationModel) {
        guard model.tilesMode.count > 2 else { return }
        
        layers.append(createLayer(tilesModel: model.tilesMode[0], layerName: "layer_1"))
        layers.append(createLayer(tilesModel: model.tilesMode[1], layerName: "layer_2"))
        layers.append(createLayer(tilesModel: model.tilesMode[2], layerName: "layer_3"))
        layers[1].isVisible = false
        layers[2].isVisible = false
    }
    
    private func createLayer(tilesModel: TilesModel, layerName: String) -> MGLRasterStyleLayer {
        let source = MGLRasterTileSource(identifier: layerName, tileURLTemplates: [tilesModel.url],
                                         options: [ .minimumZoomLevel: 14,
                                                    .maximumZoomLevel: 21,
                                                    .tileSize: 256,
                                                    .coordinateBounds: NSValue(mglCoordinateBounds: MGLCoordinateBounds(sw: tilesModel.sw, ne: tilesModel.ne)),
                                                    .tileCoordinateSystem: 1])
        let layer = MGLRasterStyleLayer(identifier: layerName, source: source)
        layer.rasterOpacity = NSExpression(forConstantValue: 0.7)
        mapView.style?.addSource(source)
        mapView.style?.addLayer(layer)
        
        return layer
    }
    
    private func drawShape(_ model: MapPresentationModel) {
        let coordinates = model.coordinates
        guard coordinates.count > 0 else { return }
        
        let shape = MGLPolygon(coordinates: coordinates, count: UInt(coordinates.count))
        mapView.addAnnotation(shape)
        mapView.setCenter(coordinates[0], zoomLevel: 14, animated: false)
    }
    
    @IBAction func changeLayer(_ sender: Any) {
        for (index, layer) in layers.enumerated() {
            layer.isVisible = segmentedControl.selectedSegmentIndex == index
        }
    }
    
    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 0.5
    }
    
    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor.red
    }
}
