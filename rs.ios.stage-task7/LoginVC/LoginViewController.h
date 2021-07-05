//
//  LoginViewController.h
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray<NSNumber *>*secureInputValues;

@end

NS_ASSUME_NONNULL_END
