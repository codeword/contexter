#import "SpecHelper.h"
#import "RemindersViewController.h"
#import "Reminder.h"
#import "ReminderCell.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RemindersViewControllerSpec)

describe(@"RemindersViewController", ^{
  __block RemindersViewController *controller;
  __block DependencyInjector *injector;
  __block UITableView *table;
  __block UITableViewCell *cell;

  beforeEach(^{
    injector = [[DependencyInjector alloc] init];
    controller = [[RemindersViewController alloc] initWithInjector:injector];
    controller.view should_not be_nil();
    table = controller.remindersTableView;
  });

  describe(@"Reminders list", ^{
    context(@"with no reminders", ^{
      it(@"should have one cell to add a new reminders", ^{
        [table numberOfRowsInSection:0] should equal(1);
        ReminderCell *cell = (ReminderCell *)[table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.titleField.placeholder should equal(@"Add Reminder");
        cell.delegate should equal(controller);
      });

      it(@"should have no reminder section", ^{
        [table numberOfSections] should equal(1);
      });
    });

    context(@"when reminders exist", ^{
      beforeEach(^{
        [Reminder createInContext:injector.context WithTitle:@"Go Shopping"];
        [Reminder createInContext:injector.context WithTitle:@"Do Laundary"];
        [table numberOfSections] should equal(2);
        [table numberOfRowsInSection:1] should equal(2);
        cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
      });

      it(@"should show active reminders", ^{
        cell should_not be_nil();
      });

      it(@"should set the cell Title", ^{
        cell.textLabel.text should equal(@"Go Shopping");
      });
    });
  });

  describe(@"Adding a new reminder", ^{
    __block ReminderCell *cell;

    beforeEach(^{
      [table numberOfRowsInSection:0] should equal(1);
      cell = (ReminderCell *)[table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
      cell.titleField.text = @"just created";
    });

    it(@"should create a reminder", ^{
      [Reminder allInContext:injector.context].count should equal(0);

      [cell.titleField.delegate textFieldShouldReturn:cell.titleField];

      [Reminder allInContext:injector.context].count should equal(1);
    });

    it(@"should show the new reminder", ^{
      [table numberOfSections] should equal(1);

      [cell.titleField.delegate textFieldShouldReturn:cell.titleField];

      [table numberOfSections] should equal(2);
      [table numberOfRowsInSection:1] should equal(1);

      UITableViewCell *cell = [table cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
      cell.textLabel.text should equal(@"just created");
    });
  });
});

SPEC_END
