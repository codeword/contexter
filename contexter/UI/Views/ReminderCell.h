#import <UIKit/UIKit.h>
#import "DependencyInjector.h"

@protocol AddReminderDelegate <NSObject>
- (void)addReminderWithTitle:(NSString *)title;
@end

@interface ReminderCell : UITableViewCell<UITextFieldDelegate>
@property (nonatomic, retain) UITextField *titleField;
@property (nonatomic, retain) id<AddReminderDelegate> delegate;

+ (ReminderCell *)addCellWithDelegate:(id<AddReminderDelegate>)delegate;
@end
