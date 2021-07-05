//
//  RSTextField.m
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import "RSTextField.h"

@implementation RSTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setState:@"ready"];
}

- (void)setState:(NSString *)state {
    if ([state  isEqual: @"ready"]) {
        self.layer.borderColor = [UIColor colorNamed:@"Black Coral"].CGColor;
        self.enabled = true;
        self.alpha = 1.0;
    }
    
    if ([state isEqual:@"success"]) {
        self.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
        //self.enabled = false;
        //self.alpha = 0.5;
    }
    
    if ([state isEqual:@"error"]) {
        self.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
    }
}

@end
