#import "RemindersViewController.h"
#import "Reminder.h"

@implementation RemindersViewController

- (id)initWithInjector:(DependencyInjector *)injector {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
      self.injector = injector;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [[Reminder allInContext:self.injector.context] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Reminder *reminder = (Reminder *)[[Reminder allInContext:self.injector.context] objectAtIndex:indexPath.row];
  UITableViewCell *cell;
  if (!(cell = [tableView dequeueReusableCellWithIdentifier:@"ReminderCell"])) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReminderCell"];
  }
  cell.textLabel.text = reminder.title;
  return cell;
}

@end
