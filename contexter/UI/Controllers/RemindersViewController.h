#import <UIKit/UIKit.h>
#import "DependencyInjector.h"
#import "ReminderCell.h"

@interface RemindersViewController : UIViewController <UITableViewDataSource, UITextFieldDelegate, AddReminderDelegate>
@property (weak, nonatomic) IBOutlet UITableView *remindersTableView;
@property (weak, nonatomic) DependencyInjector *injector;

- (id)initWithInjector:(DependencyInjector *)injector;
@end
