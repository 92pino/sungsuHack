//
//  MapViewController.swift
//  SungsuHotPlace
//
//  Created by JinBae Jeong on 23/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit
import MapKit

final class cafeInfo: MKPointAnnotation {
    var url: String!
}

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        return tf
    }()
    
    private let locationManager = CLLocationManager()
    
    let uiView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    let collectionView: UICollectionView = {
        let collecView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collecView.translatesAutoresizingMaskIntoConstraints = false
        return collecView
    }()
    
    let cafeManager = CafeManager.shared
    let userDefaults = UserDefaults.standard
    var annotationView = MKPinAnnotationView()
    let annotation = cafeInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        collectionView.delegate = self
        textField.delegate = self
        collectionView.dataSource = self as? UICollectionViewDataSource
        view.addSubview(mapView)
        view.addSubview(textField)
        view.addSubview(uiView)
        uiView.addSubview(collectionView)
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: "GridCell")
        
        configure()
        autoLayout()
        
        //    mapView.showsUserLocation = true
        //    checkAuthorizationStatus()
        
        locationManager.delegate = self
        //    textField.becomeFirstResponder()
        
        let center = CLLocationCoordinate2DMake(37.544786, 127.058119)
        
        setRegion(coordinate: center)
        addAnnotation()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func configure() {
        uiView.backgroundColor = .white
        collectionView.backgroundColor = .white
        annotationView.pinTintColor = .green
    }
    
    func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            
            textField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 35),
            
            uiView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 240),
            
            collectionView.leadingAnchor.constraint(equalTo: uiView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: uiView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -5)
            
            ])
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            //          let width: CGFloat = collectionView.frame.height
            //        let height = collectionView.frame.height * 0.6
            layout.itemSize = CGSize(width: 130, height: 180)
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.footerReferenceSize = CGSize(width: 130, height: 40)
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right:15)
        }
        
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func addAnnotation() {
        
        for location in cafeManager.cafeItems {
            let annotation = cafeInfo()
            print(annotation)
            annotation.title = location.cafeName
            annotation.subtitle = location.cafeDesc
            annotation.coordinate = location.cafeGeo
            

            mapView.addAnnotation(annotation)
        }
    }
    
}


extension MapViewController: MKMapViewDelegate, UITextFieldDelegate, UICollectionViewDataSource {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? cafeInfo else { return nil }
        
        var annotationView: MKAnnotationView
        if let reusableView = mapView.dequeueReusableAnnotationView(withIdentifier: "CafeID") {
            reusableView.annotation = annotation
            annotationView = reusableView
        } else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CafeID")
            annotationView.image = UIImage(named: "map")
            annotationView.canShowCallout = true
            
            let infoButton = UIButton(type: .infoDark)
            infoButton.tag = 1
            annotationView.rightCalloutAccessoryView = infoButton
        }
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let cafe = view.annotation as? cafeInfo else { return }
        
        if control.tag == 1 {
            // callout 클릭시 detailVC present 영역
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafeManager.cafeItems.count
    }
    
    //  // 2) 셀 표현은?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        
        cell.imageView.image = UIImage(named: cafeManager.cafeItems[indexPath.row].cafeName)
        cell.titleLabel.text = cafeManager.cafeItems[indexPath.row].cafeName
        cell.contentlabel.text = cafeManager.cafeItems[indexPath.row].cafeDesc
        cell.checkFavorite = cafeManager.cafeItems[indexPath.row].favorite
        
        return cell
    }
    
    
//      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath)
//      }
    
    // Cell Size?
    //  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //    let width: CGFloat = (collectionView.bounds.height - 30)
    //    let height: CGFloat = width + 40
    //
    //    return CGSize(width: width, height: height)
    //  }
    
}

extension MapViewController: UICollectionViewDelegate {
    // 3) 셀이 클릭되었을때?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mapView.selectAnnotation(annotation, animated: true)
        mapView.setCenter(cafeManager.cafeItems[indexPath.item].cafeGeo, animated: true)
        print(indexPath.item)
    }
    
    @objc func openCallOut() {
        
    }
}
