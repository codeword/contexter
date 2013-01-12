#import "ReminderCell.h"
#import "Reminder.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(ReminderCellSpec)

describe(@"ReminderCell", ^{
  __block ReminderCell *cell;
  __block id mockDelegate;

  beforeEach(^{
    mockDelegate = [OCMockObject niceMockForProtocol:@protocol(AddReminderDelegate)];
    cell = [ReminderCell addCellWithDelegate:mockDelegate];
  });

  describe(@"Pressing the return key", ^{
    beforeEach(^{
      cell.titleField.text = @"foo";
    });

    it(@"should tell the delegate to add a reminder", ^{
      [[mockDelegate expect] addReminderWithTitle:@"foo"];
      [cell.titleField.delegate textFieldShouldReturn:cell.titleField];
      [mockDelegate verify];
    });

    it(@"should clear the field", ^{
      [cell.titleField.delegate textFieldShouldReturn:cell.titleField];
      cell.titleField.text should equal(@"");
    });

    it(@"should resign the text field as a responder", ^{
      id mockField = [OCMockObject partialMockForObject:cell.titleField];
      [[mockField stub] isSecureTextEntry];
      [[mockField expect] resignFirstResponder];
      [cell.titleField.delegate textFieldShouldReturn:cell.titleField];
      [mockField verify];
    });
  });
});

SPEC_END
