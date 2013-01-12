#import "ReminderCell.h"
#import "Reminder.h"

@implementation ReminderCell
@synthesize titleField = _titleField;
@synthesize delegate = _delegate;

+ (ReminderCell *)addCellWithDelegate:(id<AddReminderDelegate>)delegate
{
  ReminderCell *cell = [[ReminderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReminderCell"];
  cell.delegate = delegate;
  cell.titleField.placeholder = @"Add Reminder";
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      self.titleField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 60)];
      self.titleField.delegate = self;
      [self addSubview:self.titleField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self.delegate addReminderWithTitle:textField.text];
  textField.text = @"";
  [textField resignFirstResponder];
  return YES;
}

@end
