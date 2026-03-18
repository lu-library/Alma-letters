# TODO 
Working in Alphabetic Order. Changes need to be reviewed are highlighted and in bold text.

2025.12.02
- AnalyticsLetter: Done. No significant update compared to UG's version.
- BorrowedByLetter: Done. No significant update compared to UG's version.
- BorrowerClaimEmailLetter: Done. No significant update compared to UG's version. 
- BorrowerOverdueEmailLetter: AFNLetterNameTemplate added under footer. - Updated 2026-02-24
- BorrowerReiceiveEmailLetter: AFNLetterNameTemplate added under footer. - Updated 2026-02-24
- BorrowerReturnEmailLetter: AFNLetterNameTemplate added under footer. - Updated 2026-02-24
- BorrowingActivityLetter: Done. No significant update compared to UG's version.

2025.12.03
- CourtesyLetter: Done. No significant update compared to UG's version.
- [currently Disabled]DepositStatusUpdateLetter: Done. No significant update compared to UG's version.
- DocumentDeliveryNotificationLetter: Customized very differently from UG's version, not sure what to keep. UG's includes: more details about the resource(Authur, Volume, etc); Copyright Statement. - Updated 2026-03-18 
- EmailRecordsLetter: Done. No significant update compared to UG's version.
- FineFeePaymentReceiptLetter: <mark>AFN-VERSION 1.8: Check if an email partner. If it is, we're trying to send more of an invoice letter. **Need to fill with LU's info.**</mark>
- FulBorrowingInfoLetter: AFN footer template options(AFNAccount and AFNLastFooter ) replcaing footer. - Updated 2026-02-25 
- FulCancelEmailLetter: AFN-VERSION 1.0: more detailed library address added, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- FulCancelRequestLetter: Stop emails for converted to resource sharing,If the approval note is populated, don't show cancel_reason but the reject note. - Updated 2026-02-26
- FulDamagedEmailLetter: AFNLetterNameTemplate added under footer.- Updated 2026-02-25
- FulDigitizationNotificationItemLetter: Customized very differently from UG's version, but we never trigger this letter in the system so keep it as is.
- [currently Disabled]FulFinesFeesNotificationLetter: AFN CODE: Check if an email partner. If it is, we're trying to send more of an invoice letter; Added Omni Email Partner receipt; Handled AFN supported languages; **Updated institutions financial contact info.**
- FulIncomingSlipLetter: Added a logic to choose from "Annex SLN" or "Original Annex SLN (internal_note1)" Also more detailed infomation including chapter, volume, etc. - Updated 2026-03-18 
- FulLostEmailLetter: AFNLetterNameTemplate added under footer. - Updated 2026-02-25
- [currently Disabled]FulLostLoanLetter: Done. No significant update compared to UG's version.
- [currently Disabled]FulLostLoanNotificationLetter: Done. No significant update compared to UG's version.
- FulLostRefundFeeLoadnLetter: Done. No significant update compared to UG's version.
- FulOutgoingEmailLetter: AFN-VERSION 1.0: more detailed library address added, AFNLetterNameTemplate added under footer. - Updated 2026-02-25
- FulOverdueAndLostLoanLetter: Done. No significant update compared to UG's version.
- FulOverdueAndLostLoanNotificationLetter: Updated explanation texts. - Updated 2026-02-25
- FulRenewEmailLetter: AFNLetterNameTemplate added under footer.- Updated 2026-02-25

2025.12.04
- FulRequestsReportLetter: Added "check service hour" notification. UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to update accrodingly.
- FulReasourceRequestSlipLetter: Included "@item_barcode", "@isbn", "@imprint", "@move_to_library", "@request_type" and footer to the letter. - Updated 2026-02-26
- FulTransitSlipLetter: Done. No significant update compared to UG's version.
- GeneralMessageEmailLetter: AFNLetterNameTemplate added under footer. - Updated 2026-02-25
- [currently Disabled]HoldShelfExpiryDateUpdateLetter: Added logic to check if it's EMAIL partner, and updated French version. Also, UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to sync with that.
- InterestedInLetter: Added a "Link to Resource". If keep this link, need to update to LU's link. - Updated 2026-03-18
- LenderChecked-inEmailLetter: Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- LenderRejectEmailLetter: Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- LenderRenewResponseEmailLetter: Included "@Province" and "@Postal code" in the letter, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- LenderShipEmailLetter: Included "@Due date" and "@Shipping cost" in the letter. - Updated 2026-02-26
- LenderWillSupplyEmailLetter: Included "@Due date" and "@Shipping cost" in the letter, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- LendingRecallEmailLetter: Included "@Shipping cost", "@Province" and "@Postal code" in the letter, AFNLetterNameTemplate added under footer. - Updated 2026-02-26
- LoanStatusNotice: Done. No significant update compared to UG's version.
- OnHoldShelfLetter: Done. No significant update compared to UG's version. UG has Home Delivery & Curbside Pickup option, since we do not provide this service, there's no need to update accrodingly.
- OnHoldShelfReminderLetter: Added logic to check if it's EMAIL partner. - Updated 2026-02-25
- OverdueNoticeLetter: : Done. No significant update compared to UG's version.
- QueryToPatronLetter: Done. No significant update compared to UG's version.
- [currently Disabled]ResetPasswordLetter: Done. No significant update compared to UG's version.
- ResourceSharingReceiveSlipLetter: The letter in the system is mistakenly presenting unmatched XSL. Update the whole letter with UG's version. - updated 2026-02-25
- ResourceSharingReturnSlipLetter: Done. No significant update compared to UG's version.
- ReturnReceiptLetter: Added logic to check if it's EMAIL partner. - Updated 2026-02-26
- SavedSearchesLetter: Done. No significant update compared to UG's version.
- [currently Disabled]ShortenedDueDateLetter: Done. No significant update compared to UG's version.
- [currently Disabled]SocialLoginInviteLetter: Done. No significant update compared to UG's version.
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
