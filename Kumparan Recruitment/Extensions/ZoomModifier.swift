//
//  ImageModifier.swift
//  Kumparan Recruitment
//
//  Created by Jonathan Andrei on 14/08/22.
//

import Foundation
import SwiftUI
import UIKit

extension View { //Add custom pinch to zoom modifier
    func addPinchZoom() -> some View {
        return PinchZoomContext {
            self
        }
    }
}

struct PinchZoomContext<Content: View>: View { //Pinch zoom struct
    
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    @State var offset: CGPoint = .zero
    @State var scale: CGFloat = 0
    
    @State var scalePosition: CGPoint = .zero
    
    var body: some View {
        content
            .offset(x: offset.x, y: offset.y)
            .overlay(
                GeometryReader { proxy in
                    let size = proxy.size
                    ZoomGesture(size: size, offset: $offset, scale: $scale, scalePosition: $scalePosition)
                }
            )
            .scaleEffect(1 + scale, anchor: .init(x: scalePosition.x, y: scalePosition.y))
    }
}

struct ZoomGesture: UIViewRepresentable {
    
    var size: CGSize
    
    @Binding var offset: CGPoint
    @Binding var scale: CGFloat
    
    @Binding var scalePosition: CGPoint
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinch(sender:)))
        
        view.addGestureRecognizer(pinchGesture)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    class Coordinator: NSObject {
        
        var parent: ZoomGesture
        
        init(parent: ZoomGesture) {
            self.parent = parent
        }
        
        @objc
        func handlePinch(sender: UIPinchGestureRecognizer) {
            if sender.state == .began || sender.state == .changed {
                parent.scale = sender.scale - 1
                
                let scalePoint = CGPoint(x: sender.location(in: sender.view).x / sender.view!.frame.size.width, y: sender.location(in: sender.view).y / sender.view!.frame.size.height)
                
                parent.scalePosition = (parent.scalePosition == .zero ? scalePoint : parent.scalePosition)
            } else {
                withAnimation(.easeInOut(duration: 0.35)) {
                    parent.scale = 0
                    parent.scalePosition = .zero
                }
            }
        }
    }
}
