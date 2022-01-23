//
//  Extensions.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import SwiftUI

extension View {
    // MARK: Extracting View's Height/Width
    func convertToScrollView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> UIScrollView {
        let scrollView = UIScrollView()
        
        // MARK: Converting SwiftUI View to UIKit View
        let hostingController = UIHostingController(rootView: content()).view!
        hostingController.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Constraints
        let constraints = [
            hostingController.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Width Anchor
            hostingController.widthAnchor.constraint(equalToConstant: screenBounds().width)
        ]
        scrollView.addSubview(hostingController)
        scrollView.addConstraints(constraints)
        
        return scrollView
    }
    
    func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
