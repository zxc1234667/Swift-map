//
//  ViewController.swift
//  DITMap
//
//  Created by 김종현 on 2017. 8. 31..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //  지도의 center 위치, DIT 위치정보 35.166197, 129.072594
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        //  부산시민공원의 위치, 부산시민공원 35.168444, 129.057832
        let location1 = CLLocationCoordinate2DMake(35.168444, 129.057832)
        
        //새로운 지도영역을 생성
        myMapView.setRegion(region, animated: true)
        
        // Annotation(Pin) 꼽기
        
        // anno01 = DIT 위치
        let anno01 = MKPointAnnotation()
        anno01.coordinate = center
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        
        // anno02 = 부산시민공원 위치
        let anno02 = MKPointAnnotation()
        anno02.coordinate = location1
        
        //anno02.coordinate.latitude = 35.168444
        //anno02.coordinate.longitude = 129.057832
        
        anno02.title = "부산시민공원"
        anno02.subtitle = "부산시민들의 휴식처"
        
        //지도에 핀을 생성
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        
        //delegate 연결
        myMapView.delegate = self
    }
    
    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //pin의 재활용
        let identifier = "MyPin"
        var  annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            //title이 부산시민공원일 경우
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
                let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                leftIconView.image = UIImage(named:"citizen_logo.png" )
                annotationView?.leftCalloutAccessoryView = leftIconView
            
            //title이 DIT 동의과학대학교일 경우
            } else if annotation.title! == "DIT 동의과학대학교" {
                let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
                leftIconView.image = UIImage(named:"DIT_logo.png" )
                annotationView?.leftCalloutAccessoryView = leftIconView

            }
            
        } else {
            annotationView?.annotation = annotation
        }
        
        //pin에 애니메이션을 적용시킴(위에서 아래로 떨어지는 애니메이션 추가).
        annotationView?.animatesDrop = true
        
        //leftcalloutAcceary
        annotationView?.canShowCallout = true
        
        //클릭했을때의 액션
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn
        
        return annotationView
        
    }
    
    //Pin을 Tap했을때 발생하는 이밴트 제어
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        //확인용 print
        print("callout Accessory Tapped!")
        
        //Alert에 사용하기 위해 정의
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!       //Pin의 title
        let viewSubTitle: String = ((viewAnno?.subtitle)!)! //Pin의 subtitle
        
        //정의된 내용 확인
        print("\(viewTitle) \(viewSubTitle)")
        
        //Alert을 사용하여 내용을 출력시켜줌.
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        
        //OK를 클릭할 시 Alert 종료
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    //Source Control의 push는 처음 github에 업로드 할때, Commit은 수정본을 갱신할 때
    //

}

