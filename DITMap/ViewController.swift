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
        
        // 해당위치를 확대시켜준다.
        zoomToRegion()
        
        // ViewPoint로 Class를 만들어서 위도경도에 따른 지역이름 입력.
        let a = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.167158, 129.072063), title: "성모여자고등학교", subtitle: "성모여자고등학교")
        
        let b = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.164974, 129.071049), title: "동의중학교", subtitle: "동의중학교")
        
        let c = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.173086, 129.071381), title: "양정역", subtitle: "양정역(지하철)")
        
        let d = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.166197, 129.072594), title: "DIT 동의과학대학교", subtitle: "동의과학대학교")
        
        let e = ViewPoint(coordinate: CLLocationCoordinate2DMake(35.168444, 129.057832), title: "부산시민공원", subtitle: "부산시민공원")
        
        
        /*
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
        
        // 지도에 핀을 생성
        myMapView.addAnnotation(anno01)
        myMapView.addAnnotation(anno02)
        */
        
        myMapView.addAnnotation(a)
        myMapView.addAnnotation(b)
        myMapView.addAnnotation(c)
        myMapView.addAnnotation(d)
        myMapView.addAnnotation(e)
        
        
        // 초기 지정
        //myMapView.selectedAnnotations(a, animated: Bool)
        
        // delegate 연결
        myMapView.delegate = self
        
        
    }
    
    // 초기위치에 대한 확대
    func zoomToRegion(){
        
        // 확대시킬 기준 좌표
        let location = CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594)
        
        // 확대시킬 배율
        let region = MKCoordinateRegionMakeWithDistance(location, 2000.0, 4000.3)
        myMapView.setRegion(region, animated: true)
        
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
        
        if control == view.rightCalloutAccessoryView {
            
            // 뷰가 이동할때 값을 다른 화면으로 넘겨주도록 한다를 해야한다.
            
            
            // 강제 화면전환
            self.performSegue(withIdentifier: "goDetail", sender: self)
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        //확인용 print
//        print("callout Accessory Tapped!")
//        
//        //Alert에 사용하기 위해 정의
//        let viewAnno = view.annotation
//        let viewTitle: String = ((viewAnno?.title)!)!       //Pin의 title
//        let viewSubTitle: String = ((viewAnno?.subtitle)!)! //Pin의 subtitle
//        
//        //정의된 내용 확인
//        print("\(viewTitle) \(viewSubTitle)")
//        
//        //Alert을 사용하여 내용을 출력시켜줌.
//        //let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
//        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .actionSheet)
//        //actionSheet = alert이 아래쪽에서 나타남.
//        
//        //OK를 클릭할 시 Alert 종료
//        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(ac, animated: true, completion: nil)
        
        
    }
    
    // command + / = 지정부분 전체 주석처리
    // Source Control의 push는 처음 github에 업로드 할때, Commit은 수정본을 갱신할 때
    // Pull은 github에서 파일을 가져온다.?
    // local을 클라우드로 설정할 시 다른장소에서도 업로드/다운로드를 할 수 있다.?
    // java는 github에 업로드 할때 eclipse git plugin(egit)등의 프로그램을 사용하면 할 수 있다.
    // (터미널 명령어) 참조: http://itmir.tistory.com/461
    // 안드로이드 스튜디오 참조: https://git-scm.com/downloads

}

