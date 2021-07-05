//
//  RSSecureButton.m
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import "RSSecureButton.h"

@implementation RSSecureButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 25.0;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
}

@end
