//
//  PageViewController.swift
//  DCIM
//
//  Created by Anyuting on 2019/8/23.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import UIKit

class OrangeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
struct ColorController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: OrangeController, context: UIViewControllerRepresentableContext<ColorController>) {
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ColorController>) -> OrangeController {
        return OrangeController()
    }
}

struct ScanController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScanController>) -> ScannerViewController {
        return ScannerViewController()
    }
    func updateUIViewController(_ uiViewController: ScannerViewController, context: UIViewControllerRepresentableContext<ScanController>) {
    }
}

//#if DEBUG
//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        PageViewController()
//    }
//}
//#endif
