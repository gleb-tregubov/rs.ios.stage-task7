//
//  LoginViewController.m
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import "LoginViewController.h"
#import "RSTextField.h"
#import "RSAuthButton.h"
#import "RSSecureButton.h"


@interface LoginViewController ()

// Login Text Field
@property (weak, nonatomic) IBOutlet RSTextField *loginTextField;

// Passwords Text Field
@property (weak, nonatomic) IBOutlet RSTextField *passwordTextField;

// Secure View
@property (weak, nonatomic) IBOutlet UIView *secureView;

// Auth Button
@property (weak, nonatomic) IBOutlet RSAuthButton *authButton;

// Result Label
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end    

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //loginTextField configuration
    self.loginTextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.loginTextField.delegate = self;
    self.loginTextField.layer.cornerRadius = 5.0;
    self.loginTextField.layer.borderWidth = 1.5;
    
    //passwordTextField configuration
    self.passwordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.passwordTextField.delegate = self;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.layer.cornerRadius = 5.0;
    self.passwordTextField.layer.borderWidth = 1.5;
    
    //secureView configuration
    self.secureView.layer.cornerRadius = 10.0;
    self.secureView.layer.borderWidth = 2.0;
    self.secureView.layer.borderColor = UIColor.clearColor.CGColor;
    self.secureView.backgroundColor = UIColor.whiteColor;
    
    //authButton configuration
    self.authButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 5.0);
    self.authButton.titleEdgeInsets = UIEdgeInsetsMake(0.0, 5.0, 0.0, 0);
    
    self.authButton.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
    self.authButton.layer.borderWidth = 2.0;
    self.authButton.layer.cornerRadius = 10.0;
    
    //hiddingKeyboard
    [self hideWhenTappedAround];
    
    // User input Values
    self.secureInputValues = [[NSMutableArray alloc] init];
}

- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    
    [self.view addGestureRecognizer:gesture];
}

-(void)hide {
    [self.view endEditing:true];
}

- (IBAction)beginEditing:(RSTextField *)sender {
    [sender setState:@"ready"];
}

// Text Field Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hide];
    return true;
}

- (IBAction)authButtonTapped:(UIButton *)sender {
    
    BOOL isLoginValid = [self.loginTextField.text isEqual:@"username"];
    
    BOOL isPasswordValid = [self.passwordTextField.text isEqual:@"password"];
    
    BOOL isAuthValid = isLoginValid && isPasswordValid;
    
    if (isLoginValid) {
        [self.loginTextField setState:@"success"];
    } else {
        [self.loginTextField setState:@"error"];
    }
    
    if (isPasswordValid) {
        [self.passwordTextField setState:@"success"];
    } else {
        [self.passwordTextField setState:@"error"];
    }
    
    if (isAuthValid) {
        self.secureView.hidden = false;
        self.authButton.enabled = false;
        self.loginTextField.enabled = false;
        self.passwordTextField.enabled = false;
        self.authButton.alpha = 0.5;
        self.loginTextField.alpha = 0.5;
        self.passwordTextField.alpha = 0.5;
    }
    
}

- (IBAction)secureViewOptionButtonTapped:(RSSecureButton *)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* senderValue = [formatter numberFromString:sender.titleLabel.text];
    NSLog(@"%@", senderValue);
    [self.secureInputValues addObject: senderValue];
    NSLog(@"%@", self.secureInputValues);
    if (self.secureInputValues.count == 1) {
        self.resultLabel.text = @" ";
    }
    
    self.resultLabel.text = [self.resultLabel.text stringByAppendingFormat: @"%d ", senderValue.intValue];
    
    if (self.secureInputValues.count == 3) {
        if ([self.secureInputValues isEqualToArray:@[@1, @3, @2]]) {
            self.secureView.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
            [self presentAlertController];
        } else {
            self.resultLabel.text = @"_";
            [self.secureInputValues removeAllObjects];
            self.secureView.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
        }
    } else {
        [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

- (void)presentAlertController {
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refreshAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self.loginTextField setState:@"ready"];
        [self.passwordTextField setState:@"ready"];
        
        self.loginTextField.text = @"";
        self.passwordTextField.text = @"";
        
        self.authButton.enabled = true;
        self.authButton.alpha = 1.0;
        
        self.secureView.hidden = true;
        [self.secureInputValues removeAllObjects];
        self.secureView.layer.borderColor = [UIColor clearColor].CGColor;
        
        self.resultLabel.text = @"_";
        
        
    }];
    [alertController addAction:refreshAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

//- (void)setViewToDefaultState {
//    [self.secureView setHidden:YES];
//    [self.passwordTextField setState:@"ready"];
//    [self.loginTextField setState:@"ready"];
//    [self.passwordTextField setText:@""];
//    [self.loginTextField setText:@""];
//    [self.secureInputValues removeAllObjects];
//    [self.authButton setEnabled:YES];
//    [self.authButton setAlpha:1];
//    [self.resultLabel setText:@"_"];
//    [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
//}

@end
