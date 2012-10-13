#import "RemindersViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(RemindersViewControllerSpec)

describe(@"RemindersViewController", ^{
  __block RemindersViewController *controller;

  beforeEach(^{
    controller = [[RemindersViewController alloc] initWithNibName:nil bundle:nil];
  });

  it(@"should work", ^{
    controller.view should be_instance_of([UIView class]);
    controller.view should_not be_nil();
  });
});

SPEC_END
