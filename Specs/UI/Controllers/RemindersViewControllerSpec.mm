#import "SpecHelper.h"
#import "RemindersViewController.h"
#import "Reminder.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RemindersViewControllerSpec)

describe(@"RemindersViewController", ^{
  __block RemindersViewController *controller;
  __block DependencyInjector *injector;

  beforeEach(^{
    injector = [[DependencyInjector alloc] init];
    controller = [[RemindersViewController alloc] initWithInjector:injector];
    [controller view] should_not be_nil();
  });

  describe(@"Reminders list", ^{
    __block UITableView *table;
    beforeEach(^{
      table = controller.remindersTableView;
    });

    it(@"should have no reminders", ^{
      [table numberOfRowsInSection:0] should equal(0);
    });

    context(@"when reminders exist", ^{
      __block UITableViewCell *cell;

      beforeEach(^{
        [Reminder createInContext:injector.context WithTitle:@"Go Shopping"];
        [Reminder createInContext:injector.context WithTitle:@"Do Laundary"];
        [table numberOfRowsInSection:0] should equal(2);
        cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
      });

      it(@"should show active reminders", ^{
        cell should_not be_nil();
      });

      it(@"should set the cell Title", ^{
        cell.textLabel.text should equal(@"Go Shopping");
      });
    });
  });
});

SPEC_END
