#import "Reminder.h"
#import "DependencyInjector.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ReminderSpec)

describe(@"Reminder", ^{
  __block DependencyInjector *injector;
  beforeEach(^{
    injector = [[DependencyInjector alloc] init];
  });

  describe(@"+ createInContext:WithTitle:", ^{
    __block Reminder *reminder;
    beforeEach(^{
      reminder = [Reminder createInContext:injector.context WithTitle:@"Do Laundary"];
    });

    it(@"should return a Reminder", ^{
      reminder should be_instance_of([Reminder class]);
    });

    it(@"should set the title", ^{
      reminder.title should equal(@"Do Laundary");
    });

    it(@"should set the createdAt", ^{
      reminder.createdAt should_not be_nil();
    });

    it(@"should persist the reminder", ^{
      [reminder hasChanges] should equal(NO);
    });
  });

  describe(@"+ allInContext:", ^{
    it(@"should return an empty array", ^{
      [Reminder allInContext:injector.context].count should equal(0);
    });

    context(@"when there are reminders", ^{
      beforeEach(^{
        [Reminder createInContext:injector.context WithTitle:@"foo"];
        [Reminder createInContext:injector.context WithTitle:@"bar"];
      });

      it(@"should return all reminders", ^{
        [Reminder allInContext:injector.context].count should equal(2);
      });

      it(@"should return them in the correct order", ^{
        [Reminder createInContext:injector.context WithTitle:@"baz"];
        NSArray *reminders = [Reminder allInContext:injector.context];
        [[reminders objectAtIndex:0] title] should equal(@"foo");
        [[reminders objectAtIndex:1] title] should equal(@"bar");
        [[reminders lastObject] title] should equal(@"baz");
      });
    });
  });
});

SPEC_END
