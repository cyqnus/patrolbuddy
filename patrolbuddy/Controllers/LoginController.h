//
//  LoginController.h
//  patrolbuddy
//
//  Created by Billy Prasetya Tjahjadi on 12/26/2013.
//
//


@interface LoginController : UIViewController <UIAlertViewDelegate,UIScrollViewDelegate>
{
    NSString *UserName;
    NSString *Password;
}
@property (nonatomic,weak) IBOutlet UITextField *UserNameField;
@property (nonatomic,weak) IBOutlet UITextField *PasswordField;
@property (nonatomic,weak) IBOutlet UIButton *LoginButton;
@property (nonatomic,weak) IBOutlet UIButton *ForgetButton;
@property (nonatomic,weak) IBOutlet UIScrollView *ScrollView;
@property (nonatomic, weak) IBOutlet UIImageView *PatrolBuddyLogo;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *LoginLoaderIndicator;

@property NSString *UserName, *Password;

- (id)initCustomNibName;
- (void)setupButtons;


- (IBAction) loginButtonPressed:(id)sender;

@end