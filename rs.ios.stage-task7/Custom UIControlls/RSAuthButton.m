//
//  RSAuthButton.m
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import "RSAuthButton.h"

@implementation RSAuthButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"personfill"] forState:UIControlStateHighlighted];
    
//    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 5.0);
//    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 5.0, 0.0, 0);
//
//    self.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
//    self.layer.borderWidth = 2.0;
//    self.layer.cornerRadius = 10.0;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
