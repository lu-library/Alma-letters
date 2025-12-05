# TODO 
Working in Alphabetic Order. Changes need to be reviewed are highlighted and in bold text.

2025.12.02
- AnalyticsLetter: Done. No significant update compared to UG's version.
- BorrowedByLetter: Done. No significant update compared to UG's version.
- BorrowerClaimEmailLetter: Done. No significant update compared to UG's version. 
- BorrowerOverdueEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- BorrowerReiceiveEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- BorrowerReturnEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- BorrowingActivityLetter: Done. No significant update compared to UG's version.

2025.12.03
- CourtesyLetter: Done. No significant update compared to UG's version, but **UG's contains extra logic to identify which library the loaned items come from.**
- <mark>[currently Disabled]</mark>DepositStatusUpdateLetter: Done. No significant update compared to UG's version.
- DocumentDeliveryNotificationLetter: <mark>Customized very differently from UG's version, not sure what to keep. UG's includes: **more details about the resource(Authur, Volume, etc); populate both local and ISO resource sharing; check about user's login method; Copyright Statement.**</mark>
- EmailRecordsLetter: Done. No significant update compared to UG's version.
- FineFeePaymentReceiptLetter: <mark>AFN-VERSION 1.8: Check if an email partner. If it is, we're trying to send more of an invoice letter. **Need to fill with LU's info.**</mark>
- FulBorrowingInfoLetter: <mark>AFN footer template options(AFNAccount and AFNLastFooter ) replcaing footer.</mark>
- FulCancelEmailLetter: <mark>AFN-VERSION 1.0: more detailed library address added, AFNLetterNameTemplate added under footer.</mark>
- FulCancelRequestLetter: <mark>Stop emails for converted to resource sharing,If the approval note is populated, don't show cancel_reason but the reject note.</mark>
- FulDamagedEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- FulDigitizationNotificationItemLetter: <mark>Customized very differently from UG's version, not sure what to keep. **Need furthur comparison.**</mark>
- <mark>[currently Disabled]</mark>FulFinesFeesNotificationLetter: <mark>AFN CODE: Check if an email partner. If it is, we're trying to send more of an invoice letter; Added Omni Email Partner receipt; Handled AFN supported languages; **Updated institutions financial contact info.**</mark>
- FulIncomingSlipLetter: <mark>Added a logic to choose from **"Annex SLN" or "Original Annex SLN (internal_note1)", not sure if we need?** Also more detailed infomation including chapter, volume, etc.</mark>
- FulLostEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- <mark>[currently Disabled]</mark>FulLostLoanLetter: Done. No significant update compared to UG's version.
- <mark>[currently Disabled]</mark>FulLostLoanNotificationLetter: Done. No significant update compared to UG's version.
- FulLostRefundFeeLoadnLetter: Done. No significant update compared to UG's version.
- FulOutgoingEmailLetter: <mark>AFN-VERSION 1.0: more detailed library address added, AFNLetterNameTemplate added under footer.</mark>
- FulOverdueAndLostLoanLetter: Done. No significant update compared to UG's version.
- FulOverdueAndLostLoanNotificationLetter: <mark>Updated explanation texts.</mark>
- FulRenewEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>

2025.12.04
- FulRequestsReportLetter: <mark>Added "check service hour" notification. UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to update accrodingly?</mark>
- FulReasourceRequestSlipLetter: <mark>Included "@item_barcode", "@isbn", "@imprint", "@move_to_library", "@request_type" and footer to the letter.</mark>
- FulTransitSlipLetter: Done. No significant update compared to UG's version.
- GeneralMessageEmailLetter: <mark>AFNLetterNameTemplate added under footer.</mark>
- HoldShelfExpiryDateUpdateLetter: <mark>Added logic to check if it's EMAIL partner, and updated French version. Also, UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to sync with that?</mark>
- InterestedInLetter: <mark>Added a "Link to Resource". If keep this link, need to update to LU's link.</mark>
- LenderChecked-inEmailLetter: <mark>Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer.</mark>
- LenderRejectEmailLetter: <mark>Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer.</mark>
- LenderRenewResponseEmailLetter: <mark>Included "@Province" and "@Postal code" in the letter, AFNLetterNameTemplate added under footer.</mark>
- LenderShipEmailLetter: <mark>Included "@Due date" and "@Shipping cost" in the letter</mark>
- LenderWillSupplyEmailLetter: <mark>Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer.</mark>
- LendingRecallEmailLetter: <mark>Included "@Shipping cost", "@Province" and "@Postal code" in the letter, AFNLetterNameTemplate added under footer.</mark>
- LoanStatusNotice: Done. No significant update compared to UG's version.
- OnHoldShelfLetter: Done. No significant update compared to UG's version. <mark>UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to update accrodingly?</mark>
- OnHoldShelfReminderLetter: <mark>Added logic to check if it's EMAIL partner.</mark>
- OverdueNoticeLetter: : Done. No significant update compared to UG's version.
- QueryToPatronLetter: Done. No significant update compared to UG's version.
- <mark>[currently Disabled]</mark>ResetPasswordLetter: Done. No significant update compared to UG's version.
- ResourceSharingReceiveSlipLetter: <mark>The letter in the system is mistakenly presenting unmatched XSL. **Update the whole letter with UG's version.**</mark>
- ResourceSharingReturnSlipLetter: Done. No significant update compared to UG's version.
- ReturnReceiptLetter: <mark>Added logic to check if it's EMAIL partner.</mark>
- SavedSearchesLetter: Done. No significant update compared to UG's version.
- <mark>[currently Disabled]</mark>ShortenedDueDateLetter: Done. No significant update compared to UG's version.
- <mark>[currently Disabled]</mark>SocialLoginInviteLetter: Done. No significant update compared to UG's version.
- SystemJobLetter: Done. No significant update compared to UG's version.

- footer: Updated AFNLetterNameTemplate
- style.xsl: Updated AFN styles

## Check Letters UofG currently has turned on
 
 - Analytics Letter
 - Borrowing Activity Letter
 - Courtesy Letter
 - Document Delivery Notification Letter
 - Ful Digitization Notification Item Letter Email
 - Ful Fines Fees Notification Letter
 - Ful Lost Loan Letter
 - Ful Overdue And Lost Loan Letter
 - Ful Overdue And Lost Loan Notification Letter
 - Ful Pickup Print Slip Report Letter
 - Ful Transit Slip Letter
 - Interested In Letter
 - Loan Status Notice
 - On Hold Shelf Letter
 - On Hold Shelf Reminder Letter
 - Overdue Notice Letter
 - Query To Patron Letter
 - Reset Password Letter
 - Resource Sharing Receive Slip Letter
 - Resource Sharing Return Slip Letter
 - Saved Searches Letter
 - Shortened Due Date Letter
 - System Job Letter
