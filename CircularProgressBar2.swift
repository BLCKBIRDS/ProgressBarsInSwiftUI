//
//  CircularProgressBar2.swift
//  ProgressBars
//
//  Created by BLCKBIRDS on 04.10.19.
//  Copyright © 2019 BLCKBIRDS. All rights reserved.
//

import SwiftUI

struct CircularProgressBar2: View {
    
    @Binding var circleProgress: CGFloat
    
    var widthAndHeight: CGFloat
    var labelSize: CGFloat?
    var staticColor: Color?
    var progressColor: Color
    var showLabel: Bool?
    var lineWidth: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(self.staticColor ?? Color.gray, lineWidth: self.lineWidth)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Circle()
                    .trim(from: 0.0, to: self.circleProgress)
                    .stroke(self.progressColor, lineWidth: self.lineWidth)
                    .frame(width: geometry.size.width-2*self.lineWidth, height: geometry.size.width-2*self.lineWidth)
                    .rotationEffect(Angle(degrees: -90))
                if self.showLabel ?? true {
                    Text("\(Int(self.circleProgress*100))%")
                        .font(.custom("HelveticaNeue", size: self.labelSize ?? 20.0))
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
            .frame(width: widthAndHeight, height: widthAndHeight)
    }
    
}

struct CircularProgressBar2_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar2(circleProgress: .constant(0.3), widthAndHeight: 200, labelSize: 30, staticColor: .blue, progressColor: .purple, showLabel: true, lineWidth: 12.0)
    }
}
