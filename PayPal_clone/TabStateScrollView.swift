//
//  TabStateScrollView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 26.03.25.
//

//import SwiftUI
//
//struct TabStateScrollView<Content: View>: View {
//    var axis: Axis.Set
//    var showsIndicator: Bool
//    @Binding var tabState: Visibility
//    var content: Content
//    
//    @State private var lastOffset: CGFloat = 0
//    @State private var isScrollingUp = false
//    
//    init(axis: Axis.Set, showsIndicator: Bool, tabState: Binding<Visibility>, @ViewBuilder content: @escaping () -> Content) {
//        self.axis = axis
//        self.showsIndicator = showsIndicator
//        self._tabState = tabState
//        self.content = content()
//    }
//    
//    
//    var body: some View {
//        if #available(iOS 17, *) {
//            ScrollView(axis) {
//                content
//                    .background(
//                        GeometryReader { proxy -> Color in
//                            let minY = proxy.frame(in: .global).minY
//                            DispatchQueue.main.async {
//                                detectScrollDirection(minY: minY)
//                            }
//                            return Color.clear
//                        }
//                    )
//            }
//            .scrollIndicators(showsIndicator ? .visible : .hidden)
//            
//        } else {
//            ScrollView(axis, showsIndicators: showsIndicator) {
//                content
//                    .background(
//                        GeometryReader { proxy -> Color in
//                            let minY = proxy.frame(in: .global).minY
//                            DispatchQueue.main.async {
//                                detectScrollDirection(minY: minY)
//                            }
//                            return Color.clear
//                        }
//                    )
//            }
//        }
//    }
//    
//    
//    private func detectScrollDirection(minY: CGFloat) {
//        let offsetChange = minY - lastOffset
//        
//        // Ignore tiny scroll movements
//        let threshold: CGFloat = 30
//        
//        if offsetChange > threshold {
//            if isScrollingUp {
//                DispatchQueue.main.async {
//                    tabState = .hidden // Hide when scrolling down
//                }
//            }
//            isScrollingUp = false
//        } else if offsetChange < -threshold {
//            if !isScrollingUp {
//                DispatchQueue.main.async {
//                    tabState = .visible // Show when scrolling up
//                }
//            }
//            isScrollingUp = true
//        }
//        
//        lastOffset = minY
//    }
//}
//
//    struct CustomGesture: UIViewRepresentable {
//        var onChange: (UIPanGestureRecognizer) -> ()
//        private let gestureID = UUID().uuidString
//        
//        func makeCoordinator() -> Coordinator {
//            return Coordinator(onChange: onChange)
//        }
//        
//        func makeUIView(context: Context) -> UIView {
//            let view = UIView()
//            DispatchQueue.main.async {
//                let gesture = UIPanGestureRecognizer(target: context.coordinator,
//                                                     action: #selector(context.coordinator.gestureChange(gesture:)))
//                view.addGestureRecognizer(gesture)
//            }
//            return view
//        }
//
//        
//        func updateUIView(_ uiView: UIView, context: Context) {
//            DispatchQueue.main.async {
//                if let superView = uiView.superview?.superview,
//                   !(superView.gestureRecognizers?.contains(where: { $0.name == gestureID }) ??
//                     false) {
//                    let gesture = UIPanGestureRecognizer(target: context.coordinator, action:
//                                                            #selector(context.coordinator.gestureChange(gesture:)))
//                    gesture.name = gestureID
//                    gesture.delegate = context.coordinator
//                    superView.addGestureRecognizer(gesture)
//                }
//            }
//        }
//        
// 
//        
//        class Coordinator: NSObject, UIGestureRecognizerDelegate {
//            var onChange: (UIPanGestureRecognizer) -> ()
//            init(onChange: @escaping (UIPanGestureRecognizer) -> Void) {
//                self.onChange = onChange
//            }
//            
//            @objc
//            func gestureChange(gesture: UIPanGestureRecognizer) {
//                onChange(gesture)
//            }
//            
//            func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer)
//            -> Bool {
//                return true
//            }
//        }
//    }
//
//
//#Preview {
//    ContentView()
//}
