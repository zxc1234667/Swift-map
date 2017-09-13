//
//  ViewPoint.swift
//  DITMap
//
//  Created by D7702_09 on 2017. 9. 12..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewPoint: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    //var info: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        
        self.coordinate = coordinate // 위도 / 경도
        self.title = title           // 지역 이름
        self.subtitle = subtitle     // 지역 부제목
        
    }
    
    
}
