//
//  MapAnnotationDelegate.swift
//  TravlPlannrApp
//
//  Created by Patrick Noonan on 6/25/23.
//

import Foundation
import MapKit

extension ActivitiesMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Place else { return nil }
        
        var view:MKMarkerAnnotationView
        
        if let annotationView = mapView.dequeueReusableAnnotationView(
            withIdentifier: Configs.placeID) as? MKMarkerAnnotationView{
            
            annotationView.annotation = annotation
            view = annotationView
        
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Configs.placeID)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            let buttonAddActivity = UIButton()
            buttonAddActivity.setImage(UIImage(systemName: "calendar.badge.plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
            buttonAddActivity.sizeToFit()
            buttonAddActivity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2)
            view.rightCalloutAccessoryView = buttonAddActivity
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            
        guard let annotation = view.annotation as? Place else { return }
        
        let ac = UIAlertController(
            title: annotation.title,
            message: "Add Activity?",
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "Add Activity", style: .default, handler: {_ in
            self.promptUserAddActivity(name: annotation.title!)
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func promptUserAddActivity(name: String) {
        let delegateActivityAdd = AddActivitiesViewController()
        delegateActivityAdd.delegateActivityToAddScreen(name: name)
        self.navigationController?.pushViewController(delegateActivityAdd, animated: true)
    }
    
    @objc func onTapOutsideAlert(){
        self.dismiss(animated: true)
    }
}
