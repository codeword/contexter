#import <UIKit/UIKit.h>
#import "DependencyInjector.h"

@interface RemindersViewController : UIViewController <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *remindersTableView;
@property (weak, nonatomic) DependencyInjector *injector;

- (id)initWithInjector:(DependencyInjector *)injector;
@end
