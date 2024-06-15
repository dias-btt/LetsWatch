//
//  SizeConstants.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct SizeConstants{
    static var buttonWidth: CGFloat {
        UIScreen.main.bounds.width - 40
    }
    
    static var buttonHeight: CGFloat {
        UIScreen.main.bounds.height * 0.07
    }
    
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
    static var movieCellWidth: CGFloat {
        (UIScreen.main.bounds.width / 2.5)
    }
    
    static var movieCellHeight: CGFloat {
        (UIScreen.main.bounds.height / 3)
    }
}
