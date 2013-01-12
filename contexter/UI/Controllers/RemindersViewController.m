#import "RemindersViewController.h"
#import "Reminder.h"
#import "ReminderCell.h"

@implementation RemindersViewController

- (id)initWithInjector:(DependencyInjector *)injector
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
      self.injector = injector;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [[Reminder allInContext:self.injector.context] count] > 0 ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (section == 0) {
    return 1;
  } else {
    return [[Reminder allInContext:self.injector.context] count];
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell;

  if (indexPath.section == 0) {
    cell = [ReminderCell addCellWithDelegate:self];
  } else {
    Reminder *reminder = (Reminder *)[[Reminder allInContext:self.injector.context] objectAtIndex:indexPath.row];
    if (!(cell = [tableView dequeueReusableCellWithIdentifier:@"ReminderCell"])) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReminderCell"];
    }
    cell.textLabel.text = reminder.title;
  }
  return cell;
}

#pragma mark AddReminderDelegate methods
- (void)addReminderWithTitle:(NSString *)title
{
  [Reminder createInContext:self.injector.context WithTitle:title];
  [self.remindersTableView reloadData];
}

@end
