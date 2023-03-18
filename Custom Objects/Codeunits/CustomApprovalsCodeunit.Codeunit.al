#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52186461 "Custom Approvals Codeunit"
{

    trigger OnRun()
    begin
        AddWorkflowEventsToLibrary
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';
        OnSendPaymentApprovalRequestTxt: label 'Approval of a Payment is requested';
        // //         "----------------------"": 'Comment';
        RunWorkflowOnSendPaymentForApprovalCode: label 'RUNWORKFLOWONSENDPAYMENTFORAPPROVAL';
        RunWorkflowOnCancelPaymentForApprovalCode: label 'RUNWORKFLOWONCANCELPAYMENTFORAPPROVAL';
        OnCancelPaymentApprovalRequestTxt: label 'An Approval of a Payment is canceled';
        // //         "----------------------------"": 'Comment';
        RunWorkflowOnSendSkyVirtualMemberForApprovalCode: label 'RUNWORKFLOWONSENDSKYVIRTUALMEMBERFORAPPROVAL';
        RunWorkflowOnCancelSkyVirtualMemberForApprovalCode: label 'RUNWORKFLOWONCANCELSKYVIRTUALMEMBERFORAPPROVAL';
        OnCancelSkyVirtualMemberApprovalRequestTxt: label 'An Approval of a Sky Virtual Member is canceled';
        OnSendSkyVirtualMemberApprovalRequestTxt: label 'Approval of a Sky Virtual Member is requested';
        // //         "---------------------------------"": 'Comment';
        OnSendInterbankApprovalRequestTxt: label 'Approval of a Interbank is requested';
        RunWorkflowOnSendInterbankForApprovalCode: label 'RUNWORKFLOWONSENDINTERBANKFORAPPROVAL';
        OnCancelInterbankApprovalRequestTxt: label 'An Approval of a Interbank is canceled';
        RunWorkflowOnCancelInterbankForApprovalCode: label 'RUNWORKFLOWONCANCELINTERBANKFORAPPROVAL';
        OnSendStaffClaimApprovalRequestTxt: label 'Approval of a Staff Claim is requested';
        RunWorkflowOnSendStaffClaimForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFCLAIMFORAPPROVAL';
        OnCancelStaffClaimApprovalRequestTxt: label 'An Approval of a Staff Claim is canceled';
        RunWorkflowOnCancelStaffClaimForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFCLAIMFORAPPROVAL';
        OnSendStaffAdvanceApprovalRequestTxt: label 'Approval of a Staff Advance is requested';
        RunWorkflowOnSendStaffAdvanceForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFADVANCEFORAPPROVAL';
        OnCancelStaffAdvanceApprovalRequestTxt: label 'An Approval of a Staff Advance is canceled';
        RunWorkflowOnCancelStaffAdvanceForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFADVANCEFORAPPROVAL';
        OnSendStaffAdvanceSurrenderApprovalRequestTxt: label 'Approval of a Staff Advance Surrender is requested';
        RunWorkflowOnSendStaffAdvanceSurrenderForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFADVANCESURRENDERFORAPPROVAL';
        OnCancelStaffAdvanceSurrenderApprovalRequestTxt: label 'An Approval of a Staff Advance Surrender is canceled';
        RunWorkflowOnCancelStaffAdvanceSurrenderForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFADVANCESURRENDERFORAPPROVAL';
        OnSendStoreRequisitionApprovalRequestTxt: label 'Approval of a Store Requisition is requested';
        RunWorkflowOnSendStoreRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDSTOREREQUISITIONFORAPPROVAL';
        OnCancelStoreRequisitionApprovalRequestTxt: label 'An Approval of a Store Requisition is canceled';
        RunWorkflowOnCancelStoreRequisitionForApprovalCode: label 'RUNWORKFLOWONCANCELSTOREREQUISITIONFORAPPROVAL';
        OnSendImprestApprovalRequestTxt: label 'Approval of a Imprest is requested';
        RunWorkflowOnSendImprestForApprovalCode: label 'RUNWORKFLOWONSENDIMPRESTFORAPPROVAL';
        OnCancelImprestApprovalRequestTxt: label 'An Approval of a Imprest is canceled';
        RunWorkflowOnCancelImprestForApprovalCode: label 'RUNWORKFLOWONCANCELIMPRESTFORAPPROVAL';
        OnSendImprestSurrenderApprovalRequestTxt: label 'Approval of a Imprest Surrender is requested';
        RunWorkflowOnSendImprestSurrenderForApprovalCode: label 'RUNWORKFLOWONSENDIMPRESTSURRENDERFORAPPROVAL';
        OnCancelImprestSurrenderApprovalRequestTxt: label 'An Approval of a Imprest Surrender is canceled';
        RunWorkflowOnCancelImprestSurrenderForApprovalCode: label 'RUNWORKFLOWONCANCELIMPRESTSURRENDERFORAPPROVAL';
        OnSendOvertimeApprovalRequestTxt: label 'Approval of a Overtime is requested';
        RunWorkflowOnSendOvertimeForApprovalCode: label 'RUNWORKFLOWONSENDOVERTIMEFORAPPROVAL';
        OnCancelOvertimeApprovalRequestTxt: label 'An Approval of a Overtime is canceled';
        RunWorkflowOnCancelOvertimeForApprovalCode: label 'RUNWORKFLOWONCANCELOVERTIMEFORAPPROVAL';
        OnSendBudgetApprovalRequestTxt: label 'Approval of a Budget is requested';
        RunWorkflowOnSendBudgetForApprovalCode: label 'RUNWORKFLOWONSENDBUDGETFORAPPROVAL';
        OnCancelBudgetApprovalRequestTxt: label 'An Approval of a Budget is canceled';
        RunWorkflowOnCancelBudgetForApprovalCode: label 'RUNWORKFLOWONCANCELBUDGETFORAPPROVAL';
        OnSendVoteApprovalRequestTxt: label 'Approval of a Vote Transfer is requested';
        RunWorkflowOnSendVoteForApprovalCode: label 'RUNWORKFLOWONSENDVOTEFORAPPROVAL';
        OnCancelVoteApprovalRequestTxt: label 'An Approval of a Vote is canceled';
        RunWorkflowOnCancelVoteForApprovalCode: label 'RUNWORKFLOWONCANCELVOTEFORAPPROVAL';
        OnSendWorkplanApprovalRequestTxt: label 'Approval of a Workplan is requested';
        RunWorkflowOnSendWorkplanForApprovalCode: label 'RUNWORKFLOWONSENDWORKPLANFORAPPROVAL';
        OnCancelWorkplanApprovalRequestTxt: label 'An Approval of a Workplan is canceled';
        RunWorkflowOnCancelWorkplanForApprovalCode: label 'RUNWORKFLOWONCANCELWORKPLANFORAPPROVAL';
        OnSendAssetTransferApprovalRequestTxt: label 'Approval of an Asset Transfer is requested';
        RunWorkflowOnSendAssetTransferForApprovalCode: label 'RUNWORKFLOWONSENDASSETTRANSFERFORAPPROVAL';
        OnCancelAssetTransferApprovalRequestTxt: label 'An Approval of an Asset Transfer is canceled';
        RunWorkflowOnCancelAssetTransferForApprovalCode: label 'RUNWORKFLOWONCANCELASSETTRANSFERFORAPPROVAL';
        "*************CORETEC": label 'SACCO***********************';
        OnSendCashierTRANSApprovalRequestTxt: label 'Approval of a Cashier Transaction is requested';
        RunWorkflowOnSendCashierTRANSForApprovalCode: label 'RUNWORKFLOWONSENDCASHIERTRANSFORAPPROVAL';
        OnCancelCashierTRANSApprovalRequestTxt: label 'An Approval of Cashier Transaction is canceled';
        RunWorkflowOnCancelCashierTRANSForApprovalCode: label 'RUNWORKFLOWONCANCELCASHIERTRANSFORAPPROVAL';
        OnSendSalaryTRANSApprovalRequestTxt: label 'Approval of Salary Transaction is requested';
        RunWorkflowOnSendSalaryTRANSForApprovalCode: label 'RUNWORKFLOWONSENDSALARYTRANSFORAPPROVAL';
        OnCancelSalaryTRANSApprovalRequestTxt: label 'An Approval of Salary Transaction is canceled';
        RunWorkflowOnCancelSalaryTRANSForApprovalCode: label 'RUNWORKFLOWONCANCELSALARYTRANSFORAPPROVAL';
        OnSendBankersCApprovalRequestTxt: label 'Approval of Bankers Cheque  is requested';
        RunWorkflowOnSendBankersCForApprovalCode: label 'RUNWORKFLOWONSENDBANKERSCSFORAPPROVAL';
        OnCancelBankersCApprovalRequestTxt: label 'An Approval of bankers Cheque is canceled';
        RunWorkflowOnCancelBankersCForApprovalCode: label 'RUNWORKFLOWONCANCELBANKERSCTRANSFORAPPROVAL';
        OnSendBankCApprovalRequestTxt: label 'Approval of Bank Cheque  is requested';
        RunWorkflowOnSendBankCForApprovalCode: label 'RUNWORKFLOWONSENDBANKCSFORAPPROVAL';
        OnCancelBankCApprovalRequestTxt: label 'An Approval of bank Cheque is canceled';
        RunWorkflowOnCancelBankCForApprovalCode: label 'RUNWORKFLOWONCANCELBANKCTRANSFORAPPROVAL';
        OnSendODApprovalRequestTxt: label 'Approval of Over Draft is requested';
        RunWorkflowOnSendODForApprovalCode: label 'RUNWORKFLOWONSENDODSFORAPPROVAL';
        OnCancelODApprovalRequestTxt: label 'An Approval of Over Draft Request is canceled';
        RunWorkflowOnCancelODForApprovalCode: label 'RUNWORKFLOWONCANCELODTRANSFORAPPROVAL';
        OnSendACTApprovalRequestTxt: label 'Approval of Transfer is requested';
        RunWorkflowOnSendACTForApprovalCode: label 'RUNWORKFLOWONSENDACTSFORAPPROVAL';
        OnCancelACTApprovalRequestTxt: label 'An Approval of Transfer Request is canceled';
        RunWorkflowOnCancelACTForApprovalCode: label 'RUNWORKFLOWONCANCELACTTRANSFORAPPROVAL';
        OnSendTREASApprovalRequestTxt: label 'Approval of Interteller Transfer is requested';
        RunWorkflowOnSendTREASForApprovalCode: label 'RUNWORKFLOWONSENDTREASSFORAPPROVAL';
        OnCancelTREASApprovalRequestTxt: label 'An Approval of Interteller Transfer Request is canceled';
        RunWorkflowOnCancelTREASForApprovalCode: label 'RUNWORKFLOWONCANCELTREASTRANSFORAPPROVAL';
        OnSendINVApprovalRequestTxt: label 'Approval of Treasury Investment is requested';
        RunWorkflowOnSendINVForApprovalCode: label 'RUNWORKFLOWONSENDINVFORAPPROVAL';
        OnCancelINVApprovalRequestTxt: label 'An Approval of Treasury Investment Request is canceled';
        RunWorkflowOnCancelINVForApprovalCode: label 'RUNWORKFLOWONCANCELINVFORAPPROVAL';
        OnSendCHQApprovalRequestTxt: label 'Approval of Bank Cheque Transaction is requested';
        RunWorkflowOnSendCHQForApprovalCode: label 'RUNWORKFLOWONSENDCHQFORAPPROVAL';
        OnCancelCHQApprovalRequestTxt: label 'An Approval of bank Cheque Transactions Request is canceled';
        RunWorkflowOnCancelCHQForApprovalCode: label 'RUNWORKFLOWONCANCELCHQFORAPPROVAL';
        OnSendDocExApprovalRequestTxt: label 'Approval of Document Exemptions Approvals is requested';
        RunWorkflowOnSendDocExForApprovalCode: label 'RUNWORKFLOWONSENDDOCEXFORAPPROVAL';
        OnCancelDocExApprovalRequestTxt: label 'An Approval of Document Exemption Request is canceled';
        RunWorkflowOnCancelDocExForApprovalCode: label 'RUNWORKFLOWONCANCELDOCEXFORAPPROVAL';
        // //         "="": 'Comment';
        OnSendMemberAppApprovalRequestTxt: label 'Approval of Member Application is requested';
        RunWorkflowOnSendMemberAppForApprovalCode: label 'RUNWORKFLOWONSENDMemberAppFORAPPROVAL';
        OnCancelMemberAppApprovalRequestTxt: label 'An Approval of Member Application is canceled';
        RunWorkflowOnCancelMemberAppForApprovalCode: label 'RUNWORKFLOWONCANCELMemberAppFORAPPROVAL';
        OnSendAccountAppApprovalRequestTxt: label 'Approval of Account Application is requested';
        RunWorkflowOnSendAccountAppForApprovalCode: label 'RUNWORKFLOWONSENDAccountAppFORAPPROVAL';
        OnCancelAccountAppApprovalRequestTxt: label 'An Approval of Account Application is canceled';
        RunWorkflowOnCancelAccountAppForApprovalCode: label 'RUNWORKFLOWONCANCELAccountAppFORAPPROVAL';
        OnSendEFTAppApprovalRequestTxt: label 'Approval of EFT Application is requested';
        RunWorkflowOnSendEFTAppForApprovalCode: label 'RUNWORKFLOWONSENDEFTAppFORAPPROVAL';
        OnCancelEFTAppApprovalRequestTxt: label 'An Approval of EFT Application is canceled';
        RunWorkflowOnCancelEFTAppForApprovalCode: label 'RUNWORKFLOWONCANCELEFTAppFORAPPROVAL';
        OnSendSTOAppApprovalRequestTxt: label 'Approval of Standing Order Application is requested';
        RunWorkflowOnSendSTOAppForApprovalCode: label 'RUNWORKFLOWONSENDSTOAppFORAPPROVAL';
        OnCancelSTOAppApprovalRequestTxt: label 'An Approval of Standing Order Application is canceled';
        RunWorkflowOnCancelSTOAppForApprovalCode: label 'RUNWORKFLOWONCANCELSTOAppFORAPPROVAL';
        OnSendPFAAppApprovalRequestTxt: label 'Approval of Product Factory Application is requested';
        RunWorkflowOnSendPFAAppForApprovalCode: label 'RUNWORKFLOWONSEND ProductFactoryAppFORAPPROVAL';
        OnCancelPFAAppApprovalRequestTxt: label 'An Approval of  Product Factory Application is canceled';
        RunWorkflowOnCancelPFAAppForApprovalCode: label 'RUNWORKFLOWONCANCEL ProductFactoryAppFORAPPROVAL';
        OnSendCollateralApprovalRequestTxt: label 'Approval of Collateral Application is requested';
        RunWorkflowOnSendCollateralForApprovalCode: label 'RUNWORKFLOWONSENDCollateralFORAPPROVAL';
        OnCancelCollateralApprovalRequestTxt: label 'An Approval of Collateral Application is canceled';
        RunWorkflowOnCancelCollateralForApprovalCode: label 'RUNWORKFLOWONCANCELCollateralFORAPPROVAL';
        OnSendMortgageDocReleaseApprovalRequestTxt: label 'Approval of Mortgage Doc Release Application is requested';
        RunWorkflowOnSendMortgageDocReleaseForApprovalCode: label 'RUNWORKFLOWONSENDMortgageDocReleaseFORAPPROVAL';
        OnCancelMortgageDocReleaseApprovalRequestTxt: label 'An Approval of Mortgage Doc Release Application is canceled';
        RunWorkflowOnCancelMortgageDocReleaseForApprovalCode: label 'RUNWORKFLOWONCANCELMortgageDocReleaseFORAPPROVAL';
        // //         "-"": 'Comment';
        OnSendSTOCTLAppApprovalRequestTxt: label 'Approval of Standing Order Control Application is requested';
        RunWorkflowOnSendSTOCTLAppForApprovalCode: label 'RUNWORKFLOWONSENDSTOCTLAppFORAPPROVAL';
        OnCancelSTOCTLAppApprovalRequestTxt: label 'An Approval of Standing Order Control Application is canceled';
        RunWorkflowOnCancelSTOCTLAppForApprovalCode: label 'RUNWORKFLOWONCANCELSTOCTLAppFORAPPROVAL';
        // //         "..........."": 'Comment';
        OnSendDelegateAppApprovalRequestTxt: label 'Approval of Delegates Application is requested';
        RunWorkflowOnSendDelegatesAppForApprovalCode: label 'RUNWORKFLOWONSENDDelegatesAppFORAPPROVAL';
        OnCancelDelegatesAppApprovalRequestTxt: label 'An Approval of Delegates Application is canceled';
        RunWorkflowOnCancelDelegatesAppForApprovalCode: label 'RUNWORKFLOWONCANCELDelegatesAppFORAPPROVAL';
        // //         "---"": 'Comment';
        OnSendSalaryAgreementAppApprovalRequestTxt: label 'Approval of Salary Agreement Application is requested';
        RunWorkflowOnSendSalaryAgreementForApprovalCode: label 'RUNWORKFLOWONSENDSalaryAgreementFORAPPROVAL';
        OnCancelSalaryAgreementApprovalRequestTxt: label 'An Approval of SalaryAgreement Application is canceled';
        RunWorkflowOnCancelSalaryAgreementForApprovalCode: label 'RUNWORKFLOWONCANCELSalaryAgreementFORAPPROVAL';
        // //         "--"": 'Comment';
        OnSendPermissionRequisitionAppApprovalRequestTxt: label 'Approval of Permission Requisition Application is requested';
        RunWorkflowOnSendPermissionRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDPermissionRequisitionFORAPPROVAL';
        OnCancelPermissionRequisitionApprovalRequestTxt: label 'An Approval of Permission Requisition Application is canceled';
        RunWorkflowOnCancelPermissionRequisitionForApprovalCode: label 'RUNWORKFLOWONCANCELPermissionRequisitionFORAPPROVAL';
        // //         "-----------"": 'Comment';
        OnSendLoanAppApprovalRequestTxt: label 'An Approval of Loan Application is requested';
        RunWorkflowOnSendLoanAppForApprovalCode: label 'RUNWORKFLOWONSENDLoanAppFORAPPROVAL';
        OnCancelLoanAppApprovalRequestTxt: label 'An Approval of Loan Application is canceled';
        RunWorkflowOnCancelLoanAppForApprovalCode: label 'RUNWORKFLOWONCANCELLoanAppFORAPPROVAL';
        RunWorkflowOnSendInterestBillingForApprovalCode: label 'RUNWORKFLOWONSENDInterestBillingFORAPPROVAL';
        OnCancelInterestBillingApprovalRequestTxt: label 'An Approval of Interest Billing is canceled';
        RunWorkflowOnCancelInterestBillingForApprovalCode: label 'RUNWORKFLOWONCANCELInterestBillingFORAPPROVAL';
        OnSendInterestBillingApprovalRequestTxt: label 'Approval of Interest Billing Application is requested';
        RunWorkflowOnSendSavingsInterestHeaderForApprovalCode: label 'RunWorkflowOnSendSavingsInterestHeaderFORAPPROVAL';
        OnSendSavingsInterestHeaderApprovalRequestTxt: label 'Approval of Savings Interest Header is requested';
        RunWorkflowOnCancelSavingsInterestHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELSavingsInterestHeaderFORAPPROVAL';
        OnCancelSavingsInterestHeaderApprovalRequestTxt: label 'An Approval of Savings Interest Header is canceled';
        RunWorkflowOnSendEndYearTransferHeaderForApprovalCode: label 'RunWorkflowOnSendEndYearTransferHeaderFORAPPROVAL';
        OnSendEndYearTransferHeaderApprovalRequestTxt: label 'Approval of End Year Transfer Header is requested';
        RunWorkflowOnCancelEndYearTransferHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELEndYearTransferHeaderFORAPPROVAL';
        OnCancelEndYearTransferHeaderApprovalRequestTxt: label 'An Approval of End Year Transfer Header is canceled';
        RunWorkflowOnSendATMApplicationsForApprovalCode: label 'RunWorkflowOnSendATMApplicationsFORAPPROVAL';
        OnSendATMApplicationsApprovalRequestTxt: label 'Approval of ATM Applications is requested';
        RunWorkflowOnCancelATMApplicationsForApprovalCode: label 'RUNWORKFLOWONCANCELATMApplicationsFORAPPROVAL';
        OnCancelATMApplicationsApprovalRequestTxt: label 'An Approval of ATM Applications is canceled';
        // //         "2222222222"": 'Comment';
        RunWorkflowOnSendATMLinkingApplicationsForApprovalCode: label 'RunWorkflowOnSendATMLinkingApplicationsFORAPPROVAL';
        OnSendATMLinkingApplicationsApprovalRequestTxt: label 'Approval of ATM Linking Applications is requested';
        RunWorkflowOnCancelATMLinkingApplicationsForApprovalCode: label 'RUNWORKFLOWONCANCELATMLinkingApplicationsFORAPPROVAL';
        OnCancelATMLinkingApplicationsApprovalRequestTxt: label 'An Approval of ATM Linking Applications is canceled';
        OnSendLoanBatchApprovalRequestTxt: label 'An Approval of Loan Batch is requested';
        RunWorkflowOnSendLoanBatchForApprovalCode: label 'RUNWORKFLOWONSENDLoanBatchAppFORAPPROVAL';
        OnCancelLoanBatchApprovalRequestTxt: label 'An Approval of Loan Batch is canceled';
        RunWorkflowOnCancelLoanBatchForApprovalCode: label 'RUNWORKFLOWONCANCELLoanBatchFORAPPROVAL';
        OnSendDividendRateAppApprovalRequestTxt: label 'Approval of Dividend Rate Application is requested';
        RunWorkflowOnSendDividendRateAppForApprovalCode: label 'RUNWORKFLOWONSENDDividendtRateAppFORAPPROVAL';
        OnCancelDividendRateAppApprovalRequestTxt: label 'An Approval of Dividend Rate Application is canceled';
        RunWorkflowOnCancelDividendRateAppForApprovalCode: label 'RUNWORKFLOWONCANCELDividendtRateAppFORAPPROVAL';
        OnSendCheckoffAppApprovalRequestTxt: label 'Approval of checkoff Application is requested';
        RunWorkflowOnSendCheckoffAppForApprovalCode: label 'RUNWORKFLOWONSENDCheckoffAppFORAPPROVAL';
        OnCancelCheckoffAppApprovalRequestTxt: label 'An Approval of Checkoff Application is canceled';
        RunWorkflowOnCancelCheckoffAppForApprovalCode: label 'RUNWORKFLOWONCANCELCheckoffAppFORAPPROVAL';
        OnSendMembershipClosureAppApprovalRequestTxt: label 'Approval of Membership Closure Application is requested';
        RunWorkflowOnSendMembershipClosureAppForApprovalCode: label 'RUNWORKFLOWONSEND Membership Closure AppFORAPPROVAL';
        OnCancelMembershipClosureAppApprovalRequestTxt: label 'An Approval of Membership Closure Application is canceled';
        RunWorkflowOnCancelMembershipClosureAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Membership Closure AppFORAPPROVAL';
        OnSendLoanRescheduleAppApprovalRequestTxt: label 'Approval of Loan Reschedule is requested';
        RunWorkflowOnSendLoanRescheduleAppForApprovalCode: label 'RUNWORKFLOWONSEND Loan Reschedule AppFORAPPROVAL';
        OnCancelLoanRescheduleAppApprovalRequestTxt: label 'An Approval of Loan Reschedule is canceled';
        RunWorkflowOnCancelLoanRescheduleAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Loan Reschedule AppFORAPPROVAL';
        OnSendWithdrawalNoticeAppApprovalRequestTxt: label 'Approval of Withdrawal Notice is requested';
        RunWorkflowOnSendWithdrawalNoticeAppForApprovalCode: label 'RUNWORKFLOWONSEND Withdrawal Notice AppFORAPPROVAL';
        OnCancelWithdrawalNoticeAppApprovalRequestTxt: label 'An Approval of Withdrawal Notice is canceled';
        RunWorkflowOnCancelWithdrawalNoticeAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Withdrawal Notice AppFORAPPROVAL';
        OnSendDRAppApprovalRequestTxt: label 'Approval of Deactivation/Reactivation Application is requested';
        RunWorkflowOnSendDRAppForApprovalCode: label 'RUNWORKFLOWONSENDDRAppFORAPPROVAL';
        OnCancelDRAppApprovalRequestTxt: label 'An Approval of Deactivation/Reactivation Application is canceled';
        RunWorkflowOnCancelDRAppForApprovalCode: label 'RUNWORKFLOWONCANCELDRAppFORAPPROVAL';
        OnSendGuarantorSubstitutionApprovalRequestTxt: label 'Approval of Guarantor Substitution Application is requested';
        RunWorkflowOnSendGuarantorSubstitutionAppForApprovalCode: label 'RUNWORKFLOWONSEND Guarantor Substitution AppFORAPPROVAL';
        OnCancelGuarantorSubstitutionAppApprovalRequestTxt: label 'An Approval of Guarantor Substitution Application is canceled';
        RunWorkflowOnCancelGuarantorSubstitutionAppForApprovalCode: label 'RUNWORKFLOWONCANCELGuarantor Substitution AppFORAPPROVAL';
        OnSendRecoveryHeaderApprovalRequestTxt: label 'Approval of Loan Recovery Header is requested';
        RunWorkflowOnSendRecoveryHeaderAppForApprovalCode: label 'RUNWORKFLOWONSEND Loan Recovery Header AppFORAPPROVAL';
        OnCancelRecoveryHeaderAppApprovalRequestTxt: label 'An Approval of Loan Recovery Header Application is canceled';
        RunWorkflowOnCancelRecoveryHeaderAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Loan Recovery Header AppFORAPPROVAL';
        OnSendBondApprovalRequestTxt: label 'Approval of Bond is requested';
        RunWorkflowOnSendBondAppForApprovalCode: label 'RUNWORKFLOWONSEND Bond AppFORAPPROVAL';
        OnCancelBondAppApprovalRequestTxt: label 'An Approval of Bond Application is canceled';
        RunWorkflowOnCancelBondAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Bond AppFORAPPROVAL';
        OnSendSinkFundApprovalRequestTxt: label 'Approval of Sink Fund is requested';
        RunWorkflowOnSendSinkFundAppForApprovalCode: label 'RUNWORKFLOWONSEND Sink Fund AppFORAPPROVAL';
        OnCancelSinkFundAppApprovalRequestTxt: label 'An Approval of Sink Fund Application is canceled';
        RunWorkflowOnCancelSinkFundAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Sink Fund AppFORAPPROVAL';
        OnSendDelegateGroupsApplicationssApprovalRequestTxt: label 'Approval of Delegate Groups Applications is requested';
        RunWorkflowOnSendDelegateGroupsApplicationssForApprovalCode: label 'RUNWORKFLOWONSENDDelegateGroupsApplicationssFORAPPROVAL';
        OnCancelDelegateGroupsApplicationssApprovalRequestTxt: label 'An Approval of Delegate Groups Applications is canceled';
        RunWorkflowOnCancelDelegateGroupsApplicationssForApprovalCode: label 'RUNWORKFLOWONCANCELDelegate Groups ApplicationsFORAPPROVAL';
        OnSendDelegateGroupMemRetirementsApprovalRequestTxt: label 'Approval of Delegate Group Member Retirements is requested';
        RunWorkflowOnSendDelegateGroupMemRetirementsForApprovalCode: label 'RUNWORKFLOWONSENDDelegateGroupMemRetirementsFORAPPROVAL';
        OnCancelDelegateGroupMemRetirementsApprovalRequestTxt: label 'An Approval of Delegate Group Member Retirements is canceled';
        RunWorkflowOnCancelDelegateGroupMemRetirementsForApprovalCode: label 'RUNWORKFLOWONCANCELDelegateGroupMemRetirementsFORAPPROVAL';
        OnSendBDEManagementApprovalRequestTxt: label 'Approval of BDE Management is requested';
        RunWorkflowOnSendBDEManagementAppForApprovalCode: label 'RUNWORKFLOWONSEND BDE Management AppFORAPPROVAL';
        OnCancelBDEManagementAppApprovalRequestTxt: label 'An Approval of BDE Management Application is canceled';
        RunWorkflowOnCancelBDEManagementAppForApprovalCode: label 'RUNWORKFLOWONCANCEL BDE Management AppFORAPPROVAL';
        OnSendDelegatesPaymentApprovalRequestTxt: label 'Approval of Delegates Payment is requested';
        RunWorkflowOnSendDelegatesPaymentForApprovalCode: label 'RUNWORKFLOWONSENDDelegatesPaymentFORAPPROVAL';
        OnCancelDelegatesPaymentApprovalRequestTxt: label 'An Approval of Delegates Payment is canceled';
        RunWorkflowOnCancelDelegatesPaymentForApprovalCode: label 'RUNWORKFLOWONCANCELDelegatesPaymentFORAPPROVAL';
        // //         "====Agency===="": 'Comment';
        OnSendAgentApplicationApprovalRequestTxt: label 'Approval of Agent Application is requested';
        RunWorkflowOnSendAgentApplicationForApprovalCode: label 'RUNWORKFLOWONSENDAgentApplicationFORAPPROVAL';
        OnCancelAgentApplicationApprovalRequestTxt: label 'An Approval of Agent Application is canceled';
        RunWorkflowOnCancelAgentApplicationForApprovalCode: label 'RUNWORKFLOWONCANCELAgentApplicationFORAPPROVAL';
        OnCancelEmployeeRequisitionAppApprovalRequestTxt: label 'An Approval of Employee Requisition Application is canceled';
        RunWorkflowOnCancelEmployeeRequisitionAppForApprovalCode: label 'RUNWORKFLOWONCANCEEmployeeRequisitionAppFORAPPROVAL';
        OnSendlEmployeeRequisitionAppApprovalRequestTxt: label 'Approval oflEmployee Requisition is requested';
        RunWorkflowOnSendEmployeeRequisitionAppForApprovalCode: label 'RUNWORKFLOWONSENDEmployeeRequisitionAppFORAPPROVAL';
        OnSendleaveAppApprovalRequestTxt: label 'Approval of leave Application is requested';
        RunWorkflowOnSendLeaveForApprovalCode: label 'RUNWORKFLOWONSENDleaveAppFORAPPROVAL';
        OnCancelleaveAppApprovalRequestTxt: label 'An Approval of leave Application is canceled';
        OnSendStaffLoanAppApprovalRequestTxt: label 'Approval of Staff Loan Application is requested';
        RunWorkflowOnSendStaffLoansForApprovalCode: label 'RUNWORKFLOWONSENDStaffLoanAppFORAPPROVAL';
        OnCancelStaffLoanAppApprovalRequestTxt: label 'An Approval of Staff Loan Application is canceled';
        RunWorkflowOnCancelStaffLoanAppForApprovalCode: label 'RUNWORKFLOWONCANCELStaffLoanAppFORAPPROVAL';
        RunWorkflowOnCancelleaveAppForApprovalCode: label 'RUNWORKFLOWONCANCELleaveAppFORAPPROVAL';
        OnSendTrainingAppApprovalRequestTxt: label 'Approval of Training Application is requested';
        RunWorkflowOnSendTrainingForApprovalCode: label 'RUNWORKFLOWONSENDTrainingAppFORAPPROVAL';
        OnCancelTrainingAppApprovalRequestTxt: label 'An Approval of Training Application is canceled';
        RunWorkflowOnCancelTrainingAppForApprovalCode: label 'RUNWORKFLOWONCANCELTrainingAppFORAPPROVAL';
        OnSendJobAppApprovalRequestTxt: label 'Approval of HR Job is requested';
        RunWorkflowOnSendJobAppForApprovalCode: label 'RUNWORKFLOWONSENDJOBAPPFORAPPROVAL';
        OnCancelJobAppApprovalRequestTxt: label 'An Approval of HR Job is canceled';
        RunWorkflowOnCancelJobAppForApprovalCode: label 'RUNWORKFLOWONCANCELJOBAPPFORAPPROVAL';
        OnSendEmpTransferAppApprovalRequestTxt: label 'Approval of Employee Transfer is requested';
        RunWorkflowOnSendEmpTransferAppForApprovalCode: label 'RUNWORKFLOWONSENDEmpTransferAppFORAPPROVAL';
        OnCancelEmpTransferAppApprovalRequestTxt: label 'An Approval of Employee Transfer is canceled';
        RunWorkflowOnCancelEmpTransferAppForApprovalCode: label 'RUNWORKFLOWONCANCELEmpTransferAppFORAPPROVAL';
        OnSendPlannerAppApprovalRequestTxt: label 'Approval of leave Planner is requested';
        RunWorkflowOnSendPlannerAppForApprovalCode: label 'RUNWORKFLOWONSENDPlannerAppFORAPPROVAL';
        OnCancelPlannerAppApprovalRequestTxt: label 'An Approval of leave Planner is canceled';
        RunWorkflowOnCancelPlannerAppForApprovalCode: label 'RUNWORKFLOWONCANCELPlannerAppFORAPPROVAL';
        OnSendEmployeeAppApprovalRequestTxt: label 'Approval of Employee Application is requested';
        RunWorkflowOnSendEmployeeAppForApprovalCode: label 'RUNWORKFLOWONSENDEmployeeAppFORAPPROVAL';
        OnCancelEmployeeAppApprovalRequestTxt: label 'An Approval of Employee Application is canceled';
        RunWorkflowOnCancelEmployeeAppForApprovalCode: label 'RUNWORKFLOWONCANCELEmployeeAppFORAPPROVAL';
        OnSendInternReqAppApprovalRequestTxt: label 'Approval of Intern Requisition is requested';
        RunWorkflowOnSendInternReqAppForApprovalCode: label 'RUNWORKFLOWONSENDInternReqFORAPPROVAL';
        OnCancelInternReqAppApprovalRequestTxt: label 'An Approval of Intern Requisition is canceled';
        RunWorkflowOnCancelInternReqAppForApprovalCode: label 'RUNWORKFLOWONCANCELInternReqAppFORAPPROVAL';
        OnSendTransportAppApprovalRequestTxt: label 'Approval of Transport Requisition is requested';
        RunWorkflowOnSendTransportForApprovalCode: label 'RUNWORKFLOWONSENDTransportFORAPPROVAL';
        OnCancelTransportAppApprovalRequestTxt: label 'An Approval of Transport Requisition is canceled';
        RunWorkflowOnCancelTransportAppForApprovalCode: label 'RUNWORKFLOWONCANCELTransportAppFORAPPROVAL';
        OnSendMSACCOPINApprovalRequest: label 'Approval of MSACCO PIN Change Request';
        RunWorkflowOnSendMSACCOPINApprovalCode: label 'RUNWORKFLOWSENDMSACCOPINFORAPPROVAL';
        OnCancelMSACCOPINApprovalRequest: label 'An Approval of MSACCO PIN CHANGE is Cancelled';
        RunWorkflowOnCancelMSACCOPINRequestApprovalCode: label 'RUNWORKFLOWONCANCELMSACCOPINChangeFORAPPROVAL';
        OnSendMsaccoApplicationApprovalRequest: label 'Approval of MSACCO Application Request';
        RunWorkflowOnSendMsaccoApplicationApprovalCode: label 'RUNWORKFLOWSENDMSACCOAPPLICATIONFORAPPROVAL';
        OnCancelMsaccoAPPLICATIONApprovalRequest: label 'An Approval of MSACCO APPLICATION is Cancelled';
        RunWorkflowOnCancelMsaccoAPPLICATIONRequestApprovalCode: label 'RUNWORKFLOWONCANCELMSACCOAPPLICATIONFORAPPROVAL';
        OnSendMSACCOChangeApprovalRequest: label 'Approval of MSACCO Change Request';
        RunWorkflowOnSendMSACCOChangeApprovalCode: label 'RUNWORKFLOWSENDMSACCOCHANGEFORAPPROVAL';
        OnCancelMSACCOChangeApprovalRequest: label 'An Approval of MSACCO CHANGE is Cancelled';
        RunWorkflowOnCancelMSACCOChangeRequestApprovalCode: label 'RUNWORKFLOWONCANCELMSACCOCHANGEFORAPPROVAL';
        OnSendTNeedAppApprovalRequestTxt: label 'Approval of Training Need Application is requested';
        RunWorkflowOnSendTNeedForApprovalCode: label 'RUNWORKFLOWONSENDTNeedAppFORAPPROVAL';
        OnCancelTNeedAppApprovalRequestTxt: label 'An Approval of Training Need Application is canceled';
        RunWorkflowOnCanceTNeedAppForApprovalCode: label 'RUNWORKFLOWONCANCELTNeedAppFORAPPROVAL';
        RunWorkflowOnCancelTNeedAppForApprovalCode: label 'RUNWORKFLOWONCANCELTNeedAppFORAPPROVAL';
        OnSendDisciplinaryAppApprovalRequestTxt: label 'Approval of Disciplinary Application is requested';
        RunWorkflowOnSendDisciplinaryForApprovalCode: label 'RUNWORKFLOWONSENDDisciplinaryAppFORAPPROVAL';
        OnCancelDisciplinaryAppApprovalRequestTxt: label 'An Approval of Disciplinary Application is canceled';
        RunWorkflowOnCancelDisciplinaryAppForApprovalCode: label 'RUNWORKFLOWONCANCELDisciplinaryAppFORAPPROVAL';
        OnSendDisciplinaryAppealAppApprovalRequestTxt: label 'Approval of Disciplinary Appeal Application is requested';
        RunWorkflowOnSendDisciplinaryAppealForApprovalCode: label 'RUNWORKFLOWONSENDDisciplinaryAppealAppFORAPPROVAL';
        OnCancelDisciplinaryAppealAppApprovalRequestTxt: label 'An Approval of Disciplinary Appeal Application is canceled';
        RunWorkflowOnCancelDisciplinaryAppealAppForApprovalCode: label 'RUNWORKFLOWONCANCELDisciplinaryAppealAppFORAPPROVAL';
        OnSendDisciplinaryWithdrawalAppApprovalRequestTxt: label 'Approval of Disciplinary Withdrawal Application is requested';
        RunWorkflowOnSendDisciplinaryWithdrawalForApprovalCode: label 'RUNWORKFLOWONSENDDisciplinaryWithdrawalAppFORAPPROVAL';
        OnCancelDisciplinaryWithdrawalAppApprovalRequestTxt: label 'An Approval of Disciplinary Withdrawal Application is canceled';
        RunWorkflowOnCancelDisciplinaryWithdrawalAppForApprovalCode: label 'RUNWORKFLOWONCANCELDisciplinaryWithdrawalAppFORAPPROVAL';
        OnSendAppraisalAppealAppApprovalRequestTxt: label 'Approval of Appraisal Appeal Application is requested';
        RunWorkflowOnSendAppraisalAppealForApprovalCode: label 'RUNWORKFLOWONSENDAppraisalAppealAppFORAPPROVAL';
        OnCancelAppraisalAppealAppApprovalRequestTxt: label 'An Approval of Appraisal Appeal Application is canceled';
        RunWorkflowOnCancelAppraisalAppealAppForApprovalCode: label 'RUNWORKFLOWONCANCELAppraisalAppealAppFORAPPROVAL';
        "****ReturnCollateral": label '***';
        OnSendCollatReturnApprovalRequestTxt: label 'Approval of Collateral Return Application is requested';
        RunWorkflowOnSendCollateReturnForApprovalCode: label 'RUNWORKFLOWONSENDCollatReturnFORAPPROVAL';
        OnCancelCollatReturnApprovalRequestTxt: label 'An Approval of Collateral Return Application is cancelled';
        RunWorkflowOnCancelCollatReturnForApprovalCode: label 'RUNWORKFLOWONCANCELCollateraReturnlFORAPPROVAL';
        "**Property****": label '***';
        OnSendLeaseApprovalRequestTxt: label 'Approval of a Lease is requested';
        RunWorkflowOnSendLeaseForApprovalCode: label 'RUNWORKFLOWONSENDLEASEFORAPPROVAL';
        OnCancelLeaseApprovalRequestTxt: label 'An Approval of Lease is canceled';
        RunWorkflowOnCancelLeaseForApprovalCode: label 'RUNWORKFLOWONCANCELLEASEFORAPPROVAL';
        OnSendPropApprovalRequestTxt: label 'Approval of a Property is requested';
        RunWorkflowOnSendPropForApprovalCode: label 'RUNWORKFLOWONSENDPROPFORAPPROVAL';
        OnCancelPropApprovalRequestTxt: label 'An Approval of Property is canceled';
        RunWorkflowOnCancelPropForApprovalCode: label 'RUNWORKFLOWONCANCELPROPFORAPPROVAL';
        "***tfeed***": label 'gg';
        OnSendTFeedAppApprovalRequestTxt: label 'Approval of Training Feedback  is requested';
        RunWorkflowOnSendTFeedForApprovalCode: label 'RUNWORKFLOWONSENDTFeedAppFORAPPROVAL';
        OnCancelTFeedAppApprovalRequestTxt: label 'An Approval of Training Feedback Application is canceled';
        RunWorkflowOnCancelTFeedAppForApprovalCode: label 'RUNWORKFLOWONCANCELTFeedAPPFORAPPROVALCODE';
        OnSendInternAppApprovalRequestTxt: label 'Approval of Interns  is requested';
        RunWorkflowOnSendInternForApprovalCode: label 'RUNWORKFLOWONSENDInternAppFORAPPROVAL';
        OnCancelInternAppApprovalRequestTxt: label 'An Approval of Interns Application is canceled';
        RunWorkflowOnCancelInternAppForApprovalCode: label 'RUNWORKFLOWONCANCELInternAPPFORAPPROVALCODE';
        //         Contract": 'Comment';
        OnSendContractAppApprovalRequestTxt: label 'Approval of Contract  is requested';
        RunWorkflowOnSendContractForApprovalCode: label 'RUNWORKFLOWONSENDContractAppFORAPPROVAL';
        OnCancelContractAppApprovalRequestTxt: label 'An Approval of Contract Application is canceled';
        RunWorkflowOnCancelContractAppForApprovalCode: label 'RUNWORKFLOWONCANCELContractAPPFORAPPROVALCODE';
        //         Legal": 'Comment';
        OnSendLegalApprovalRequestTxt: label 'Approval of a Legal is requested';
        RunWorkflowOnSendLegalForApprovalCode: label 'RUNWORKFLOWONSENDLEGALFORAPPROVAL';
        OnCancelLegalApprovalRequestTxt: label 'An Approval of Legal is canceled';
        RunWorkflowOnCancelLegalForApprovalCode: label 'RUNWORKFLOWONCANCELLEGALFORAPPROVAL';
        //         Surety": 'Comment';
        OnSendSuretyApprovalRequestTxt: label 'Approval of a Surety is requested';
        RunWorkflowOnSendSuretyForApprovalCode: label 'RUNWORKFLOWONSENDSuretyFORAPPROVAL';
        OnCancelSuretyApprovalRequestTxt: label 'An Approval of Suretyl is canceled';
        RunWorkflowOnCancelSuretyForApprovalCode: label 'RUNWORKFLOWONCANCELSuretyFORAPPROVAL';
        OnSendBoardPaymentApprovalRequestTxt: label 'Approval of Board Payment is requested';
        RunWorkflowOnSendBoardPaymentForApprovalCode: label 'RUNWORKFLOWONSENDBOARDPAYMENTFORAPPROVAL';
        OnCancelBoardPaymentApprovalRequestTxt: label 'An Approval of Board Payment is canceled';
        RunWorkflowOnCancelBoardPaymentForApprovalCode: label 'RUNWORKFLOWONCANCELBOARDPAYMENTFORAPPROVAL';
        OnSendSinkFundReportApprovalRequestTxt: label 'Approval of a Sink Fund Report is requested';
        RunWorkflowOnSendSinkFundReportForApprovalCode: label 'RUNWORKFLOWONSENDSINKFUNDREPORTFORAPPROVAL';
        OnCancelSinkFundReportApprovalRequestTxt: label 'An Approval of a Sink Fund Report is canceled';
        RunWorkflowOnCancelSinkFundReportForApprovalCode: label 'RUNWORKFLOWONCANCELSINKFUNDREPORTFORAPPROVAL';
        OnsendAGMDelegatePaymentApprovalRequestTxt: label 'Approval of AGM Delegate Payment is requested';
        RunWorkflowOAGMDelegatePaymentForApprovalCode: label 'RunWorkflowOAGMDelegatePaymentForApproval';
        OnCancelAGMDelegatePaymentApprovalRequestTxt: label 'An Approval of a AGM Delegate Payment is canceled';
        RunWorkflowOnCanceAGMDelegatePayentForApprovalCode: label 'RUNWORKFLOWONCANCELAGMDELEGATEPAYMENTFORAPPROVAL';
        //         clo": 'Comment';
        OnSendBankingAccountClosureApprovalRequestTxt: label 'Approval of a Banking Account Closure is requested';
        RunWorkflowOnSendBankingAccountClosureForApprovalCode: label 'RUNWORKFLOWONSENDBanking Account ClosureFORAPPROVAL';
        OnCancelBankingAccountClosureApprovalRequestTxt: label 'An Approval of a Banking Account Closure is canceled';
        RunWorkflowOnCancelBankingAccountClosureForApprovalCode: label 'RUNWORKFLOWONCANCELBanking Account ClosureFORAPPROVAL';
        //         dc": 'Comment';
        OnSendDelegatesRegionChangeApprovalRequestTxt: label 'Approval of Delegates Region Changet is requested';
        RunWorkflowOnSendDelegatesRegionChangeForApprovalCode: label 'RUNWORKFLOWONSENDDelegates Region ChangetFORAPPROVAL';
        OnCancelDelegatesRegionChangeApprovalRequestTxt: label 'An Approval of Delegates Region Change is canceled';
        RunWorkflowOnCancelDelegatesRegionChangeForApprovalCode: label 'RUNWORKFLOWONCANCELDelegatesRegionChangetFORAPPROVAL';
        //         DAA": 'Comment';
        "OnSendDelegateAGMUpdate ApprovalRequestTxt": label 'Approval of Delegate AGM Update is requested';
        RunWorkflowOnSendDelegateAGMUpdateForApprovalCode: label 'RUNWORKFLOWONSENDDelegate AGM UpdateFORAPPROVAL';
        "OnCancelDelegateAGMUpdate ApprovalRequestTxt": label 'An Approval of Delegate AGM Updatee is canceled';
        RunWorkflowOnCancelDelegateAGMUpdateForApprovalCode: label 'RUNWORKFLOWONCANCELDelegate AGM UpdateFORAPPROVAL';
        SkyMbanking: Codeunit "Sky Mbanking";
        Auth: Record 52185476;
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN,WITHDRAWAL;
        "---------ELECTORAL ZONES-----": label '--------------------------------------------------';
        OnSendElectoralZoneAppApprovalRequestTxt: label 'Approval of Electoral Zone  is requested';
        RunWorkflowOnSendElectoralZoneForApprovalCode: label 'RUNWORKFLOWONSENDELECTORALZONEAppFORAPPROVAL';
        OnCancelElectoralZoneAppApprovalRequestTxt: label 'An Approval of Electoral Zone Application is canceled';
        RunWorkflowOnCancelElectoralZoneAppForApprovalCode: label 'RUNWORKFLOWONCANCELELECTORALZONEAPPFORAPPROVALCODE';
        "--------ELECTORAL ZONES-----": label '--------------------------------------------------';
        "---------Delegate Officials-----": label '--------------------------------------------------';
        OnSendDelegateOfficialsAppApprovalRequestTxt: label 'Approval of Delegate Officials  is requested';
        RunWorkflowOnSendDelegateOfficialsForApprovalCode: label 'RUNWORKFLOWONSENDDELEGATEOFFICIALSAppFORAPPROVAL';
        OnCancelDelegateOfficialsAppApprovalRequestTxt: label 'An Approval of DelegateOfficials Application is canceled';
        RunWorkflowOnCancelDelegateOfficialsAppForApprovalCode: label 'RUNWORKFLOWONCANCELDELEGATEOFFICIALSAPPFORAPPROVALCODE';
        "--------Delegate Officials-----": label '--------------------------------------------------';
        "---------HR Leave application-----": label '--------------------------------------------------';
        OnSendHrLeaveAdjustmentssAppApprovalRequestTxt: label 'Approval of Hr Leave Adjustments  is requested';
        RunWorkflowOnSendHrLeaveAdjustmentsForApprovalCode: label 'RUNWORKFLOWONSEND Hr Leave AdjustmentsAppFORAPPROVAL';
        OnCancelHrLeaveAdjustmentssAppApprovalRequestTxt: label 'An Approval of Hr Leave Adjustments Application is canceled';
        RunWorkflowOnCancelHrLeaveAdjustmentsAppForApprovalCode: label 'RUNWORKFLOWONCANCEL Hr Leave Adjustments APPFORAPPROVALCODE';
        "--------HRleave application-----": label '--------------------------------------------------';


    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            //Electoral Zones
            Database::"Electoral Zones":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendElectoralZoneForApprovalCode));
            //Hr leave Adjustments
            Database::"HR Leave Journal Line":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHrLeaveAdjustmentsForApprovalCode));
            //Delegate Officials
            Database::"Delegate Officials":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegateOfficialsForApprovalCode));

            //Sky Virtual Registration
            Database::"Sky Virtual Member":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSkyVirtualMemberForApprovalCode));
            //Sky Virtual Registration


            Database::"SinkFund Report Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSinkFundReportForApprovalCode));

            // Database::"AGM Delegates Payment":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOAGMDelegatePaymentForApprovalCode));

            Database::"Payments Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPaymentForApprovalCode));

            // Database::"Banking Account Closure":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBankingAccountClosureForApprovalCode));
            // Database::"Delegate Region Change":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegatesRegionChangeForApprovalCode));
            // Database::"Delegate AGM Update Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegateAGMUpdateForApprovalCode));


            Database::"Payments Header Board":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBoardPaymentForApprovalCode));

            Database::"Payments Header Delegates":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegatesAppForApprovalCode));

            Database::"InterBank Transfers":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInterbankForApprovalCode));
            Database::"Staff Claims Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffClaimForApprovalCode));
            Database::"Staff Advance Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffAdvanceForApprovalCode));
            Database::"Staff Advance Surrender Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffAdvanceSurrenderForApprovalCode));
            Database::"Imprest Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendImprestForApprovalCode));
            Database::"Imprest Surrender Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendImprestSurrenderForApprovalCode));
            Database::"Overtime Claim Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendOvertimeForApprovalCode));
            Database::"Store Requistion Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStoreRequisitionForApprovalCode));
            Database::"G/L Budget Name":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBudgetForApprovalCode));
            Database::Workplan:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendWorkplanForApprovalCode));
            Database::"Vote Transfer":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVoteForApprovalCode));
            Database::"Asset Transfer":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAssetTransferForApprovalCode));

            //Cashier Transactions
            Database::"Cashier Transactions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCashierTRANSForApprovalCode));
            //Cashier Transactions
            // Database::"Document Exemptions Auth.":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDocExForApprovalCode));
            //Salary Transactions
            Database::"Salary Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSalaryTRANSForApprovalCode));
            //Salary Transactions

            //Bankers Cheques
            Database::"Bankers Cheque Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBankersCForApprovalCode));
            //Bankers Cheques

            //Bank Cheques
            Database::"Cheque Book Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBankCForApprovalCode));
            //Bank Cheques

            //Overdraft
            Database::"Over Draft Authorisation":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendODForApprovalCode));
            //Overdraft

            //Account Transfers
            Database::"Account Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendACTForApprovalCode));
            //Account Transfers

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTREASForApprovalCode));
            //Inter Teller



            //Investment
            Database::"Investment Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendINVForApprovalCode));
            //Investment

            //Cheque Receipts
            Database::"Cheque Receipts":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCHQForApprovalCode));

            //Legal
            Database::Legal:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLegalForApprovalCode));

            //Surety Management
            Database::"Surety Management":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSuretyForApprovalCode));

            //Contract
            Database::Contracts:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendContractForApprovalCode));
            //Cheque Receipts

            //Member Application
            Database::"Member Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMemberAppForApprovalCode)); //
                                                                                                             //Salary Agreement
            Database::"Salary Agreement":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSalaryAgreementForApprovalCode)); //
                                                                                                                   //Account Application
            Database::"Savings Account Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAccountAppForApprovalCode)); //
                                                                                                              //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEFTAppForApprovalCode)); //
                                                                                                          //Standing Order Application
            Database::"Standing Order Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSTOAppForApprovalCode)); //
                                                                                                          //Standing Order Control Application
            Database::"Standing Order Control":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSTOCTLAppForApprovalCode)); //
                                                                                                             //Dividend Rate Application
            Database::"Dividend Simulation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDividendRateAppForApprovalCode)); //
                                                                                                                   //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDRAppForApprovalCode)); //
                                                                                                         //Product Factory Application
            Database::"Product Factory Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPFAAppForApprovalCode)); //
                                                                                                          //Loans
            Database::Loans:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLoanAppForApprovalCode));

            Database::"Document Exemptions Auth.":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDocExForApprovalCode));
            //
            //Collateral
            Database::"Securities Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCollateralForApprovalCode)); //
                                                                                                              //Collateral collection
            Database::"Securities Collection Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCollateReturnForApprovalCode)); //
                                                                                                                 //Loans batch
            Database::"Loan Disbursement Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLoanBatchForApprovalCode)); //
                                                                                                             //Interest Billing
            Database::"Interest Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInterestBillingForApprovalCode)); //
                                                                                                                   //Savings Interest Header
            Database::"Savings Interest Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSavingsInterestHeaderForApprovalCode)); //
                                                                                                                         //End Year Transfer Header
            Database::"End Year Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEndYearTransferHeaderForApprovalCode)); //
                                                                                                                         //ATM Applications
            Database::"ATM Applications":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendATMApplicationsForApprovalCode)); //
                                                                                                                   //ATM Linking Applications
            Database::"ATM Linking Applications":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendATMLinkingApplicationsForApprovalCode)); //
                                                                                                                          //Checkoff
            Database::"Checkoff Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCheckoffAppForApprovalCode)); //
                                                                                                               //Membership closure
            Database::"Membership closure":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMembershipClosureAppForApprovalCode)); //
                                                                                                                        //Loan Reschedule
            Database::"Loan Rescheduling":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLoanRescheduleAppForApprovalCode)); //
                                                                                                                     //Withdrawal Notice
            Database::"Member withdrawal Notice":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendWithdrawalNoticeAppForApprovalCode)); //
                                                                                                                       //Guaraton Substitution
            Database::"Guarantors Substitution":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendGuarantorSubstitutionAppForApprovalCode)); //
                                                                                                                            //Guarantor Recovery
            Database::"Loan Recovery Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecoveryHeaderAppForApprovalCode)); //
                                                                                                                     //Bonds
            Database::Bond:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBondAppForApprovalCode)); //
                                                                                                           //Sink Fund
            Database::"BBF Requisation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSinkFundAppForApprovalCode)); //
                                                                                                               //Delegate Region Change
            Database::"Delegate Region Change":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegatesRegionChangeForApprovalCode)); //
                                                                                                                         //Delegate AGM Updates
            Database::"Delegate AGM Update Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegateAGMUpdateForApprovalCode)); //
                                                                                                                     //FOSA Account Closure
            Database::"Banking Account Closure":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBankingAccountClosureForApprovalCode)); //
                                                                                                                         //AGM Delegate Payment
            Database::"AGM Delegates Payment":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOAGMDelegatePaymentForApprovalCode));
            //BDE Management
            Database::"BDE Management Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBDEManagementAppForApprovalCode)); //
                                                                                                                    //Delegate Groups Applicationss
            Database::"Delegate Region Applicationss":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegateGroupsApplicationssForApprovalCode)); //
                                                                                                                               //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegateGroupMemRetirementsForApprovalCode)); //
                                                                                                                               //Delegates Payment
            Database::"Delegates Payment":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDelegatesPaymentForApprovalCode)); //
                                                                                                                    //HR
                                                                                                                    //Employee Requisitions
            Database::"HR Employee Requisitions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmployeeRequisitionAppForApprovalCode)); //

            //HR Leave Application
            // Database::"HR Leave Application":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveForApprovalCode)); //

            // //HR Training Feedback
            // Database::"HR Training Feedback Form":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTFeedForApprovalCode)); //

            // //iNTERNS
            // Database::"HR Interns":
                // exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInternForApprovalCode)); //



            //HR Appraisal Appeal
            Database::"HR Appraissal Appeal":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAppraisalAppealForApprovalCode)); //

            //HR Disciplinary Appeal
            Database::"HRDisciplinary Appeal":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDisciplinaryAppealForApprovalCode)); //

            //HR Disciplinary Withdrawal
            Database::"HRDisciplinary Case Withdrawal":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDisciplinaryWithdrawalForApprovalCode)); //


            //HR Training App Header
            Database::"HR Training App Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingForApprovalCode)); //
                                                                                                            //HR Training Needs
            Database::"HR Training Needs":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTNeedForApprovalCode)); //
                                                                                                         //HR Transport Requisition Head
            Database::"HR Transport Requisition Head":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTransportForApprovalCode)); //
                                                                                                             //HR Employee Transfer Header
            Database::"HR Employee Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpTransferAppForApprovalCode)); //
                                                                                                                  //HR Jobs
            Database::"HR Jobs":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendJobAppForApprovalCode)); //
                                                                                                          //HR Leave Planner Header
            Database::"HR Leave Planner Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPlannerAppForApprovalCode)); //
                                                                                                              //HR Employees
            Database::"HR Employees":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmployeeAppForApprovalCode)); //
                                                                                                               //HR Interns Requisition
            Database::"HR Interns Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInternReqAppForApprovalCode)); //
                                                                                                                //HR Leave Application
            Database::"HR Leave Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveForApprovalCode)); //HR Training Needs
                                                                                                         //end HR

            //HR Training Feedback
            Database::"HR Training Feedback Form":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTFeedForApprovalCode));
            //end HR

            //HR Interns
            Database::"HR Interns":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInternForApprovalCode)); //interns
                                                                                                          //end HR

            //HR Disciplinary cases
            Database::"HR Disciplinary Cases NCA":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDisciplinaryForApprovalCode)); //

            //Staff loans
            Database::"prSalary Advance":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffLoansForApprovalCode)); //RunWorkflowOnSendStaffLoansForApprovalCode
                                                                                                              //Permission Requisition
            Database::"Permission Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPermissionRequisitionForApprovalCode)); //RunWorkflowOnSendStaffLoansForApprovalCode

            // MSACCO
            Database::"M-SACCO Change PIN No":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMSACCOPINApprovalCode));

            Database::"M-SACCO Applications":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMsaccoApplicationApprovalCode));
            // MSACCO

            // Agency
            Database::"Agent Applications":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAgentApplicationForApprovalCode));

            // M-SACCO TRANSACTION CHANGE

            Database::"M-PESA Change Transactions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMSACCOChangeApprovalCode));

            // M-SACCO TRANSACTION CHANGE

            //Property Lease
            Database::Lease:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaseForApprovalCode));
            //Property Lease
            //Property
            Database::"Property Details":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPropForApprovalCode));
            //Property
            Database::"Mortgage Loans Doc Release":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMortgageDocReleaseForApprovalCode));
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;


    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        begin
            if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
                Error(NoWorkflowEnabledErr);
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]

    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin
        //Sky Virtual Member
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSkyVirtualMemberForApprovalCode, Database::"Sky Virtual Member", OnSendSkyVirtualMemberApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSkyVirtualMemberForApprovalCode, Database::"Sky Virtual Member", OnCancelSkyVirtualMemberApprovalRequestTxt, 0, false);
        //Sky Virtual Member
        //Hr Leave Managent
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendHrLeaveAdjustmentsForApprovalCode, Database::"HR Leave Journal Line", OnSendHrLeaveAdjustmentssAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelHrLeaveAdjustmentsAppForApprovalCode, Database::"HR Leave Journal Line", OnCancelHrLeaveAdjustmentssAppApprovalRequestTxt, 0, false);
        //Hr Leave Managent
        //Electoral Zones
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendElectoralZoneForApprovalCode, Database::"Electoral Zones", OnSendElectoralZoneAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelElectoralZoneAppForApprovalCode, Database::"Electoral Zones", OnCancelElectoralZoneAppApprovalRequestTxt, 0, false);
        //Electoral Zones

        //Delegate Officials
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendDelegateOfficialsForApprovalCode, Database::"Delegate Officials", OnSendDelegateOfficialsAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDelegateOfficialsAppForApprovalCode, Database::"Delegate Officials", OnCancelDelegateOfficialsAppApprovalRequestTxt, 0, false);
        //Delegate Officials


        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendBankingAccountClosureForApprovalCode, Database::"Banking Account Closure", OnSendBankingAccountClosureApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBankingAccountClosureForApprovalCode, Database::"Banking Account Closure", OnCancelBankingAccountClosureApprovalRequestTxt, 0, false);


        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendDelegateAGMUpdateForApprovalCode, Database::"Delegate AGM Update Header", "OnSendDelegateAGMUpdate ApprovalRequestTxt", 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDelegateAGMUpdateForApprovalCode, Database::"Delegate AGM Update Header", "OnCancelDelegateAGMUpdate ApprovalRequestTxt", 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendDelegatesRegionChangeForApprovalCode, Database::"Delegate Region Change", OnSendDelegatesRegionChangeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelDelegatesRegionChangeForApprovalCode, Database::"Delegate Region Change", OnCancelDelegatesRegionChangeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnSendSinkFundReportForApprovalCode, Database::"SinkFund Report Information", OnSendSinkFundReportApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelSinkFundReportForApprovalCode, Database::"SinkFund Report Information", OnCancelSinkFundReportApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOAGMDelegatePaymentForApprovalCode, Database::"AGM Delegates Payment", OnsendAGMDelegatePaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCanceAGMDelegatePayentForApprovalCode, Database::"AGM Delegates Payment", OnCancelAGMDelegatePaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPaymentForApprovalCode, Database::"Payments Header", OnSendPaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPaymentForApprovalCode, Database::"Payments Header", OnCancelPaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBoardPaymentForApprovalCode, Database::"Payments Header Board", OnSendBoardPaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBoardPaymentForApprovalCode, Database::"Payments Header Board", OnCancelBoardPaymentApprovalRequestTxt, 0, false);
        //Delegates
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegatesAppForApprovalCode, Database::"Payments Header Delegates", OnSendDelegateAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegatesAppForApprovalCode, Database::"Payments Header Delegates", OnCancelDelegatesAppApprovalRequestTxt, 0, false);

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInterbankForApprovalCode, Database::"InterBank Transfers", OnSendInterbankApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInterbankForApprovalCode, Database::"InterBank Transfers", OnCancelInterbankApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStaffClaimForApprovalCode, Database::"Staff Claims Header", OnSendStaffClaimApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStaffClaimForApprovalCode, Database::"Staff Claims Header", OnCancelStaffClaimApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStaffAdvanceForApprovalCode, Database::"Staff Advance Header", OnSendStaffAdvanceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStaffAdvanceForApprovalCode, Database::"Staff Advance Header", OnCancelStaffAdvanceApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStaffAdvanceSurrenderForApprovalCode, Database::"Staff Advance Surrender Header", OnSendStaffAdvanceSurrenderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStaffAdvanceSurrenderForApprovalCode, Database::"Staff Advance Surrender Header", OnCancelStaffAdvanceSurrenderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendImprestForApprovalCode, Database::"Imprest Header", OnSendImprestApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelImprestForApprovalCode, Database::"Imprest Header", OnCancelImprestApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendImprestSurrenderForApprovalCode, Database::"Imprest Surrender Header", OnSendImprestSurrenderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelImprestSurrenderForApprovalCode, Database::"Imprest Surrender Header", OnCancelImprestSurrenderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStoreRequisitionForApprovalCode, Database::"Store Requistion Header", OnSendStoreRequisitionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStoreRequisitionForApprovalCode, Database::"Store Requistion Header", OnCancelStoreRequisitionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendOvertimeForApprovalCode, Database::"Overtime Claim Header", OnSendOvertimeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelOvertimeForApprovalCode, Database::"Overtime Claim Header", OnCancelOvertimeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBudgetForApprovalCode, Database::"G/L Budget Name", OnSendBudgetApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBudgetForApprovalCode, Database::"G/L Budget Name", OnCancelBudgetApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendWorkplanForApprovalCode, Database::Workplan, OnSendWorkplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelWorkplanForApprovalCode, Database::Workplan, OnCancelWorkplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendVoteForApprovalCode, Database::"Vote Transfer", OnSendVoteApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVoteForApprovalCode, Database::"Vote Transfer", OnCancelVoteApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAssetTransferForApprovalCode, Database::"Asset Transfer", OnSendAssetTransferApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAssetTransferForApprovalCode, Database::"Asset Transfer", OnCancelAssetTransferApprovalRequestTxt, 0, false);

        //Cashier Transactions
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCashierTRANSForApprovalCode, Database::"Cashier Transactions", OnSendCashierTRANSApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCashierTRANSForApprovalCode, Database::"Cashier Transactions", OnCancelCashierTRANSApprovalRequestTxt, 0, false);
        //Cashier Transactions

        //Property Lease
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaseForApprovalCode, Database::Lease, OnSendLeaseApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeaseForApprovalCode, Database::Lease, OnCancelLeaseApprovalRequestTxt, 0, false);
        //Property Lease
        //Property
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPropForApprovalCode, Database::"Property Details", OnSendPropApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPropForApprovalCode, Database::"Property Details", OnCancelPropApprovalRequestTxt, 0, false);
        //Property
        //Salary Transactions
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSalaryTRANSForApprovalCode, Database::"Salary Header", OnSendSalaryTRANSApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSalaryTRANSForApprovalCode, Database::"Salary Header", OnCancelSalaryTRANSApprovalRequestTxt, 0, false);
        //Salary Transactions

        //bankers Cheque
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBankersCForApprovalCode, Database::"Bankers Cheque Application", OnSendBankersCApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBankersCForApprovalCode, Database::"Bankers Cheque Application", OnCancelBankersCApprovalRequestTxt, 0, false);
        //bankers Cheque


        //bank Cheque
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBankCForApprovalCode, Database::"Cheque Book Application", OnSendBankCApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBankCForApprovalCode, Database::"Cheque Book Application", OnCancelBankCApprovalRequestTxt, 0, false);
        //bank Cheque

        //Overdraft
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendODForApprovalCode, Database::"Over Draft Authorisation", OnSendODApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelODForApprovalCode, Database::"Over Draft Authorisation", OnCancelODApprovalRequestTxt, 0, false);
        //Overdraft

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDocExForApprovalCode, Database::"Document Exemptions Auth.", OnSendDocExApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDocExForApprovalCode, Database::"Document Exemptions Auth.", OnCancelDocExApprovalRequestTxt, 0, false);



        //Account Transfers
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendACTForApprovalCode, Database::"Account Transfer Header", OnSendACTApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelACTForApprovalCode, Database::"Account Transfer Header", OnCancelACTApprovalRequestTxt, 0, false);
        //Account Transfers

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDocExForApprovalCode, Database::"Document Exemptions Auth.", OnSendDocExApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDocExForApprovalCode, Database::"Document Exemptions Auth.", OnCancelDocExApprovalRequestTxt, 0, false);

        //Inter Teller
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTREASForApprovalCode, Database::"Treasury Cashier Transactions", OnSendTREASApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTREASForApprovalCode, Database::"Treasury Cashier Transactions", OnCancelTREASApprovalRequestTxt, 0, false);
        //Inter Teller


        //Investments
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendINVForApprovalCode, Database::"Investment Header", OnSendINVApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelINVForApprovalCode, Database::"Investment Header", OnCancelINVApprovalRequestTxt, 0, false);
        //Investments

        //Cheque Receipts
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCHQForApprovalCode, Database::"Cheque Receipts", OnSendCHQApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCHQForApprovalCode, Database::"Cheque Receipts", OnCancelCHQApprovalRequestTxt, 0, false);
        //Cheque Receipts

        //Member Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMemberAppForApprovalCode, Database::"Member Application", OnSendMemberAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMemberAppForApprovalCode, Database::"Member Application", OnCancelMemberAppApprovalRequestTxt, 0, false); //

        //Salary Agreement
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSalaryAgreementForApprovalCode, Database::"Salary Agreement", OnSendSalaryAgreementAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSalaryAgreementForApprovalCode, Database::"Salary Agreement", OnCancelSalaryAgreementApprovalRequestTxt, 0, false);//

        //Account Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAccountAppForApprovalCode, Database::"Savings Account Application", OnSendAccountAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAccountAppForApprovalCode, Database::"Savings Account Application", OnCancelAccountAppApprovalRequestTxt, 0, false); //
        //Electronic Fund Transfer Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEFTAppForApprovalCode, Database::"EFT Transfer Header", OnSendEFTAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEFTAppForApprovalCode, Database::"EFT Transfer Header", OnCancelEFTAppApprovalRequestTxt, 0, false); //
        //Standing Order Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSTOAppForApprovalCode, Database::"Standing Order Header", OnSendSTOAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSTOAppForApprovalCode, Database::"Standing Order Header", OnCancelSTOAppApprovalRequestTxt, 0, false); //
        //Standing Order Stoppage Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSTOCTLAppForApprovalCode, Database::"Standing Order Control", OnSendSTOCTLAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSTOCTLAppForApprovalCode, Database::"Standing Order Control", OnCancelSTOCTLAppApprovalRequestTxt, 0, false); //
        //Dividend Rate Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDividendRateAppForApprovalCode, Database::"Dividend Simulation Header", OnSendDividendRateAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDividendRateAppForApprovalCode, Database::"Dividend Simulation Header", OnCancelDividendRateAppApprovalRequestTxt, 0, false);
        //Account/Member deactivation or reactivation
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDRAppForApprovalCode, Database::"Reactivate/Deactivate Header", OnSendDRAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDRAppForApprovalCode, Database::"Reactivate/Deactivate Header", OnCancelDRAppApprovalRequestTxt, 0, false);
        //Product Factory Application
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPFAAppForApprovalCode, Database::"Product Factory Application", OnSendPFAAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPFAAppForApprovalCode, Database::"Product Factory Application", OnCancelPFAAppApprovalRequestTxt, 0, false);
        //Loans
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLoanAppForApprovalCode, Database::Loans, OnSendLoanAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLoanAppForApprovalCode, Database::Loans, OnCancelLoanAppApprovalRequestTxt, 0, false); //
        //Collateral
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCollateralForApprovalCode, Database::"Securities Register", OnSendCollateralApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCollateralForApprovalCode, Database::"Securities Register", OnCancelCollateralApprovalRequestTxt, 0, false); //

        //Collaterals collection
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCollateReturnForApprovalCode, Database::"Securities Collection Register", OnSendCollatReturnApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCollatReturnForApprovalCode, Database::"Securities Collection Register", OnCancelCollatReturnApprovalRequestTxt, 0, false); //
        //Loan Batches
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLoanBatchForApprovalCode, Database::"Loan Disbursement Header", OnSendLoanBatchApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLoanBatchForApprovalCode, Database::"Loan Disbursement Header", OnCancelLoanBatchApprovalRequestTxt, 0, false); //

        ////INTEREST BILLING
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInterestBillingForApprovalCode, Database::"Interest Header", OnSendInterestBillingApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInterestBillingForApprovalCode, Database::"Interest Header", OnCancelInterestBillingApprovalRequestTxt, 0, false); //

        ////Savings Interest Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSavingsInterestHeaderForApprovalCode, Database::"Savings Interest Header", OnSendSavingsInterestHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSavingsInterestHeaderForApprovalCode, Database::"Savings Interest Header", OnCancelSavingsInterestHeaderApprovalRequestTxt, 0, false); //
        //End Year Transfer Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEndYearTransferHeaderForApprovalCode, Database::"End Year Transfer Header", OnSendEndYearTransferHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEndYearTransferHeaderForApprovalCode, Database::"End Year Transfer Header", OnCancelEndYearTransferHeaderApprovalRequestTxt, 0, false); //

        //ATM Applications
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendATMApplicationsForApprovalCode, Database::"ATM Applications", OnSendATMApplicationsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelATMApplicationsForApprovalCode, Database::"ATM Applications", OnCancelATMApplicationsApprovalRequestTxt, 0, false); //
        //ATM Linking Applications
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendATMLinkingApplicationsForApprovalCode, Database::"ATM Linking Applications", OnSendATMLinkingApplicationsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelATMLinkingApplicationsForApprovalCode, Database::"ATM Linking Applications", OnCancelATMLinkingApplicationsApprovalRequestTxt, 0, false); //
        //Checkoff
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCheckoffAppForApprovalCode, Database::"Checkoff Header", OnSendCheckoffAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCheckoffAppForApprovalCode, Database::"Checkoff Header", OnCancelCheckoffAppApprovalRequestTxt, 0, false); //

        //Guarantor Substitution
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendGuarantorSubstitutionAppForApprovalCode, Database::"Guarantors Substitution", OnSendGuarantorSubstitutionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelGuarantorSubstitutionAppForApprovalCode, Database::"Guarantors Substitution", OnCancelGuarantorSubstitutionAppApprovalRequestTxt, 0, false); //


        //Membership Closure
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMembershipClosureAppForApprovalCode, Database::"Membership closure", OnSendMembershipClosureAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMembershipClosureAppForApprovalCode, Database::"Membership closure", OnCancelMembershipClosureAppApprovalRequestTxt, 0, false); //

        //Loan Rescheduling
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLoanRescheduleAppForApprovalCode, Database::"Loan Rescheduling", OnSendLoanRescheduleAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLoanRescheduleAppForApprovalCode, Database::"Loan Rescheduling", OnCancelLoanRescheduleAppApprovalRequestTxt, 0, false); //

        //Withrawal Notice
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendWithdrawalNoticeAppForApprovalCode, Database::"Member withdrawal Notice", OnSendWithdrawalNoticeAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelWithdrawalNoticeAppForApprovalCode, Database::"Member withdrawal Notice", OnCancelWithdrawalNoticeAppApprovalRequestTxt, 0, false); //

        //Loan Recovery
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecoveryHeaderAppForApprovalCode, Database::"Loan Recovery Header", OnSendRecoveryHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecoveryHeaderAppForApprovalCode, Database::"Loan Recovery Header", OnCancelRecoveryHeaderAppApprovalRequestTxt, 0, false); //

        //Bond
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBondAppForApprovalCode, Database::Bond, OnSendBondApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBondAppForApprovalCode, Database::Bond, OnCancelBondAppApprovalRequestTxt, 0, false); //

        //Sink Funds
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSinkFundAppForApprovalCode, Database::"BBF Requisation Header", OnSendSinkFundApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSinkFundAppForApprovalCode, Database::"BBF Requisation Header", OnCancelSinkFundAppApprovalRequestTxt, 0, false); //

        //Delegate Region Change
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegatesRegionChangeForApprovalCode, Database::"Delegate Region Change", OnSendDelegatesRegionChangeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegatesRegionChangeForApprovalCode, Database::"Delegate Region Change", OnCancelDelegatesRegionChangeApprovalRequestTxt, 0, false); //

        //Delegate AGM Update
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegateAGMUpdateForApprovalCode, Database::"Delegate AGM Update Header", "OnSendDelegateAGMUpdate ApprovalRequestTxt", 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegateAGMUpdateForApprovalCode, Database::"Delegate AGM Update Header", "OnCancelDelegateAGMUpdate ApprovalRequestTxt", 0, false); //




        //Fosa AccountClosure
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBankingAccountClosureForApprovalCode, Database::"Banking Account Closure", OnSendBankingAccountClosureApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBankingAccountClosureForApprovalCode, Database::"Banking Account Closure", OnCancelBankingAccountClosureApprovalRequestTxt, 0, false); //



        //AGM Delegates Payemnts
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOAGMDelegatePaymentForApprovalCode, Database::"AGM Delegates Payment", OnsendAGMDelegatePaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCanceAGMDelegatePayentForApprovalCode, Database::"AGM Delegates Payment", OnCancelAGMDelegatePaymentApprovalRequestTxt, 0, false); //


        //BDE Management
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBDEManagementAppForApprovalCode, Database::"BDE Management Header", OnSendBDEManagementApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBDEManagementAppForApprovalCode, Database::"BDE Management Header", OnCancelBDEManagementAppApprovalRequestTxt, 0, false); //
        //
        //Delegate Groups Applicationss
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegateGroupsApplicationssForApprovalCode, Database::"Delegate Region Applicationss", OnSendDelegateGroupsApplicationssApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegateGroupsApplicationssForApprovalCode, Database::"Delegate Region Applicationss", OnCancelDelegateGroupsApplicationssApprovalRequestTxt, 0, false); //
        //Delegate Group Mem Retirements
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegateGroupMemRetirementsForApprovalCode, Database::"Delegate Region Mem Retirement", OnSendDelegateGroupMemRetirementsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegateGroupMemRetirementsForApprovalCode, Database::"Delegate Region Mem Retirement", OnCancelDelegateGroupMemRetirementsApprovalRequestTxt, 0, false); //
        //Delegates Payment
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDelegatesPaymentForApprovalCode, Database::"Delegates Payment", OnSendDelegatesPaymentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDelegatesPaymentForApprovalCode, Database::"Delegates Payment", OnCancelDelegatesPaymentApprovalRequestTxt, 0, false); //
        //HR
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmployeeRequisitionAppForApprovalCode, Database::"HR Employee Requisitions", OnSendlEmployeeRequisitionAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmployeeRequisitionAppForApprovalCode, Database::"HR Employee Requisitions", OnCancelEmployeeRequisitionAppApprovalRequestTxt, 0, false); //
        //leave
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaveForApprovalCode, Database::"HR Leave Application", OnSendleaveAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelleaveAppForApprovalCode, Database::"HR Leave Application", OnCancelleaveAppApprovalRequestTxt, 0, false); //


        //Training Feedback
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTFeedForApprovalCode, Database::"HR Training Feedback Form", OnSendTFeedAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTFeedAppForApprovalCode, Database::"HR Training Feedback Form", OnCancelTFeedAppApprovalRequestTxt, 0, false); //


        //Interns
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInternForApprovalCode, Database::"HR Interns", OnSendInternAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInternAppForApprovalCode, Database::"HR Interns", OnCancelInternAppApprovalRequestTxt, 0, false); //

        //Appraisal Appeal
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAppraisalAppealForApprovalCode, Database::"HR Appraissal Appeal", OnSendAppraisalAppealAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAppraisalAppealAppForApprovalCode, Database::"HR Appraissal Appeal", OnCancelAppraisalAppealAppApprovalRequestTxt, 0, false); //


        //Disciplinary Appeal
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDisciplinaryAppealForApprovalCode, Database::"HRDisciplinary Appeal", OnSendDisciplinaryAppealAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDisciplinaryAppealAppForApprovalCode, Database::"HRDisciplinary Appeal", OnCancelDisciplinaryAppealAppApprovalRequestTxt, 0, false); //

        //Disciplinary Withdrawal
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDisciplinaryWithdrawalForApprovalCode, Database::"HRDisciplinary Case Withdrawal", OnSendDisciplinaryWithdrawalAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDisciplinaryWithdrawalAppForApprovalCode, Database::"HRDisciplinary Case Withdrawal", OnCancelDisciplinaryWithdrawalAppApprovalRequestTxt, 0, false); //

        //Disciplinary
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDisciplinaryForApprovalCode, Database::"HR Disciplinary Cases NCA", OnSendDisciplinaryAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDisciplinaryAppForApprovalCode, Database::"HR Disciplinary Cases NCA", OnCancelDisciplinaryAppApprovalRequestTxt, 0, false); //

        //staff loans
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStaffLoansForApprovalCode, Database::"prSalary Advance", OnSendStaffLoanAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStaffLoanAppForApprovalCode, Database::"prSalary Advance", OnCancelStaffLoanAppApprovalRequestTxt, 0, false); //

        //Training Need
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTNeedForApprovalCode, Database::"HR Training Needs", OnSendTNeedAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTNeedAppForApprovalCode, Database::"HR Training Needs", OnCancelTNeedAppApprovalRequestTxt, 0, false); //

        //training
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTrainingForApprovalCode, Database::"HR Training App Header", OnSendTrainingAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTrainingAppForApprovalCode, Database::"HR Training App Header", OnCancelTrainingAppApprovalRequestTxt, 0, false); //
        //Transport
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTransportForApprovalCode, Database::"HR Transport Requisition Head", OnSendTransportAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTransportAppForApprovalCode, Database::"HR Transport Requisition Head", OnCancelTransportAppApprovalRequestTxt, 0, false); //
        //EmpTransfer
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmpTransferAppForApprovalCode, Database::"HR Employee Transfer Header", OnSendEmpTransferAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmpTransferAppForApprovalCode, Database::"HR Employee Transfer Header", OnCancelEmpTransferAppApprovalRequestTxt, 0, false); //

        //Jobs
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendJobAppForApprovalCode, Database::"HR Jobs", OnSendJobAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelJobAppForApprovalCode, Database::"HR Jobs", OnCancelJobAppApprovalRequestTxt, 0, false); //

        //Planner
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPlannerAppForApprovalCode, Database::"HR Leave Planner Header", OnSendPlannerAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPlannerAppForApprovalCode, Database::"HR Leave Planner Header", OnCancelPlannerAppApprovalRequestTxt, 0, false); //

        //HR Employees  DATABASE::"HR Employees":
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmployeeAppForApprovalCode, Database::"HR Employees", OnSendEmployeeAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmployeeAppForApprovalCode, Database::"HR Employees", OnCancelEmployeeAppApprovalRequestTxt, 0, false); //

        //HR Interns Requisition  DATABASE::"HR Interns Requisition":
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendInternReqAppForApprovalCode, Database::"HR Interns Requisition", OnSendInternReqAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInternReqAppForApprovalCode, Database::"HR Interns Requisition", OnCancelInternReqAppApprovalRequestTxt, 0, false); //

        //HR End
        // MSACCO

        // MSACCO PIN Change DATABASE::"M-SACCO Change PIN No":

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMSACCOPINApprovalCode, Database::"M-SACCO Change PIN No", OnSendMSACCOPINApprovalRequest, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMSACCOPINRequestApprovalCode, Database::"M-SACCO Change PIN No", OnCancelMSACCOPINApprovalRequest, 0, false); //

        // MSACCO Applications DATABASE::"M-SACCO Applications":

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMsaccoApplicationApprovalCode, Database::"M-SACCO Applications", OnSendMsaccoApplicationApprovalRequest, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMsaccoAPPLICATIONRequestApprovalCode, Database::"M-SACCO Applications", OnCancelMsaccoAPPLICATIONApprovalRequest, 0, false); //

        // Agency Agent Applications
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAgentApplicationForApprovalCode, Database::"Agent Applications", OnSendAgentApplicationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAgentApplicationForApprovalCode, Database::"Agent Applications", OnCancelAgentApplicationApprovalRequestTxt, 0, false); //

        // legal
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLegalForApprovalCode, Database::Legal, OnSendLegalApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLegalForApprovalCode, Database::Legal, OnCancelLegalApprovalRequestTxt, 0, false); //

        // Surety Management
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSuretyForApprovalCode, Database::"Surety Management", OnSendSuretyApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSuretyForApprovalCode, Database::"Surety Management", OnCancelSuretyApprovalRequestTxt, 0, false); //

        // Contract
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendContractForApprovalCode, Database::Contracts, OnSendContractAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelContractAppForApprovalCode, Database::Contracts, OnCancelContractAppApprovalRequestTxt, 0, false); //

        // Permission Requisition
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPermissionRequisitionForApprovalCode, Database::"Permission Requisition", OnSendPermissionRequisitionAppApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPermissionRequisitionForApprovalCode, Database::"Permission Requisition", OnCancelPermissionRequisitionApprovalRequestTxt, 0, false); //

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMSACCOChangeApprovalCode, Database::"M-PESA Change Transactions", OnSendMSACCOChangeApprovalRequest, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMSACCOChangeRequestApprovalCode, Database::"M-PESA Change Transactions", OnCancelMSACCOChangeApprovalRequest, 0, false);
        //M-SACCO

        // Mortgage Doc Release
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendMortgageDocReleaseForApprovalCode, Database::"Mortgage Loans Doc Release", OnSendMortgageDocReleaseApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelMortgageDocReleaseForApprovalCode, Database::"Mortgage Loans Doc Release", OnCancelMortgageDocReleaseApprovalRequestTxt, 0, false);
    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]

    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Electoral Zones":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendElectoralZoneForApprovalCode, Variant);
            Database::"Delegate Officials":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegateOfficialsForApprovalCode, Variant);
            Database::"Sky Virtual Member":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSkyVirtualMemberForApprovalCode, Variant);
            Database::"HR Leave Journal Line":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHrLeaveAdjustmentsForApprovalCode, Variant);
            // Database::"Banking Account Closure":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendBankingAccountClosureForApprovalCode, Variant);
            // Database::"Delegate AGM Update Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegateAGMUpdateForApprovalCode, Variant);
            // Database::"Delegate Region Change":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegatesRegionChangeForApprovalCode, Variant);
            // Database::"SinkFund Report Information":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendSinkFundReportForApprovalCode, Variant);
            // Database::"AGM Delegates Payment":
            //     WorkflowManagement.HandleEvent(RunWorkflowOAGMDelegatePaymentForApprovalCode, Variant);
            Database::"Payments Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPaymentForApprovalCode, Variant);
            Database::"Payments Header Board":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBoardPaymentForApprovalCode, Variant);
            //Delegates
            Database::"Payments Header Delegates":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegatesAppForApprovalCode, Variant);
            Database::"InterBank Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInterbankForApprovalCode, Variant);
            Database::"Staff Claims Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffClaimForApprovalCode, Variant);
            Database::"Staff Advance Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffAdvanceForApprovalCode, Variant);
            Database::"Staff Advance Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffAdvanceSurrenderForApprovalCode, Variant);
            Database::"Imprest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendImprestForApprovalCode, Variant);
            Database::"Imprest Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendImprestSurrenderForApprovalCode, Variant);
            Database::"Store Requistion Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStoreRequisitionForApprovalCode, Variant);
            Database::"Overtime Claim Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendOvertimeForApprovalCode, Variant);
            Database::"G/L Budget Name":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBudgetForApprovalCode, Variant);
            Database::Workplan:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendWorkplanForApprovalCode, Variant);
            Database::"Vote Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVoteForApprovalCode, Variant);
            Database::"Asset Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAssetTransferForApprovalCode, Variant);

            //Cashier Transactions
            Database::"Cashier Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCashierTRANSForApprovalCode, Variant);
            //end Cashier Transactions
            //Property Lease
            Database::Lease:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaseForApprovalCode, Variant);
            //end Property Lease
            //Property
            Database::"Property Details":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPropForApprovalCode, Variant);
            //end Property
            // Database::"Document Exemptions Auth.":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendDocExForApprovalCode, Variant);

            //Salary Transactions
            Database::"Salary Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSalaryTRANSForApprovalCode, Variant);
            //Salary Transactions

            //bankers Cheque
            Database::"Bankers Cheque Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBankersCForApprovalCode, Variant);
            //bankers Cheque

            //bank Cheque
            Database::"Cheque Book Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBankCForApprovalCode, Variant);
            //bank Cheque

            //Overdraft
            Database::"Over Draft Authorisation":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendODForApprovalCode, Variant);
            //Overdraft

            //Account Transfers
            Database::"Account Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendACTForApprovalCode, Variant);
            //Account Transfers

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTREASForApprovalCode, Variant);
            //Inter Teller

            //Investments
            Database::"Investment Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendINVForApprovalCode, Variant);
            //Investments

            //Cheque receipts
            Database::"Cheque Receipts":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCHQForApprovalCode, Variant);
            //Cheque receipts

            //Member Application
            Database::"Member Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMemberAppForApprovalCode, Variant); //

            //Salary Agreement
            Database::"Salary Agreement":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSalaryAgreementForApprovalCode, Variant); //
            //Account Application
            Database::"Savings Account Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAccountAppForApprovalCode, Variant); //
            //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEFTAppForApprovalCode, Variant); //
            //Standing Order Application
            Database::"Standing Order Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSTOAppForApprovalCode, Variant); //
            //Standing Order Control Application
            Database::"Standing Order Control":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSTOCTLAppForApprovalCode, Variant); //
            //Dividend Rate Application
            Database::"Dividend Simulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDividendRateAppForApprovalCode, Variant); //
            //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDRAppForApprovalCode, Variant); //
            //Product Factory Application
            Database::"Product Factory Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPFAAppForApprovalCode, Variant); //
            //Loans
            Database::Loans:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLoanAppForApprovalCode, Variant); //
            //Collateral
            Database::"Securities Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCollateralForApprovalCode, Variant); //
                                                                                                     //Collateral collection

            Database::"Securities Collection Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCollateReturnForApprovalCode, Variant); //

            //Loan batch
            Database::"Loan Disbursement Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLoanBatchForApprovalCode, Variant); //

            //INTEREST BILLING
            Database::"Interest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInterestBillingForApprovalCode, Variant); //
                                                                                                          //Savings Interest Header
            Database::"Savings Interest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSavingsInterestHeaderForApprovalCode, Variant); //
                                                                                                                //End Year Transfer Header
            Database::"End Year Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEndYearTransferHeaderForApprovalCode, Variant); //

            //ATM Applications
            Database::"ATM Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendATMApplicationsForApprovalCode, Variant); //
                                                                                                          //ATM Linking Applications
            Database::"ATM Linking Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendATMLinkingApplicationsForApprovalCode, Variant); //
                                                                                                                 //Checkoff
            Database::"Checkoff Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCheckoffAppForApprovalCode, Variant); //
                                                                                                      //Membership Closure
            Database::"Membership closure":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMembershipClosureAppForApprovalCode, Variant); //
                                                                                                               //Loan Rescheduling
            Database::"Loan Rescheduling":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLoanRescheduleAppForApprovalCode, Variant);

            // Database::"Document Exemptions Auth.":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendDocExForApprovalCode, Variant);

            //Withdrawal Notice
            Database::"Member withdrawal Notice":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendWithdrawalNoticeAppForApprovalCode, Variant); //

            //Guarantor Substitution
            Database::"Guarantors Substitution":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendGuarantorSubstitutionAppForApprovalCode, Variant); //

            //Loan Recovery
            Database::"Loan Recovery Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecoveryHeaderAppForApprovalCode, Variant); //
                                                                                                            //Bond
            Database::Bond:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBondAppForApprovalCode, Variant); //

            //Sink Fund
            Database::"BBF Requisation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSinkFundAppForApprovalCode, Variant); //


            //Delegate Region Change
            Database::"Delegate Region Change":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegatesRegionChangeForApprovalCode, Variant); //

            //Delegate AGM Update
            Database::"Delegate AGM Update Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegateAGMUpdateForApprovalCode, Variant); //

            //Fosa Account Closure
            Database::"Banking Account Closure":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBankingAccountClosureForApprovalCode, Variant); //

            //AGM Delegate Payment
            Database::"AGM Delegates Payment":
                WorkflowManagement.HandleEvent(RunWorkflowOAGMDelegatePaymentForApprovalCode, Variant); //


            //BDE Management
            Database::"BDE Management Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBDEManagementAppForApprovalCode, Variant); //

            //Delegate Groups Applicationss
            Database::"Delegate Region Applicationss":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegateGroupsApplicationssForApprovalCode, Variant); //
                                                                                                                      //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegateGroupMemRetirementsForApprovalCode, Variant); //
                                                                                                                      //Delegates Payment
            Database::"Delegates Payment":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDelegatesPaymentForApprovalCode, Variant); //

            //HR
            //EmployeeRequisition
            Database::"HR Employee Requisitions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeRequisitionAppForApprovalCode, Variant); //

            //leave
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveForApprovalCode, Variant); //

            //Training Feedback
            Database::"HR Training Feedback Form":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTFeedForApprovalCode, Variant); //

            //Interns
            Database::"HR Interns":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInternForApprovalCode, Variant); //


            //Appraisal appeal
            Database::"HR Appraissal Appeal":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAppraisalAppealForApprovalCode, Variant); //

            //Disciplinary appeal
            Database::"HRDisciplinary Appeal":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDisciplinaryAppealForApprovalCode, Variant); //

            //Disciplinary withdrawal
            Database::"HRDisciplinary Case Withdrawal":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDisciplinaryWithdrawalForApprovalCode, Variant); //

            //Disciplinary
            Database::"HR Disciplinary Cases NCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDisciplinaryForApprovalCode, Variant); //

            //Staff Loan
            Database::"prSalary Advance":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffLoansForApprovalCode, Variant); //

            //training
            Database::"HR Training App Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingForApprovalCode, Variant); //

            //Training Need
            Database::"HR Training Needs":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTNeedForApprovalCode, Variant); //


            //Transport
            Database::"HR Transport Requisition Head":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTransportForApprovalCode, Variant); //

            //EmpTransfer
            Database::"HR Employee Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpTransferAppForApprovalCode, Variant); //


            //Jobs
            Database::"HR Jobs":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendJobAppForApprovalCode, Variant); //


            //legal
            Database::Legal:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLegalForApprovalCode, Variant); //

            //Surety Management
            Database::"Surety Management":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSuretyForApprovalCode, Variant); //

            //Contracts
            Database::Contracts:
                WorkflowManagement.HandleEvent(RunWorkflowOnSendContractForApprovalCode, Variant); //

            //Permission Requisition
            Database::"Permission Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPermissionRequisitionForApprovalCode, Variant); //


            //Planner
            Database::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPlannerAppForApprovalCode, Variant); //

            //HR Employees  DATABASE::"HR Employees":
            Database::"HR Employees":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeAppForApprovalCode, Variant); //

            //HR Interns Requisition  DATABASE::"HR Interns Requisition":
            Database::"HR Interns Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInternReqAppForApprovalCode, Variant); //

            //HR End

            // MSACCO

            // M-SACCO Change PIN No  DATABASE::"M-SACCO Change PIN No":
            Database::"M-SACCO Change PIN No":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMSACCOPINApprovalCode, Variant); //

            // M-SACCO Applications DATABASE::"M-SACCO Applications":
            Database::"M-SACCO Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMsaccoApplicationApprovalCode, Variant); //

            // Agency DATABASE::"Agent Applications":
            Database::"Agent Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAgentApplicationForApprovalCode, Variant);

            // M-PESA Changes DATABASE::"M-PESA Change Transactions":
            Database::"M-PESA Change Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMSACCOChangeApprovalCode, Variant); //


            // MSACCO

            //Mortgage Release Doc
            Database::"Mortgage Loans Doc Release":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendMortgageDocReleaseForApprovalCode, Variant); //

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]

    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Electoral Zones":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelElectoralZoneAppForApprovalCode, Variant);
            Database::"Delegate Officials":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegateOfficialsAppForApprovalCode, Variant);
            //hr leave/kelvin
            Database::"HR Leave Journal Line":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHrLeaveAdjustmentsAppForApprovalCode, Variant);
            Database::"Sky Virtual Member":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSkyVirtualMemberForApprovalCode, Variant);
            // Database::"Banking Account Closure":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankingAccountClosureForApprovalCode, Variant);
            // Database::"SinkFund Report Information":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelSinkFundReportForApprovalCode, Variant);
            // Database::"Delegate Region Change":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegatesRegionChangeForApprovalCode, Variant);
            // Database::"Delegate AGM Update Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegateAGMUpdateForApprovalCode, Variant);
            Database::"Payments Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPaymentForApprovalCode, Variant);
            Database::"Payments Header Board":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBoardPaymentForApprovalCode, Variant);
            //Delegates
            Database::"Payments Header Delegates":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegatesAppForApprovalCode, Variant);

            Database::"InterBank Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInterbankForApprovalCode, Variant);
            Database::"Staff Claims Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffClaimForApprovalCode, Variant);
            Database::"Staff Advance Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffAdvanceForApprovalCode, Variant);
            Database::"Staff Advance Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffAdvanceSurrenderForApprovalCode, Variant);
            Database::"Imprest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelImprestForApprovalCode, Variant);
            Database::"Imprest Surrender Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelImprestSurrenderForApprovalCode, Variant);
            Database::"Store Requistion Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStoreRequisitionForApprovalCode, Variant);
            Database::"Overtime Claim Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelOvertimeForApprovalCode, Variant);
            Database::"G/L Budget Name":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBudgetForApprovalCode, Variant);
            Database::Workplan:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelWorkplanForApprovalCode, Variant);
            Database::"Vote Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVoteForApprovalCode, Variant);
            Database::"Asset Transfer":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAssetTransferForApprovalCode, Variant);
            //Cashier Transaction
            Database::"Cashier Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCashierTRANSForApprovalCode, Variant);
            //Cashier Transaction
            //Property Lease
            Database::Lease:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaseForApprovalCode, Variant);
            //Property Lease
            //Property
            Database::"Property Details":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPropForApprovalCode, Variant);
            //Property
            //Salary Transaction
            Database::"Salary Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSalaryTRANSForApprovalCode, Variant);
            //Salary Transaction

            //Bankers Cheque
            Database::"Bankers Cheque Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankersCForApprovalCode, Variant);
            //Bankers Cheque

            //Bank Cheque
            Database::"Cheque Book Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankCForApprovalCode, Variant);
            //Bank Cheque
            // Database::"Document Exemptions Auth.":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelDocExForApprovalCode, Variant);

            //Overdraft
            Database::"Over Draft Authorisation":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelODForApprovalCode, Variant);
            //Overdraft

            //Account Transfer
            Database::"Account Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelACTForApprovalCode, Variant);
            //Account Transfer

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTREASForApprovalCode, Variant);
            //Inter Teller

            //Investments
            Database::"Investment Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelINVForApprovalCode, Variant);
            //Investments

            //Cheque receipts
            Database::"Cheque Receipts":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCHQForApprovalCode, Variant);
            //Cheque receipts

            //Member Application
            Database::"Member Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMemberAppForApprovalCode, Variant); //

            //Salary Agreement
            Database::"Salary Agreement":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSalaryAgreementForApprovalCode, Variant); //
            //Account Application
            Database::"Savings Account Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAccountAppForApprovalCode, Variant); //
            //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEFTAppForApprovalCode, Variant); //
            //Standing Order Application
            Database::"Standing Order Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSTOAppForApprovalCode, Variant); //
            //Standing Order Control Application
            Database::"Standing Order Control":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSTOCTLAppForApprovalCode, Variant); //
            //Dividend Rate Application
            Database::"Dividend Simulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDividendRateAppForApprovalCode, Variant); //
            //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDRAppForApprovalCode, Variant); //
            //Product Factory Application
            Database::"Product Factory Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPFAAppForApprovalCode, Variant); //
            //Loan
            Database::Loans:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLoanAppForApprovalCode, Variant); //
            //Collateral
            Database::"Securities Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCollateralForApprovalCode, Variant); //
                                                                                                       //Loan batch
            Database::"Loan Disbursement Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLoanBatchForApprovalCode, Variant); //

            //Collateral collection
            Database::"Securities Collection Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCollatReturnForApprovalCode, Variant); //

            //INTEREST BILLING
            Database::"Interest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInterestBillingForApprovalCode, Variant); //
                                                                                                            //Savings Interest Header
            Database::"Savings Interest Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSavingsInterestHeaderForApprovalCode, Variant); //
                                                                                                                  //End Year Transfer Header
            Database::"End Year Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEndYearTransferHeaderForApprovalCode, Variant); //

            //ATM Applications
            Database::"ATM Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelATMApplicationsForApprovalCode, Variant); //
                                                                                                            //ATM Linking Applications
            Database::"ATM Linking Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelATMLinkingApplicationsForApprovalCode, Variant); //
                                                                                                                   //Checkoff
            Database::"Checkoff Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCheckoffAppForApprovalCode, Variant); //
                                                                                                        //Membership Closure
            Database::"Membership closure":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMembershipClosureAppForApprovalCode, Variant); //
                                                                                                                 //Loan Rescheduling
            Database::"Loan Rescheduling":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLoanRescheduleAppForApprovalCode, Variant); //
                                                                                                              //Withdrawal Notice
            Database::"Member withdrawal Notice":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelWithdrawalNoticeAppForApprovalCode, Variant); //
            //Guarantor Substitution
            Database::"Guarantors Substitution":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelGuarantorSubstitutionAppForApprovalCode, Variant); //
            //Loan Recovery
            Database::"Loan Recovery Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecoveryHeaderAppForApprovalCode, Variant); //

            Database::"Document Exemptions Auth.":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDocExForApprovalCode, Variant);
            //Bond
            Database::Bond:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBondAppForApprovalCode, Variant); //

            //Sink Fund
            Database::"BBF Requisation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSinkFundAppForApprovalCode, Variant); //

            //Delegate Region Change
            Database::"Delegate Region Change":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegatesRegionChangeForApprovalCode, Variant); //

            //Delegate AGM Update
            Database::"Delegate AGM Update Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegateAGMUpdateForApprovalCode, Variant); //

            //Fosa Account Closure
            Database::"Banking Account Closure":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBankingAccountClosureForApprovalCode, Variant); //


            //BDE Management
            Database::"BDE Management Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBDEManagementAppForApprovalCode, Variant); //

            //Delegate Groups Applicationss
            Database::"Delegate Region Applicationss":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegateGroupsApplicationssForApprovalCode, Variant); //
                                                                                                                        //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegateGroupMemRetirementsForApprovalCode, Variant); //
                                                                                                                        //Delegates Payment
            Database::"Delegates Payment":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDelegatesPaymentForApprovalCode, Variant); //

            //HR
            //EmployeeRequisition
            Database::"HR Employee Requisitions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmployeeRequisitionAppForApprovalCode, Variant); //

            //leave
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelleaveAppForApprovalCode, Variant); //

            //Training Feedback
            Database::"HR Training Feedback Form":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTFeedAppForApprovalCode, Variant); //

            //Interns
            Database::"HR Interns":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInternAppForApprovalCode, Variant); //

            //Appraisal Appeal
            Database::"HR Appraissal Appeal":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAppraisalAppealAppForApprovalCode, Variant); //

            //Disciplinary appeal
            Database::"HRDisciplinary Appeal":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDisciplinaryAppealAppForApprovalCode, Variant); //

            //Disciplinary Withdrawal
            Database::"HRDisciplinary Case Withdrawal":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDisciplinaryWithdrawalAppForApprovalCode, Variant); //

            //Disciplinary
            Database::"HR Disciplinary Cases NCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDisciplinaryAppForApprovalCode, Variant); //

            //StaffLoan
            Database::"prSalary Advance":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffLoanAppForApprovalCode, Variant); //

            //training
            Database::"HR Training App Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingAppForApprovalCode, Variant); //

            //Training Need
            Database::"HR Training Needs":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTNeedAppForApprovalCode, Variant); //


            //Transport
            Database::"HR Transport Requisition Head":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTransportAppForApprovalCode, Variant); //

            //EmpTransfer
            Database::"HR Employee Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpTransferAppForApprovalCode, Variant); //


            //Jobs
            Database::"HR Jobs":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelJobAppForApprovalCode, Variant); //

            //Planner
            Database::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPlannerAppForApprovalCode, Variant); //

            //legal
            Database::Legal:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLegalForApprovalCode, Variant); //

            //legal
            Database::"Surety Management":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSuretyForApprovalCode, Variant); //

            //Contract
            Database::Contracts:
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelContractAppForApprovalCode, Variant); //
                                                                                                        //Permission Requisition
            Database::"Permission Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPermissionRequisitionForApprovalCode, Variant); //


            //HR Employees  DATABASE::"HR Employees":
            Database::"HR Employees":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmployeeAppForApprovalCode, Variant); //

            //HR Interns Requisition  DATABASE::"HR Interns Requisition":
            Database::"HR Interns Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInternReqAppForApprovalCode, Variant); //
                                                                                                         //HR End

            // MSACCO

            //M-SACCO Change PIN No DATABASE::"M-SACCO Change PIN No":
            Database::"M-SACCO Change PIN No":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMSACCOPINRequestApprovalCode, Variant); //

            //M-SACCO Applications DATABASE::"M-SACCO Applications":
            Database::"M-SACCO Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMsaccoAPPLICATIONRequestApprovalCode, Variant); //

            //M-SACCO Applications DATABASE::"M-SACCO Applications":
            Database::"Agent Applications":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAgentApplicationForApprovalCode, Variant); //


            //M-SACCO Applications DATABASE::"M-PESA Change Transactions":
            Database::"M-PESA Change Transactions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMSACCOChangeRequestApprovalCode, Variant); //

            // MSACCO

            //Mortgage Release Doc
            Database::"Mortgage Loans Doc Release":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelMortgageDocReleaseForApprovalCode, Variant); //

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;


    procedure ReOpen(var Variant: Variant)
    var
        RecRef: RecordRef;
        PaymentsHeader: Record 52185888;
        StaffClaimsHeader: Record 52185912;
        StaffAdvanceHeader: Record 52185914;
        StaffAdvanceSurrenderHeader: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestSurrenderHeader: Record 52185885;
        StoreRequistionHeader: Record 52185868;
        InterBankTransfers: Record 52185881;
        OvertimeClaimHeader: Record 52185936;
        Budget: Record "G/L Budget Name";
        Workplan: Record 52185981;
        WorkplanActivities: Record 52185902;
        Vote: Record 52185922;
        AssetTransfer: Record 52185892;
        Vendor: Record Vendor;
        ctrans: Record 52185776;
        Sal: Record 52185783;
        MemberAppl: Record 52185691;
        SAccountAppl: Record 52185704;
        EFTAppl: Record 52185715;
        STOAppl: Record 52185717;
        StandingOrderControl: Record 52185722;
        DeactivateReactivateHeader: Record 52185753;
        Loans: Record 52185729;
        DocExempts: Record 52185857;
        ProductFactoryApplication: Record 52186117;
        SecuritiesRegister: Record 52185840;
        BankersC: Record 52185793;
        BankC: Record 52185785;
        OD: Record 52185795;
        ACT: Record 52185797;
        TREAS: Record 52185778;
        INV: Record 52185807;
        CHQ: Record 52185787;
        LoanBatch: Record 52185736;
        DividendsSimulationHeader: Record 52185710;
        InterestHeader: Record 52185860;
        SavingsInterestHeader: Record 52185845;
        EndYearTransferHeader: Record 52185847;
        ATMApplications: Record 52185850;
        ATMLinkingApplications: Record 52185842;
        Checkoff: Record 52185819;
        MembClosure: Record 52185824;
        LoanRescheduling: Record 52185823;
        MemberwithdrawalNotice: Record 52185826;
        GuarantorsSubstitution: Record 52185828;
        LoanRecoveryHeader: Record 52185829;
        Bond: Record 52185835;
        BDEManagementHeader: Record 52186128;
        DelegateGroupsApplicationss: Record 52186064;
        DelegateGroupMemRetirements: Record 52186065;
        DelegatesPayment: Record 52186067;
        HRJobs: Record 52185508;
        Hrempreq: Record 52185519;
        Leave: Record 52185532;
        hrtraining: Record 52185580;
        hrtransport: Record 52185571;
        EmpTrans: Record 52185576;
        HRInternReq: Record 52185612;
        leavePlanner: Record 52185542;
        MsaccoPIN: Record 52185768;
        MsaccoApp: Record 52185757;
        StaffLoan: Record 52185674;
        TNeed: Record 52185581;
        SecuritiesCollectionRegister: Record 52185843;
        BBFRequisationHeader: Record 52186126;
        Disciplinary: Record 52186162;
        AppraisalAppeal: Record 52185596;
        DisciplinaryAppeal: Record 52185970;
        DiscWithdrawal: Record 52185971;
        LeaseDoc: Record 52186008;
        MpesaChange: Record 52185769;
        TFeed: Record 52186205;
        Intern: Record 52185611;
        PropertyDetails: Record 52186005;
        Cases1: Record 52185957;
        contrct: Record 52185942;
        SuretyMangt: Record 52185964;
        PaymentsHeaderBoard: Record 52185895;
        AgentApplications: Record 52186104;
        SinkFundReportInformation: Record 52185940;
        AGMDelegatesPayment: Record 52186209;
        BankingAccountClosure: Record 52186211;
        DelegateRegionChange: Record 52186074;
        DelegateAGMUpdateHeader: Record 52186077;
        MortDoc: Record 52186089;
        SalaryAgreement: Record 52186037;
        HREmployees: Record 52185650;
        PermissionRequisition: Record 52186039;
        PaymentsHeaderDelegates: Record 52185897;
        SkyVirtualMember: Record 52185499;
        ElectoralZones: Record 52186239;
        DelegateOfficials: Record 52186240;
        HRLeaveJournalLine: Record 52185544;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            Database::"Electoral Zones":
                begin
                    RecRef.SetTable(ElectoralZones);
                    ElectoralZones.Validate(Status, DelegateAGMUpdateHeader.Status::Open);
                    ElectoralZones.Modify;
                    Variant := ElectoralZones;
                end;
            Database::"HR Leave Journal Line":
                begin
                    RecRef.SetTable(HRLeaveJournalLine);
                    HRLeaveJournalLine.Validate(Status, HRLeaveJournalLine.Status::Open);
                    HRLeaveJournalLine.Modify;
                    Variant := HRLeaveJournalLine;
                end;

            Database::"Delegate Officials":
                begin
                    RecRef.SetTable(DelegateOfficials);
                    DelegateOfficials.Validate(Status, DelegateOfficials.Status::Open);
                    DelegateOfficials.Modify;
                    Variant := DelegateOfficials;
                end;

            //Sky Virtual Member
            Database::"Sky Virtual Member":
                begin
                    RecRef.SetTable(SkyVirtualMember);
                    SkyVirtualMember.Validate(Status, SkyVirtualMember.Status::Open);
                    SkyVirtualMember.Modify;
                    Variant := SkyVirtualMember;
                end;
            //Sky Virtual Member

            Database::"SinkFund Report Information":
                begin
                    RecRef.SetTable(SinkFundReportInformation);
                    SinkFundReportInformation.Validate(Status, SinkFundReportInformation.Status::Open);
                    SinkFundReportInformation.Modify;
                    Variant := SinkFundReportInformation;
                end;

            Database::"Delegate Region Change":
                begin
                    RecRef.SetTable(DelegateRegionChange);
                    SinkFundReportInformation.Validate(Status, DelegateRegionChange.Status::Open);
                    DelegateRegionChange.Modify;
                    Variant := DelegateRegionChange;
                end;



            Database::"Banking Account Closure":
                begin
                    RecRef.SetTable(BankingAccountClosure);
                    BankingAccountClosure.Validate(Status, BankingAccountClosure.Status::Open);
                    BankingAccountClosure.Modify;
                    Variant := BankingAccountClosure;
                end;



            Database::"AGM Delegates Payment":
                begin
                    RecRef.SetTable(AGMDelegatesPayment);
                    AGMDelegatesPayment.Validate(Status, AGMDelegatesPayment.Status::Open);
                    AGMDelegatesPayment.Modify;
                    Variant := AGMDelegatesPayment;
                end;




            Database::"Delegate AGM Update Header":
                begin
                    RecRef.SetTable(DelegateAGMUpdateHeader);
                    DelegateAGMUpdateHeader.Validate(Status, DelegateAGMUpdateHeader.Status::Open);
                    DelegateAGMUpdateHeader.Modify;
                    Variant := DelegateAGMUpdateHeader;
                end;



            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentsHeader);
                    PaymentsHeader.Validate(Status, PaymentsHeader.Status::Pending);
                    PaymentsHeader.Modify;
                    Variant := PaymentsHeader;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaimsHeader);
                    StaffClaimsHeader.Validate(Status, StaffClaimsHeader.Status::Pending);
                    StaffClaimsHeader.Modify;
                    Variant := StaffClaimsHeader;
                end;
            Database::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvanceHeader);
                    StaffAdvanceHeader.Validate(Status, StaffAdvanceHeader.Status::Pending);
                    StaffAdvanceHeader.Modify;
                    Variant := StaffAdvanceHeader;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurrenderHeader);
                    StaffAdvanceSurrenderHeader.Validate(Status, StaffAdvanceSurrenderHeader.Status::Pending);
                    StaffAdvanceSurrenderHeader.Modify;
                    Variant := StaffAdvanceSurrenderHeader;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::Pending);
                    ImprestHeader.Modify;
                    Variant := ImprestHeader;
                end;
            //Property Lease
            Database::Lease:
                begin
                    RecRef.SetTable(LeaseDoc);
                    LeaseDoc.Validate(Status, LeaseDoc.Status::Open);
                    LeaseDoc.Modify;
                    Variant := LeaseDoc;
                end;
            //end Property Lease
            //Property
            Database::"Property Details":
                begin
                    RecRef.SetTable(PropertyDetails);
                    PropertyDetails.Validate(Status, PropertyDetails.Status::Open);
                    PropertyDetails.Modify;
                    Variant := PropertyDetails;
                end;
            //end Property

            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurrenderHeader);
                    ImprestSurrenderHeader.Validate(Status, ImprestSurrenderHeader.Status::Pending);
                    ImprestSurrenderHeader.Modify;
                    Variant := ImprestSurrenderHeader;
                end;
            Database::"Store Requistion Header":
                begin
                    RecRef.SetTable(StoreRequistionHeader);
                    StoreRequistionHeader.Validate(Status, StoreRequistionHeader.Status::Open);
                    StoreRequistionHeader.Modify;
                    Variant := StoreRequistionHeader;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterBankTransfers);
                    InterBankTransfers.Validate(Status, InterBankTransfers.Status::Pending);
                    InterBankTransfers.Modify;
                    Variant := InterBankTransfers;
                end;
            Database::"Overtime Claim Header":
                begin
                    RecRef.SetTable(OvertimeClaimHeader);
                    OvertimeClaimHeader.Validate(Status, OvertimeClaimHeader.Status::Pending);
                    OvertimeClaimHeader.Modify;
                    Variant := OvertimeClaimHeader;
                end;
            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::Open);
                    Budget.Modify;
                    Variant := Budget;
                end;
            Database::Workplan:
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::Pending);
                    Workplan.Modify;
                    Variant := Workplan;
                end;
            Database::"Vote Transfer":
                begin
                    RecRef.SetTable(Vote);
                    Vote.Validate(Status, Vote.Status::Open);
                    Vote.Modify;
                    Variant := Vote;
                end;
            Database::"Asset Transfer":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::New);
                    AssetTransfer.Modify;
                    Variant := AssetTransfer;
                end;
            Database::"Payments Header Board":
                begin
                    RecRef.SetTable(PaymentsHeaderBoard);
                    PaymentsHeaderBoard.Validate(Status, PaymentsHeaderBoard.Status::Pending);
                    PaymentsHeaderBoard.Modify;
                    Variant := PaymentsHeaderBoard;
                end;
            //Delegates
            Database::"Payments Header Delegates":
                begin
                    RecRef.SetTable(PaymentsHeaderDelegates);
                    PaymentsHeaderDelegates.Validate(Status, PaymentsHeaderDelegates.Status::Pending);
                    PaymentsHeaderDelegates.Modify;
                    Variant := PaymentsHeaderDelegates;
                end;

            Database::Vendor:
                begin
                    RecRef.SetTable(Vendor);
                    Vendor.Validate(Status, Vendor.Status::New);
                    Vendor.Modify;
                    Variant := Vendor;
                end;
            //Cashier Transactions
            Database::"Cashier Transactions":
                begin
                    RecRef.SetTable(ctrans);
                    ctrans.Validate(Status, ctrans.Status::Open);
                    ctrans.Modify;
                    Variant := ctrans;
                end;

            //Cashier Transactions
            Database::"Document Exemptions Auth.":
                begin
                    RecRef.SetTable(DocExempts);
                    DocExempts.Validate(Status, DocExempts.Status::Open);
                    DocExempts.Modify;
                    Variant := DocExempts;
                end;

            //Salary Transactions
            Database::"Salary Header":
                begin
                    RecRef.SetTable(Sal);
                    Sal.Validate(Status, Sal.Status::Open);
                    Sal.Modify;
                    Variant := Sal;
                end;
            //Salary Transactions

            //Bankers Cheque
            Database::"Bankers Cheque Application":
                begin
                    RecRef.SetTable(BankersC);
                    BankersC.Validate(Status, BankersC.Status::Open);
                    BankersC.Modify;
                    Variant := BankersC;
                end;
            //Bankers Cheque

            //Bank Cheque
            Database::"Cheque Book Application":
                begin
                    RecRef.SetTable(BankC);
                    BankC.Validate(Status, BankC.Status::Open);
                    BankC.Modify;
                    Variant := BankC;
                end;
            //Bank Cheque

            //Over Draft
            Database::"Over Draft Authorisation":
                begin
                    RecRef.SetTable(OD);
                    OD.Validate(Status, OD.Status::Open);
                    OD.Modify;
                    Variant := OD;
                end;
            //Over Draft

            //Account Transfers
            Database::"Account Transfer Header":
                begin
                    RecRef.SetTable(ACT);
                    ACT.Validate(Status, ACT.Status::Open);
                    ACT.Modify;
                    Variant := ACT;
                end;
            //Account Transfers

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                begin
                    RecRef.SetTable(TREAS);
                    TREAS.Validate(Status, TREAS.Status::Open);
                    TREAS.Modify;
                    Variant := TREAS;
                end;
            //Inter Teller

            //Investments
            Database::"Investment Header":
                begin
                    RecRef.SetTable(INV);
                    INV.Validate(Status, INV.Status::Open);
                    INV.Modify;
                    Variant := INV;
                end;
            //Investments


            //Cheque receipts
            Database::"Cheque Receipts":
                begin
                    RecRef.SetTable(CHQ);
                    CHQ.Validate(Status, CHQ.Status::Open);
                    CHQ.Modify;
                    Variant := CHQ;
                end;
            //Cheque Receipts

            //Member Application
            Database::"Member Application":
                begin
                    RecRef.SetTable(MemberAppl);
                    MemberAppl.Validate(Status, MemberAppl.Status::Open);
                    MemberAppl.Modify;
                    Variant := MemberAppl;
                end;//

            //HR Employees
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmployees);
                    HREmployees.Validate(Status, HREmployees.Status::New);
                    HREmployees.Modify;
                    Variant := HREmployees;
                end;//

            //Salary Agreement
            Database::"Salary Agreement":
                begin
                    RecRef.SetTable(SalaryAgreement);
                    SalaryAgreement.Validate(Status, SalaryAgreement.Status::Open);
                    SalaryAgreement.Modify;
                    Variant := SalaryAgreement;
                end;//

            //Account Application
            Database::"Savings Account Application":
                begin
                    RecRef.SetTable(SAccountAppl);
                    SAccountAppl.Validate(Status, SAccountAppl.Status::Open);
                    SAccountAppl.Modify;
                    Variant := SAccountAppl;
                end;//
                    //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                begin
                    RecRef.SetTable(EFTAppl);
                    EFTAppl.Validate(Status, EFTAppl.Status::Open);
                    EFTAppl.Modify;
                    Variant := EFTAppl;
                end;//
                    //Standing Order Application
            Database::"Standing Order Header":
                begin
                    RecRef.SetTable(STOAppl);
                    STOAppl.Validate(Status, STOAppl.Status::Open);
                    STOAppl.Modify;
                    Variant := STOAppl;
                end;//
                    //Standing Order Control Application
            Database::"Standing Order Control":
                begin
                    RecRef.SetTable(StandingOrderControl);
                    StandingOrderControl.Validate(Status, StandingOrderControl.Status::Open);
                    StandingOrderControl.Modify;
                    Variant := StandingOrderControl;
                end;//
                    //Dividend Rate Application
            Database::"Dividend Simulation Header":
                begin
                    RecRef.SetTable(DividendsSimulationHeader);
                    DividendsSimulationHeader.Validate(Status, DividendsSimulationHeader.Status::Open);
                    DividendsSimulationHeader.Modify;
                    Variant := DividendsSimulationHeader;
                end;//
                    //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                begin
                    RecRef.SetTable(DeactivateReactivateHeader);
                    DeactivateReactivateHeader.Validate(Status, DeactivateReactivateHeader.Status::Open);
                    DeactivateReactivateHeader.Modify;
                    Variant := DeactivateReactivateHeader;
                end;//
                    //Product Factory Application
            Database::"Product Factory Application":
                begin
                    RecRef.SetTable(ProductFactoryApplication);
                    ProductFactoryApplication.Validate(Status, ProductFactoryApplication.Status::Open);
                    ProductFactoryApplication.Modify;
                    Variant := ProductFactoryApplication;
                end;//
                    //Loans
            Database::Loans:
                begin
                    RecRef.SetTable(Loans);
                    Loans.Validate(Status, Loans.Status::Open);
                    Loans.Modify;
                    Variant := Loans;
                end;
            //Collateral
            Database::"Securities Register":
                begin
                    RecRef.SetTable(SecuritiesRegister);
                    SecuritiesRegister.Validate(Status, SecuritiesRegister.Status::Open);
                    SecuritiesRegister.Modify;
                    Variant := SecuritiesRegister;
                end;//

            //Collateral return
            Database::"Securities Collection Register":
                begin
                    RecRef.SetTable(SecuritiesCollectionRegister);
                    SecuritiesCollectionRegister.Validate(Status, SecuritiesCollectionRegister.Status::Open);
                    SecuritiesCollectionRegister.Modify;
                    Variant := SecuritiesCollectionRegister;
                end;
            //Loan batch
            Database::"Loan Disbursement Header":
                begin
                    RecRef.SetTable(LoanBatch);
                    LoanBatch.Validate(Status, LoanBatch.Status::Open);
                    LoanBatch.Modify;
                    Variant := LoanBatch;
                end;
            //Interest Billing
            Database::"Interest Header":
                begin
                    RecRef.SetTable(InterestHeader);
                    InterestHeader.Validate(Status, InterestHeader.Status::Open);
                    InterestHeader.Modify;
                    Variant := InterestHeader;
                end;//
                    //Savings Interest Header
            Database::"Savings Interest Header":
                begin
                    RecRef.SetTable(SavingsInterestHeader);
                    SavingsInterestHeader.Validate(Status, SavingsInterestHeader.Status::Open);
                    SavingsInterestHeader.Modify;
                    Variant := SavingsInterestHeader;
                end;//
                    //End Year Transfer Header
            Database::"End Year Transfer Header":
                begin
                    RecRef.SetTable(EndYearTransferHeader);
                    EndYearTransferHeader.Validate(Status, EndYearTransferHeader.Status::Open);
                    EndYearTransferHeader.Modify;
                    Variant := EndYearTransferHeader;
                end;//


            //ATM Applications
            Database::"ATM Applications":
                begin
                    RecRef.SetTable(ATMApplications);
                    ATMApplications.Validate(Status, ATMApplications.Status::Open);
                    ATMApplications.Modify;
                    Variant := ATMApplications;
                end;//
                    //ATM Linking Applications
            Database::"ATM Linking Applications":
                begin
                    RecRef.SetTable(ATMLinkingApplications);
                    ATMLinkingApplications.Validate(Status, ATMLinkingApplications.Status::Open);
                    ATMLinkingApplications.Modify;
                    Variant := ATMLinkingApplications;
                end;//
                    //Checkoff
            Database::"Checkoff Header":
                begin
                    RecRef.SetTable(Checkoff);
                    Checkoff.Validate(Status, Checkoff.Status::Open);
                    Checkoff.Modify;
                    Variant := Checkoff;
                end;
            //
            //Membership Closure
            Database::"Membership closure":
                begin
                    RecRef.SetTable(MembClosure);
                    MembClosure.Validate(Status, MembClosure.Status::Open);
                    MembClosure.Modify;
                    Variant := MembClosure;
                end;
            //

            //Lona Resheduling
            Database::"Loan Rescheduling":
                begin
                    RecRef.SetTable(LoanRescheduling);
                    LoanRescheduling.Validate(Status, LoanRescheduling.Status::Open);
                    LoanRescheduling.Modify;
                    Variant := LoanRescheduling;
                end;
            //
            //Legal
            Database::Contracts:
                begin
                    RecRef.SetTable(contrct);
                    contrct.Validate(Status, contrct.Status::New);
                    contrct.Modify;
                    Variant := contrct;
                end;
            //

            //Member Withdrawal
            Database::"Member withdrawal Notice":
                begin
                    RecRef.SetTable(MemberwithdrawalNotice);
                    MemberwithdrawalNotice.Validate(Status, MemberwithdrawalNotice.Status::Open);
                    MemberwithdrawalNotice.Modify;
                    Variant := MemberwithdrawalNotice;
                end;
            //

            //Gurantor Substitution
            Database::"Guarantors Substitution":
                begin
                    RecRef.SetTable(GuarantorsSubstitution);
                    GuarantorsSubstitution.Validate(Status, GuarantorsSubstitution.Status::Open);
                    GuarantorsSubstitution.Modify;
                    Variant := GuarantorsSubstitution;
                end;
            //

            //Loan Recovery
            Database::"Loan Recovery Header":
                begin
                    RecRef.SetTable(LoanRecoveryHeader);
                    LoanRecoveryHeader.Validate(Status, LoanRecoveryHeader.Status::Open);
                    LoanRecoveryHeader.Modify;
                    Variant := LoanRecoveryHeader;
                end;
            //

            //Bond
            Database::Bond:
                begin
                    RecRef.SetTable(Bond);
                    Bond.Validate("Bond Status", Bond."bond status"::Open);
                    Bond.Modify;
                    Variant := Bond;
                end;
            //

            //Sink Fund
            Database::"BBF Requisation Header":
                begin
                    RecRef.SetTable(BBFRequisationHeader);
                    BBFRequisationHeader.Validate(Status, BBFRequisationHeader.Status::Open);
                    BBFRequisationHeader.Modify;
                    Variant := BBFRequisationHeader;
                end;
            //

            //BDE Management
            Database::"BDE Management Header":
                begin
                    RecRef.SetTable(BDEManagementHeader);
                    BDEManagementHeader.Validate(Status, BDEManagementHeader.Status::Open);
                    BDEManagementHeader.Modify;
                    Variant := BDEManagementHeader;
                end;
            //
            //Delegate Groups Applicationss
            Database::"Delegate Region Applicationss":
                begin
                    RecRef.SetTable(DelegateGroupsApplicationss);
                    DelegateGroupsApplicationss.Validate(Status, DelegateGroupsApplicationss.Status::Open);
                    DelegateGroupsApplicationss.Modify;
                    Variant := DelegateGroupsApplicationss;
                end;
            //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                begin
                    RecRef.SetTable(DelegateGroupMemRetirements);
                    DelegateGroupMemRetirements.Validate(Status, DelegateGroupMemRetirements.Status::Open);
                    DelegateGroupMemRetirements.Modify;
                    Variant := DelegateGroupMemRetirements;
                end;
            //Delegates Payment
            Database::"Delegates Payment":
                begin
                    RecRef.SetTable(DelegatesPayment);
                    DelegatesPayment.Validate(Status, DelegatesPayment.Status::Open);
                    DelegatesPayment.Modify;
                    Variant := DelegatesPayment;
                end;


            //HR______________
            //HR
            //Jobs
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::Open);
                    HRJobs.Modify;
                    Variant := HRJobs;
                end;
            //HR Jobs
            //HR leave Planner
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(leavePlanner);
                    leavePlanner.Validate(Status, leavePlanner.Status::New);
                    leavePlanner.Modify;
                    Variant := leavePlanner;
                end;
            //HR Intern Requisition
            Database::"HR Interns Requisition":
                begin
                    RecRef.SetTable(HRInternReq);
                    HRInternReq.Validate(Status, HRInternReq.Status::Open);
                    HRInternReq.Modify;
                    Variant := HRInternReq;
                end;
            //HR Intern Requisition

            //Employee Requisition
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Validate("Approval Status", Hrempreq."approval status"::Open);
                    Hrempreq.Modify;
                    Variant := Hrempreq;
                end;


            //Leave
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(Leave);
                    Leave.Validate(Status, Leave.Status::New);
                    Leave.Modify;
                    Variant := Leave;
                end;


            //Training Feedback
            Database::"HR Training Feedback Form":
                begin
                    RecRef.SetTable(TFeed);
                    TFeed.Validate(Status, TFeed.Status::New);
                    TFeed.Modify;
                    Variant := TFeed;
                end;


            //Interns
            Database::"HR Interns":
                begin
                    RecRef.SetTable(Intern);
                    Intern.Validate("Posting Status", Intern."posting status"::Open);
                    Intern.Modify;
                    Variant := Intern;
                end;

            //Appraisal Appeal
            Database::"HR Appraissal Appeal":
                begin
                    RecRef.SetTable(AppraisalAppeal);
                    AppraisalAppeal.Validate(Status, AppraisalAppeal.Status::New);
                    AppraisalAppeal.Modify;
                    Variant := AppraisalAppeal;
                end;

            //Disciplinary Appeal
            Database::"HRDisciplinary Appeal":
                begin
                    RecRef.SetTable(DisciplinaryAppeal);
                    DisciplinaryAppeal.Validate(Status, DisciplinaryAppeal.Status::New);
                    DisciplinaryAppeal.Modify;
                    Variant := DisciplinaryAppeal;
                end;

            //Disciplinary Withdrwal
            Database::"HRDisciplinary Case Withdrawal":
                begin
                    RecRef.SetTable(DiscWithdrawal);
                    DiscWithdrawal.Validate(Status, DiscWithdrawal.Status::New);
                    DiscWithdrawal.Modify;
                    Variant := DiscWithdrawal;
                end;


            //Disciplinary
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.SetTable(Disciplinary);
                    Disciplinary.Validate(Status, Disciplinary.Status::New);
                    Disciplinary.Modify;
                    Variant := Disciplinary;
                end;

            //Staff Loan
            Database::"prSalary Advance":
                begin
                    RecRef.SetTable(StaffLoan);
                    StaffLoan.Validate(Status, StaffLoan.Status::New);
                    StaffLoan.Modify;
                    Variant := StaffLoan;
                end;

            //Training Need
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(TNeed);
                    TNeed.Validate(Status, TNeed.Status::New);
                    TNeed.Modify;
                    Variant := TNeed;
                end;
            //Training
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(hrtraining);
                    hrtraining.Validate(Status, hrtraining.Status::New);
                    hrtraining.Modify;
                    Variant := hrtraining;
                end;

            //Permission Requistion
            Database::"Permission Requisition":
                begin
                    RecRef.SetTable(PermissionRequisition);
                    PermissionRequisition.Validate(Status, PermissionRequisition.Status::Open);
                    PermissionRequisition.Modify;
                    Variant := PermissionRequisition;
                end;
            //Hr Transport hrtransport
            Database::"HR Transport Requisition Head":
                begin
                    RecRef.SetTable(hrtransport);
                    hrtransport.Validate(Status, hrtransport.Status::New);
                    hrtransport.Modify;
                    Variant := hrtransport;
                end;

            //Hr Emplpoyee Transfer EmpTrans
            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::New);
                    EmpTrans.Modify;
                    Variant := EmpTrans;
                end;
            //end HR

            // M-SACCO PIN No Change MSACCOPIN
            Database::"M-SACCO Change PIN No":
                begin
                    RecRef.SetTable(MsaccoPIN);
                    MsaccoPIN.Validate(Status, MsaccoPIN.Status::Open);
                    MsaccoPIN.Modify;
                    Variant := MsaccoPIN;
                end;


            //legal
            Database::Legal:
                begin
                    RecRef.SetTable(Cases1);
                    Cases1.Validate(Status, Cases1.Status::New);
                    Cases1.Modify;
                    Variant := Cases1;
                end;
            //SuretyMangt
            Database::"Surety Management":
                begin
                    RecRef.SetTable(SuretyMangt);
                    SuretyMangt.Validate(Status, SuretyMangt.Status::New);
                    SuretyMangt.Modify;
                    Variant := SuretyMangt;
                end;



            /* // M-SACCO Applications
              DATABASE::"M-SACCO Applications":
              BEGIN
                 RecRef.SETTABLE(MsaccoApp);
                 MsaccoApp.VALIDATE(Status,MsaccoApp.Status::Open);
                 MsaccoApp.MODIFY;
                 Variant := MsaccoApp;
                END;*/


            // M-SACCO Applications
            Database::"M-SACCO Applications":
                begin
                    RecRef.SetTable(MsaccoApp);
                    MsaccoApp.Validate(Status, MsaccoApp.Status::Open);
                    MsaccoApp.Modify;
                    Variant := MsaccoApp;
                end;

            //Agent Applications
            Database::"Agent Applications":
                begin
                    RecRef.SetTable(AgentApplications);
                    AgentApplications.Validate("Approval Status", AgentApplications."approval status"::Open);
                    AgentApplications.Modify;
                    Variant := AgentApplications;
                end;

            // M-PESA Change
            Database::"M-PESA Change Transactions":
                begin
                    RecRef.SetTable(MpesaChange);
                    MpesaChange.Validate(Status, MpesaChange.Status::Open);
                    MpesaChange.Modify;
                    Variant := MpesaChange;
                end;

            // Mortgage Release Doc
            Database::"Mortgage Loans Doc Release":
                begin
                    RecRef.SetTable(MortDoc);
                    MortDoc.Validate(Status, MortDoc.Status::Open);
                    MortDoc.Modify;
                    Variant := MortDoc;
                end;


            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;


    procedure Release(var Variant: Variant)
    var
        RecRef: RecordRef;
        PaymentsHeader: Record 52185888;
        StaffClaimsHeader: Record 52185912;
        StaffAdvanceHeader: Record 52185914;
        StaffAdvanceSurrenderHeader: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestSurrenderHeader: Record 52185885;
        StoreRequistionHeader: Record 52185868;
        InterBankTransfers: Record 52185881;
        OvertimeClaimHeader: Record 52185936;
        Budget: Record "G/L Budget Name";
        Workplan: Record 52185981;
        WorkplanActivities: Record 52185902;
        Vote: Record 52185922;
        AssetTransfer: Record 52185892;
        PaymentsHeaderBoard: Record 52185895;
        Vendor: Record Vendor;
        ctrans: Record 52185776;
        Sal: Record 52185783;
        MemberAppl: Record 52185691;
        MemberAppl2: Record 52185691;
        SAccountAppl: Record 52185704;
        EFTAppl: Record 52185715;
        SOControl: Codeunit "Mngt. Routine Processes";
        STOAppl: Record 52185717;
        StandingOrderControl: Record 52185722;
        DeactivateReactivateHeader: Record 52185753;
        DCode: Code[20];
        DocExempts: Record 52185857;
        Loans: Record 52185729;
        ProductFactoryApplication: Record 52186117;
        SecuritiesRegister: Record 52185840;
        BankersC: Record 52185793;
        BankC: Record 52185785;
        OD: Record 52185795;
        ACT: Record 52185797;
        TREAS: Record 52185778;
        INV: Record 52185807;
        CHQ: Record 52185787;
        LoanBatch: Record 52185736;
        DividendsSimulationHeader: Record 52185710;
        InterestHeader: Record 52185860;
        SavingsInterestHeader: Record 52185845;
        EndYearTransferHeader: Record 52185847;
        ATMApplications: Record 52185850;
        ATMLinkingApplications: Record 52185842;
        Checkoff: Record 52185819;
        MembClosure: Record 52185824;
        LoanRescheduling: Record 52185823;
        MemberwithdrawalNotice: Record 52185826;
        GuarantorsSubstitution: Record 52185828;
        LoanRecoveryHeader: Record 52185829;
        Bond: Record 52185835;
        BDEManagementHeader: Record 52186128;
        DelegateGroupsApplicationss: Record 52186064;
        DelegateGroupMemRetirements: Record 52186065;
        DelegatesPayment: Record 52186067;
        HRJobs: Record 52185508;
        Hrempreq: Record 52185519;
        Leave: Record 52185532;
        hrtraining: Record 52185580;
        hrtransport: Record 52185571;
        EmpTrans: Record 52185576;
        HRInternReq: Record 52185612;
        leavePlanner: Record 52185542;
        MsaccoPIN: Record 52185768;
        MsaccoApp: Record 52185757;
        PeriodicActivities: Codeunit "Periodic Activities";
        RegistrationProcess: Codeunit "Registration Process";
        TNeed: Record 52185581;
        StaffLoan: Record 52185674;
        SecuritiesCollectionRegister: Record 52185843;
        BBFRequisationHeader: Record 52186126;
        Disciplinary: Record 52186162;
        AppraisalAppeal: Record 52185596;
        DisciplinaryAppeal: Record 52185970;
        DiscWithdrawal: Record 52185971;
        LeaseDoc: Record 52186008;
        MpesaChange: Record 52185769;
        TFeed: Record 52186205;
        Intern: Record 52185611;
        PropertyDetails: Record 52186005;
        GenJournalBatch: Record "Gen. Journal Batch";
        Cases1: Record 52185957;
        contrct: Record 52185942;
        SuretyMangt: Record 52185964;
        AgentApplications: Record 52186104;
        SinkFundReportInformation: Record 52185940;
        AGMDelegatesPayment: Record 52186209;
        BankingAccountClosure: Record 52186211;
        DelegateRegionChange: Record 52186074;
        DelegateAGMUpdateHeader: Record 52186077;
        MortDoc: Record 52186089;
        Msg: Text;
        SkyMbanking: Codeunit "Sky Mbanking";
        SavAcc: Record 52185730;
        UssdCode: label '*357#';
        SalaryAgreement: Record 52186037;
        HREmployees: Record 52185650;
        PermissionRequisition: Record 52186039;
        PaymentsHeaderDelegates: Record 52185897;
        SkyVirtualMember: Record 52185499;
        ElectoralZones: Record 52186239;
        DelegateOfficials: Record 52186240;
        HRLeaveJournalLine: Record 52185544;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            Database::"HR Leave Journal Line":
                begin
                    RecRef.SetTable(HRLeaveJournalLine);
                    HRLeaveJournalLine.Validate(Status, HRLeaveJournalLine.Status::Approved);
                    HRLeaveJournalLine.Modify;
                    Variant := HRLeaveJournalLine;
                end;

            Database::"Electoral Zones":
                begin
                    RecRef.SetTable(ElectoralZones);
                    ElectoralZones.Validate(Status, ElectoralZones.Status::Approved);
                    ElectoralZones.Modify;
                    Variant := ElectoralZones;
                end;

            Database::"Delegate Officials":
                begin
                    RecRef.SetTable(DelegateOfficials);
                    DelegateOfficials.Validate(Status, DelegateOfficials.Status::Approved);
                    DelegateOfficials.Modify;
                    Variant := DelegateOfficials;
                end;


            //Sky Virtual Member
            Database::"Sky Virtual Member":
                begin
                    RecRef.SetTable(SkyVirtualMember);
                    SkyVirtualMember.Validate(Status, SkyVirtualMember.Status::Approved);
                    SkyVirtualMember.Modify;
                    Variant := SkyVirtualMember;
                end;
            //Sky Virtual Member

            Database::"SinkFund Report Information":
                begin
                    RecRef.SetTable(SinkFundReportInformation);
                    SinkFundReportInformation.Validate(Status, SinkFundReportInformation.Status::Approved);
                    SinkFundReportInformation.Modify;
                    Variant := SinkFundReportInformation;
                end;

            Database::"Delegate Region Change":
                begin
                    RecRef.SetTable(DelegateRegionChange);
                    DelegateRegionChange.Validate(Status, DelegateRegionChange.Status::Approved);
                    DelegateRegionChange.Modify;
                    Variant := DelegateRegionChange;
                end;

            Database::"Delegate AGM Update Header":
                begin
                    RecRef.SetTable(DelegateAGMUpdateHeader);
                    DelegateAGMUpdateHeader.Validate(Status, DelegateAGMUpdateHeader.Status::Approved);
                    DelegateAGMUpdateHeader.Modify;
                    Variant := DelegateAGMUpdateHeader;
                end;



            Database::"Banking Account Closure":
                begin
                    RecRef.SetTable(BankingAccountClosure);
                    BankingAccountClosure.Validate(Status, BankingAccountClosure.Status::Approved);
                    BankingAccountClosure.Modify;
                    Variant := BankingAccountClosure;
                end;

            Database::"AGM Delegates Payment":
                begin
                    RecRef.SetTable(AGMDelegatesPayment);
                    AGMDelegatesPayment.Validate(Status, AGMDelegatesPayment.Status::Approved);
                    AGMDelegatesPayment.Modify;
                    Variant := AGMDelegatesPayment;
                end;

            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentsHeader);
                    PaymentsHeader.Validate(Status, PaymentsHeader.Status::Approved);
                    PaymentsHeader.Modify;
                    Variant := PaymentsHeader;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaimsHeader);
                    StaffClaimsHeader.Validate(Status, StaffClaimsHeader.Status::Approved);
                    StaffClaimsHeader.Modify;
                    Variant := StaffClaimsHeader;
                end;
            Database::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvanceHeader);
                    StaffAdvanceHeader.Validate(Status, StaffAdvanceHeader.Status::Approved);
                    StaffAdvanceHeader.Modify;
                    Variant := StaffAdvanceHeader;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurrenderHeader);
                    StaffAdvanceSurrenderHeader.Validate(Status, StaffAdvanceSurrenderHeader.Status::Approved);
                    StaffAdvanceSurrenderHeader.Modify;
                    Variant := StaffAdvanceSurrenderHeader;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::Approved);
                    ImprestHeader.Modify;
                    Variant := ImprestHeader;
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurrenderHeader);
                    ImprestSurrenderHeader.Validate(Status, ImprestSurrenderHeader.Status::Approved);
                    ImprestSurrenderHeader.Modify;
                    Variant := ImprestSurrenderHeader;
                end;
            Database::"Store Requistion Header":
                begin
                    RecRef.SetTable(StoreRequistionHeader);
                    StoreRequistionHeader.Validate(Status, StoreRequistionHeader.Status::Released);
                    StoreRequistionHeader.Modify;
                    Variant := StoreRequistionHeader;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterBankTransfers);
                    InterBankTransfers.Validate(Status, InterBankTransfers.Status::Approved);
                    InterBankTransfers.Modify;
                    Variant := InterBankTransfers;
                end;
            Database::"Overtime Claim Header":
                begin
                    RecRef.SetTable(OvertimeClaimHeader);
                    OvertimeClaimHeader.Validate(Status, OvertimeClaimHeader.Status::Approved);
                    OvertimeClaimHeader.Modify;
                    Variant := OvertimeClaimHeader;
                end;
            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::Approved);
                    Budget.Modify;
                    Variant := Budget;
                end;
            Database::Workplan:
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::Approved);
                    Workplan.Modify;
                    Variant := Workplan;
                end;
            Database::"Vote Transfer":
                begin
                    RecRef.SetTable(Vote);
                    Vote.Validate(Status, Vote.Status::Approved);
                    Vote.Modify;
                    Variant := Vote;
                end;
            Database::"Asset Transfer":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::Approved);
                    AssetTransfer.Modify;
                    Variant := AssetTransfer;
                end;
            Database::"Payments Header Board":
                begin
                    RecRef.SetTable(PaymentsHeaderBoard);
                    PaymentsHeaderBoard.Validate(Status, PaymentsHeaderBoard.Status::Approved);
                    PaymentsHeaderBoard.Modify;
                    Variant := PaymentsHeaderBoard;
                end;

            //Delegates
            Database::"Payments Header Delegates":
                begin
                    RecRef.SetTable(PaymentsHeaderDelegates);
                    PaymentsHeaderDelegates.Validate(Status, PaymentsHeaderDelegates.Status::Approved);
                    PaymentsHeaderDelegates.Modify;
                    Variant := PaymentsHeaderDelegates;
                end;

            Database::Vendor:
                begin
                    RecRef.SetTable(Vendor);
                    Vendor.Validate(Status, Vendor.Status::Approved);
                    Vendor.Blocked := Vendor.Blocked::" ";
                    Vendor.Modify;
                    Variant := Vendor;
                end;
            //GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
            Database::"Gen. Journal Batch":
                begin
                    RecRef.SetTable(GenJournalBatch);
                    GenJournalBatch.Validate(Status, GenJournalBatch.Status::Approved);
                    GenJournalBatch.Modify;
                    Variant := GenJournalBatch;
                end;
            //Cashier Transactions
            Database::"Cashier Transactions":
                begin
                    RecRef.SetTable(ctrans);
                    ctrans.Validate(Status, ctrans.Status::Approved);
                    ctrans.Modify;
                    Variant := ctrans;
                end;
            //End Cashier Transactions
            //Property Lease
            Database::Lease:
                begin
                    RecRef.SetTable(LeaseDoc);
                    LeaseDoc.Validate(Status, LeaseDoc.Status::Approved);
                    LeaseDoc.Modify;
                    Variant := LeaseDoc;
                end;
            //End Property Lease

            //Property
            Database::"Property Details":
                begin
                    RecRef.SetTable(PropertyDetails);
                    PropertyDetails.Validate(Status, PropertyDetails.Status::Approved);
                    PropertyDetails.Modify;
                    Variant := PropertyDetails;
                end;
            //End Property

            Database::"Document Exemptions Auth.":
                begin
                    RecRef.SetTable(DocExempts);
                    DocExempts.Validate(Status, DocExempts.Status::Approved);
                    DocExempts.Modify;
                    Variant := DocExempts;
                end;

            //Salary Transactions
            Database::"Salary Header":
                begin
                    RecRef.SetTable(Sal);
                    Sal.Validate(Status, Sal.Status::Approved);
                    Sal.Modify;
                    Variant := Sal;
                end;
            //Salary Transactions

            //Bankers Cheque
            Database::"Bankers Cheque Application":
                begin
                    RecRef.SetTable(BankersC);
                    BankersC.Validate(Status, BankersC.Status::Approved);
                    BankersC.Modify;
                    Variant := BankersC;
                end;
            //Bankers Cheque

            //Bank Cheque
            Database::"Cheque Book Application":
                begin
                    RecRef.SetTable(BankC);
                    BankC.Validate(Status, BankC.Status::Approved);
                    BankC.Modify;
                    Variant := BankC;
                end;
            //Bank Cheque

            //over draft
            Database::"Over Draft Authorisation":
                begin
                    RecRef.SetTable(OD);
                    OD.Validate(Status, OD.Status::Approved);
                    OD.Modify;
                    Variant := OD;
                end;
            //over draft

            //Account Transfers
            Database::"Account Transfer Header":
                begin
                    RecRef.SetTable(ACT);
                    ACT.Validate(Status, ACT.Status::Approved);
                    ACT.Modify;
                    Variant := ACT;
                end;
            //Account Transfers

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                begin
                    RecRef.SetTable(TREAS);
                    TREAS.Validate(Status, TREAS.Status::Approved);
                    TREAS.Modify;
                    Variant := TREAS;
                end;
            //Inter Teller

            //Investment
            Database::"Investment Header":
                begin
                    RecRef.SetTable(INV);
                    INV.Validate(Status, INV.Status::Approved);
                    INV.Modify;
                    Variant := INV;
                end;
            //Investment


            //Cheque receipts
            Database::"Cheque Receipts":
                begin
                    RecRef.SetTable(CHQ);
                    CHQ.Validate(Status, CHQ.Status::Approved);
                    CHQ.Modify;
                    Variant := CHQ;
                end;
            //Cheque receipts

            //Member Application
            Database::"Member Application":
                begin
                    RecRef.SetTable(MemberAppl);
                    MemberAppl.Validate(Status, MemberAppl.Status::Approved);
                    MemberAppl.Modify;
                    Variant := MemberAppl;
                    //RegistrationProcess.MemberRegistration(MemberAppl);
                end;//
                    //Salary Agreement
            Database::"Salary Agreement":
                begin
                    RecRef.SetTable(SalaryAgreement);
                    SalaryAgreement.Validate(Status, SalaryAgreement.Status::Approved);
                    SalaryAgreement.Modify;
                    Variant := SalaryAgreement;
                end;//

            //Account Application
            Database::"Savings Account Application":
                begin
                    RecRef.SetTable(SAccountAppl);
                    SAccountAppl.Validate(Status, SAccountAppl.Status::Approved);
                    SAccountAppl.Modify;
                    Variant := SAccountAppl;
                    //RegistrationProcess.AccountRegistration(Variant);
                end;//
                    //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                begin
                    RecRef.SetTable(EFTAppl);
                    EFTAppl.Validate(Status, EFTAppl.Status::Approved);
                    EFTAppl.Modify;
                    Variant := EFTAppl;
                end;//
                    //Standing Order Application
            Database::"Standing Order Header":
                begin
                    RecRef.SetTable(STOAppl);
                    STOAppl.Validate(Status, STOAppl.Status::Approved);
                    STOAppl.Modify;
                    Variant := STOAppl;
                end;//
                    //Standing Order Control Application
            Database::"Standing Order Control":
                begin
                    RecRef.SetTable(StandingOrderControl);
                    StandingOrderControl.Validate(Status, StandingOrderControl.Status::Approved);
                    StandingOrderControl.Modify;
                    Variant := StandingOrderControl;
                    if STOAppl.Get(StandingOrderControl."Standing Order No") then begin
                        //SOControl.SOControl(Variant);
                    end;
                end;//
                    //Dividend Rate Application
            Database::"Dividend Simulation Header":
                begin
                    RecRef.SetTable(DividendsSimulationHeader);
                    DividendsSimulationHeader.Validate(Status, DividendsSimulationHeader.Status::Approved);
                    DividendsSimulationHeader.Modify;
                    Variant := DividendsSimulationHeader;
                end;//
                    //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                begin
                    RecRef.SetTable(DeactivateReactivateHeader);
                    DeactivateReactivateHeader.Validate(Status, DeactivateReactivateHeader.Status::Processed);
                    DeactivateReactivateHeader.Modify;
                    Variant := DeactivateReactivateHeader;
                    //RegistrationProcess.DeactivateReactive(Variant);
                end;//
                    //Product Factory Application
            Database::"Product Factory Application":
                begin
                    RecRef.SetTable(ProductFactoryApplication);
                    ProductFactoryApplication.Validate(Status, ProductFactoryApplication.Status::Converted);
                    ProductFactoryApplication.Modify;
                    Variant := ProductFactoryApplication;
                    //RegistrationProcess.CreateProduct(Variant);
                end;//
                    //Loans
            Database::Loans:
                begin
                    RecRef.SetTable(Loans);
                    Loans.Validate(Status, Loans.Status::Approved);
                    Loans."Approval Date" := Today;
                    Loans."Approved By" := UserId;
                    Loans.Modify;
                    Variant := Loans;
                end;//
                    //Collateral
            Database::"Securities Register":
                begin
                    RecRef.SetTable(SecuritiesRegister);
                    SecuritiesRegister.Validate(Status, SecuritiesRegister.Status::Approved);
                    SecuritiesRegister."Collateral Perfected" := true;
                    SecuritiesRegister."Inward/Outward" := SecuritiesRegister."inward/outward"::"In-Store";
                    SecuritiesRegister.Modify;
                    Variant := SecuritiesRegister;
                end;//

            //Permission Requistion
            Database::"Permission Requisition":
                begin
                    RecRef.SetTable(PermissionRequisition);
                    PermissionRequisition.Validate(Status, PermissionRequisition.Status::Approved);
                    PermissionRequisition.Modify;
                    Variant := PermissionRequisition;
                end;

            //SecuritiesCollectionRegister
            Database::"Securities Collection Register":
                begin
                    RecRef.SetTable(SecuritiesCollectionRegister);
                    SecuritiesCollectionRegister.Validate(Status, SecuritiesCollectionRegister.Status::Approved);
                    SecuritiesCollectionRegister."Inward/Outward" := SecuritiesCollectionRegister."inward/outward"::Returned;
                    if SecuritiesRegister.Get(SecuritiesCollectionRegister."Collateral Register No.") then begin
                        //MESSAGE(FORMAT(SecuritiesCollectionRegister."Collateral Register No."));
                        SecuritiesRegister."Inward/Outward" := SecuritiesRegister."inward/outward"::Returned;
                        SecuritiesRegister.Modify;
                    end;
                    SecuritiesCollectionRegister.Modify;
                    Variant := SecuritiesRegister;
                end;
            //Loan posting
            Database::"Loan Disbursement Header":
                begin
                    RecRef.SetTable(LoanBatch);
                    LoanBatch.Validate(Status, LoanBatch.Status::Approved);
                    LoanBatch.Modify;
                    Variant := LoanBatch;
                end;
            //Interest Billing
            Database::"Interest Header":
                begin
                    RecRef.SetTable(InterestHeader);
                    InterestHeader.Validate(Status, InterestHeader.Status::Approved);
                    InterestHeader.Modify;
                    Variant := InterestHeader;
                end;//

            //Savings Interest Header
            Database::"Savings Interest Header":
                begin
                    RecRef.SetTable(SavingsInterestHeader);
                    SavingsInterestHeader.Validate(Status, SavingsInterestHeader.Status::Approved);
                    SavingsInterestHeader.Modify;
                    Variant := SavingsInterestHeader;
                end;//
                    //End Year Transfer Header
            Database::"End Year Transfer Header":
                begin
                    RecRef.SetTable(EndYearTransferHeader);
                    EndYearTransferHeader.Validate(Status, EndYearTransferHeader.Status::Approved);
                    EndYearTransferHeader.Modify;
                    Variant := EndYearTransferHeader;
                end;//


            //ATM Applications
            Database::"ATM Applications":
                begin
                    RecRef.SetTable(ATMApplications);
                    ATMApplications.Validate(Status, ATMApplications.Status::Approved);
                    ATMApplications.Modify;
                    ATMApplications."Approval Date" := Today;
                    ATMApplications."Approved  By" := UserId;
                    Variant := ATMApplications;
                end;//
                    //ATM Linking Applications
            Database::"ATM Linking Applications":
                begin
                    RecRef.SetTable(ATMLinkingApplications);
                    ATMLinkingApplications.Validate(Status, ATMLinkingApplications.Status::Approved);
                    ATMLinkingApplications.Modify;
                    ATMLinkingApplications."Approval Date" := Today;
                    ATMLinkingApplications."Approved  By" := UserId;
                    Variant := ATMLinkingApplications;
                end;//
                    //Checkoff
            Database::"Checkoff Header":
                begin
                    RecRef.SetTable(Checkoff);
                    Checkoff.Validate(Status, Checkoff.Status::Approved);
                    Checkoff.Modify;
                    Variant := Checkoff;
                end;//

            //Membership Closure
            Database::"Membership closure":
                begin
                    RecRef.SetTable(MembClosure);
                    MembClosure.Validate(Status, MembClosure.Status::Approved);
                    MembClosure.Modify;
                    Variant := MembClosure;
                end;//

            //Loan Rescheduling
            Database::"Loan Rescheduling":
                begin
                    RecRef.SetTable(LoanRescheduling);
                    LoanRescheduling.Validate(Status, LoanRescheduling.Status::Approved);
                    LoanRescheduling.Modify;
                    Variant := LoanRescheduling;
                end;//

            //HR Employees
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmployees);
                    HREmployees.Validate(Status, HREmployees.Status::Active);
                    HREmployees.Modify;
                    Variant := HREmployees;
                end;//

            //Member Withdrawal
            Database::"Member withdrawal Notice":
                begin
                    RecRef.SetTable(MemberwithdrawalNotice);
                    MemberwithdrawalNotice.Validate(Status, MemberwithdrawalNotice.Status::Approved);
                    MemberwithdrawalNotice.Modify;
                    Variant := MemberwithdrawalNotice;
                    // PeriodicActivities.SendNotcieSMS(MemberwithdrawalNotice."Member No.", MemberwithdrawalNotice."No.");
                    // MemberwithdrawalNotice.StopAdvice(Variant)
                end;
            //

            //Gurantor Substitution
            Database::"Guarantors Substitution":
                begin
                    RecRef.SetTable(GuarantorsSubstitution);
                    GuarantorsSubstitution.Validate(Status, GuarantorsSubstitution.Status::Approved);
                    GuarantorsSubstitution.Modify;
                    Variant := GuarantorsSubstitution;
                end;
            //

            //Loan Recovery
            Database::"Loan Recovery Header":
                begin
                    RecRef.SetTable(LoanRecoveryHeader);
                    LoanRecoveryHeader.Validate(Status, LoanRecoveryHeader.Status::Approved);
                    LoanRecoveryHeader.Modify;
                    Variant := LoanRecoveryHeader;
                end;
            //

            //Bond
            Database::Bond:
                begin
                    RecRef.SetTable(Bond);
                    Bond.Validate("Bond Status", Bond."bond status"::Approved);
                    Bond.Modify;
                    Variant := Bond;
                end;
            //

            //Sink Fund
            Database::"BBF Requisation Header":
                begin
                    RecRef.SetTable(BBFRequisationHeader);
                    BBFRequisationHeader.Validate(Status, BBFRequisationHeader.Status::Approved);
                    BBFRequisationHeader.Modify;
                    Variant := BBFRequisationHeader;
                end;

            //BDE Management
            Database::"BDE Management Header":
                begin
                    RecRef.SetTable(BDEManagementHeader);
                    BDEManagementHeader.Validate(Status, BDEManagementHeader.Status::Approved);
                    BDEManagementHeader.Modify;
                    Variant := BDEManagementHeader;
                end;
            //

            //Delegate Groups Applicationss
            Database::"Delegate Region Applicationss":
                begin
                    RecRef.SetTable(DelegateGroupsApplicationss);
                    DelegateGroupsApplicationss.Validate(Status, DelegateGroupsApplicationss.Status::Approved);
                    DelegateGroupsApplicationss."Approval Date" := Today;
                    DelegateGroupsApplicationss."Approved By" := UserId;
                    DelegateGroupsApplicationss.Modify;
                    Variant := DelegateGroupsApplicationss;
                end;
            //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                begin
                    RecRef.SetTable(DelegateGroupMemRetirements);
                    DelegateGroupMemRetirements.Validate(Status, DelegateGroupMemRetirements.Status::Approved);
                    DelegateGroupMemRetirements.Modify;
                    Variant := DelegateGroupMemRetirements;
                end;
            //Delegates Payment
            Database::"Delegates Payment":
                begin
                    RecRef.SetTable(DelegatesPayment);
                    DelegatesPayment.Validate(Status, DelegatesPayment.Status::Approved);
                    DelegatesPayment."Approval Date" := Today;
                    DelegatesPayment.Modify;
                    Variant := DelegatesPayment;
                end;

            //Jobs
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::Approved);
                    HRJobs.Modify;
                    Variant := HRJobs;
                end;
            //HR Jobs


            //HR leave Planner
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(leavePlanner);
                    leavePlanner.Validate(Status, leavePlanner.Status::Approved);
                    leavePlanner.Modify;
                    Variant := leavePlanner;
                end;
            //HR Intern Requisition
            Database::"HR Interns Requisition":
                begin
                    RecRef.SetTable(HRInternReq);
                    HRInternReq.Validate(Status, HRInternReq.Status::Approved);
                    HRInternReq.Modify;
                    Variant := HRInternReq;
                end;
            //HR Intern Requisition

            //Employee Requisition
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Validate("Approval Status", Hrempreq."approval status"::Approved);
                    Hrempreq.Modify;
                    Variant := Hrempreq;
                end;

            //Leave
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(Leave);
                    Leave.Validate(Status, Leave.Status::Approved);
                    Leave.Modify;
                    // Leave.CreateLeaveLedgerEntries;
                    // Leave.ModifyUserDate;
                    Variant := Leave;
                end;


            //HR Training Feedback
            Database::"HR Training Feedback Form":
                begin
                    RecRef.SetTable(TFeed);
                    TFeed.Validate(Status, TFeed.Status::Approved);
                    TFeed.Modify;
                    //Leave.CreateLeaveLedgerEntries;
                    Variant := TFeed;
                end;

            //Interns
            Database::"HR Interns":
                begin
                    RecRef.SetTable(Intern);
                    Intern.Validate("Posting Status", Intern."posting status"::Approved);
                    Intern.Modify;
                    // Intern.CreateLeaveLedgerEntries;
                    Variant := Intern;
                end;

            //Appraisal Appeal
            Database::"HR Appraissal Appeal":
                begin
                    RecRef.SetTable(AppraisalAppeal);
                    AppraisalAppeal.Validate(Status, AppraisalAppeal.Status::Approved);
                    AppraisalAppeal.Modify;
                    Variant := AppraisalAppeal;
                end;

            //Disciplinary Appeal
            Database::"HRDisciplinary Appeal":
                begin
                    RecRef.SetTable(DisciplinaryAppeal);
                    DisciplinaryAppeal.Validate(Status, DisciplinaryAppeal.Status::Approved);
                    DisciplinaryAppeal.Modify;
                    Variant := DisciplinaryAppeal;
                end;

            //Disciplinary Withdrawal
            Database::"HRDisciplinary Case Withdrawal":
                begin
                    RecRef.SetTable(DiscWithdrawal);
                    DiscWithdrawal.Validate(Status, DiscWithdrawal.Status::Approved);
                    DiscWithdrawal.Modify;
                    Variant := DiscWithdrawal;
                end;



            //Disciplinary
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.SetTable(Disciplinary);
                    Disciplinary.Validate(Status, Disciplinary.Status::Approved);
                    Disciplinary.Modify;
                    Variant := Disciplinary;
                end;


            //Training
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(hrtraining);
                    hrtraining.Validate(Status, hrtraining.Status::Approved);
                    hrtraining.Modify;
                    Variant := hrtraining;
                end;

            //Training
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(TNeed);
                    TNeed.Validate(Status, TNeed.Status::Approved);
                    TNeed.Modify;
                    Variant := TNeed;
                end;
            //Hr Transport hrtransport
            Database::"HR Transport Requisition Head":
                begin
                    RecRef.SetTable(hrtransport);
                    hrtransport.Validate(Status, hrtransport.Status::Approved);
                    hrtransport.Modify;
                    Variant := hrtransport;
                end;

            //Hr Emplpoyee Transfer EmpTrans
            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::Approved);
                    EmpTrans.Modify;
                    Variant := EmpTrans;
                end;

            //Staff Loan
            Database::"prSalary Advance":
                begin
                    RecRef.SetTable(StaffLoan);
                    StaffLoan.Validate(Status, StaffLoan.Status::Approved);
                    StaffLoan.Modify;
                    Variant := StaffLoan;
                end;
            //end HR

            // MSACCO

            //M-SACCO PIN
            Database::"M-SACCO Change PIN No":
                begin
                    RecRef.SetTable(MsaccoPIN);
                    MsaccoPIN.Validate(Status, MsaccoPIN.Status::Approved);
                    MsaccoPIN.Modify;

                    Auth.Reset;
                    Auth.SetRange("Mobile No.", MsaccoPIN."MPESA Mobile No");
                    if Auth.FindFirst then begin
                        SavAcc.Get(Auth."Account No.");
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"Activate Mbanking" then begin
                            Auth.Validate("User Status", Auth."user status"::Active);
                            Msg := 'Dear ' + SavAcc.Name + ', your request for MCASH activation has been completed.';
                            SkyMbanking.SendSms(Source::MBANKING, Auth."Mobile No.", Msg, SavAcc."No.", '', true, 202, false);


                        end;
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"Clear MBanking Suspension" then begin

                            Auth."Login Attempts Action" := 'NONE';
                            Auth."Login Attempts Tag" := '';
                            Clear(Auth."Login Attempts Action Expiry");
                            Auth."Login Attempts Count" := 0;
                            Auth."OTP Attempts Action" := 'NONE';
                            Auth."OTP Attempts Tag" := '';
                            Clear(Auth."OTP Attempts Action Expiry");
                            Auth."OTP Attempts Count" := 0;
                            Auth."Clear M-Banking Suspension" := false;

                            Msg := 'Dear ' + SavAcc.Name + ', your request for MCASH access after phone suspension has been completed';
                            SkyMbanking.SendSms(Source::MBANKING, Auth."Mobile No.", Msg, SavAcc."No.", '', true, 202, false);

                        end;
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"Deactivate Mbanking" then begin
                            Auth.Validate("User Status", Auth."user status"::Inactive);
                            Msg := 'Dear ' + SavAcc.Name + ', your request for MCASH deactivation has been completed.';
                            SkyMbanking.SendSms(Source::MBANKING, Auth."Mobile No.", Msg, SavAcc."No.", '', true, 202, false);
                        end;
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"IMEI Reset" then begin
                            Auth.Validate(IMEI, '');

                            Msg := 'Dear ' + SavAcc.Name + ', your request for MCASH access after handset change has been completed';
                            SkyMbanking.SendSms(Source::MBANKING, Auth."Mobile No.", Msg, SavAcc."No.", '', true, 202, false);
                        end;
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"IMSI Reset" then begin
                            Auth.Validate(IMSI, '');

                            Msg := 'Dear ' + SavAcc.Name + ', your request for MCASH access after sim change has been completed';
                            SkyMbanking.SendSms(Source::MBANKING, Auth."Mobile No.", Msg, SavAcc."No.", '', true, 202, false);
                        end;
                        if MsaccoPIN."Type of Change" = MsaccoPIN."type of change"::"PIN Reset" then begin
                            Auth.Validate("Reset PIN", true);
                        end;
                        Auth.Modify;
                    end;
                end;


            //Legal
            Database::Legal:
                begin
                    RecRef.SetTable(Cases1);
                    Cases1.Validate(Status, Cases1.Status::Approved);
                    Cases1.Modify;
                    Variant := Cases1;
                end;

            //Legal
            Database::"Surety Management":
                begin
                    RecRef.SetTable(SuretyMangt);
                    SuretyMangt.Validate(Status, SuretyMangt.Status::Approved);
                    SuretyMangt.Modify;
                    Variant := SuretyMangt;
                end;

            //M-SACCO Applications
            Database::"M-SACCO Applications":
                begin
                    RecRef.SetTable(MsaccoApp);
                    MsaccoApp.Validate(Status, MsaccoApp.Status::Approved);
                    MsaccoApp.Modify;
                    Variant := MsaccoApp;
                end;

            // Agent applications
            Database::"Agent Applications":
                begin
                    RecRef.SetTable(AgentApplications);
                    AgentApplications.Validate("Approval Status", AgentApplications."approval status"::Approved);
                    AgentApplications.Modify;
                    Variant := AgentApplications;
                end;

            //Contract
            Database::Contracts:
                begin
                    RecRef.SetTable(contrct);
                    contrct.Validate(Status, contrct.Status::Approved);
                    contrct.Modify;
                    Variant := contrct;
                end;


            //M-SACCO Change Transactions"
            Database::"M-PESA Change Transactions":
                begin
                    RecRef.SetTable(MpesaChange);
                    MpesaChange.Validate(Status, MpesaChange.Status::Approved);
                    MpesaChange.Modify;
                    Variant := MpesaChange;
                end;

            //Mortgage Doc Release"
            Database::"Mortgage Loans Doc Release":
                begin
                    RecRef.SetTable(MortDoc);
                    MortDoc.Validate(Status, MortDoc.Status::Approved);
                    MortDoc.Modify;
                    Variant := MortDoc;
                    // MortDoc.ReleaseDocument(MortDoc."Loan No.");
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end
    end;


    procedure SetStatusToPending(var Variant: Variant)
    var
        RecRef: RecordRef;
        PaymentsHeader: Record 52185888;
        StaffClaimsHeader: Record 52185912;
        StaffAdvanceHeader: Record 52185914;
        StaffAdvanceSurrenderHeader: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestSurrenderHeader: Record 52185885;
        StoreRequistionHeader: Record 52185868;
        InterBankTransfers: Record 52185881;
        OvertimeClaimHeader: Record 52185936;
        Budget: Record "G/L Budget Name";
        Workplan: Record 52185981;
        WorkplanActivities: Record 52185902;
        Vote: Record 52185922;
        AssetTransfer: Record 52185892;
        PaymentsHeaderBoard: Record 52185895;
        Vendor: Record Vendor;
        ctrans: Record 52185776;
        Sal: Record 52185783;
        MemberAppl: Record 52185691;
        SAccountAppl: Record 52185704;
        EFTAppl: Record 52185715;
        STOAppl: Record 52185717;
        StandingOrderControl: Record 52185722;
        DeactivateReactivateHeader: Record 52185753;
        DocExempts: Record 52185857;
        Loans: Record 52185729;
        ProductFactoryApplication: Record 52186117;
        SecuritiesRegister: Record 52185840;
        BankersC: Record 52185793;
        BankC: Record 52185785;
        OD: Record 52185795;
        ACT: Record 52185797;
        TREAS: Record 52185778;
        INV: Record 52185807;
        CHQ: Record 52185787;
        LoanBatch: Record 52185736;
        DividendsSimulationHeader: Record 52185710;
        InterestHeader: Record 52185860;
        SavingsInterestHeader: Record 52185845;
        EndYearTransferHeader: Record 52185847;
        ATMApplications: Record 52185850;
        ATMLinkingApplications: Record 52185842;
        Checkoff: Record 52185819;
        MembClosure: Record 52185824;
        LoanRescheduling: Record 52185823;
        MemberwithdrawalNotice: Record 52185826;
        GuarantorsSubstitution: Record 52185828;
        LoanRecoveryHeader: Record 52185829;
        Bond: Record 52185835;
        BDEManagementHeader: Record 52186128;
        DelegateGroupsApplicationss: Record 52186064;
        DelegateGroupMemRetirements: Record 52186065;
        DelegatesPayment: Record 52186067;
        HRJobs: Record 52185508;
        Hrempreq: Record 52185519;
        Leave: Record 52185532;
        hrtraining: Record 52185580;
        hrtransport: Record 52185571;
        EmpTrans: Record 52185576;
        HRInternReq: Record 52185612;
        leavePlanner: Record 52185542;
        MsaccoPIN: Record 52185768;
        MsaccoApp: Record 52185757;
        StaffLoan: Record 52185674;
        TNeed: Record 52185581;
        SecuritiesCollectionRegister: Record 52185843;
        BBFRequisationHeader: Record 52186126;
        Disciplinary: Record 52186162;
        AppraisalAppeal: Record 52185596;
        DisciplinaryAppeal: Record 52185970;
        DiscWithdrawal: Record 52185971;
        LeaseDoc: Record 52186008;
        MpesaChange: Record 52185769;
        TFeed: Record 52186205;
        Intern: Record 52185611;
        PropertyDetails: Record 52186005;
        Cases1: Record 52185957;
        contrct: Record 52185942;
        SuretyMangt: Record 52185964;
        AgentApplications: Record 52186104;
        SinkFundReportInformation: Record 52185940;
        AGMDelegatesPayment: Record 52186209;
        BankingAccountClosure: Record 52186211;
        DelegateRegionChange: Record 52186074;
        DelegateAGMUpdateHeader: Record 52186077;
        MortDoc: Record 52186089;
        SalaryAgreement: Record 52186037;
        HREmployees: Record 52185650;
        PermissionRequisition: Record 52186039;
        PaymentsHeaderDelegates: Record 52185897;
        SkyVirtualMember: Record 52185499;
        ElectoralZones: Record 52186239;
        DelegateOfficials: Record 52186240;
        Hrleave: Record 52185544;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of

            Database::"Electoral Zones":
                begin
                    RecRef.SetTable(ElectoralZones);
                    ElectoralZones.Validate(Status, ElectoralZones.Status::Pending);
                    ElectoralZones.Modify;
                    Variant := ElectoralZones;
                end;
            //hr leave
            Database::"HR Leave Journal Line":
                begin
                    RecRef.SetTable(Hrleave);
                    Hrleave.Validate(Status, Hrleave.Status::"Pending Approval");
                    Hrleave.Modify;
                    Variant := Hrleave;
                end;

            Database::"Delegate Officials":
                begin
                    RecRef.SetTable(DelegateOfficials);
                    DelegateOfficials.Validate(Status, DelegateOfficials.Status::Pending);
                    DelegateOfficials.Modify;
                    Variant := DelegateOfficials;
                end;

            //Sky Virtual Member
            Database::"Sky Virtual Member":
                begin
                    RecRef.SetTable(SkyVirtualMember);
                    SkyVirtualMember.Validate(Status, SkyVirtualMember.Status::Pending);
                    SkyVirtualMember.Modify;
                    Variant := SkyVirtualMember;
                end;
            //Sky Virtual Member

            Database::"SinkFund Report Information":
                begin
                    RecRef.SetTable(SinkFundReportInformation);
                    SinkFundReportInformation.Validate(Status, SinkFundReportInformation.Status::Pending);
                    SinkFundReportInformation.Modify;
                    Variant := SinkFundReportInformation;
                end;


            Database::"Delegate Region Change":
                begin
                    RecRef.SetTable(DelegateRegionChange);
                    DelegateRegionChange.Validate(Status, DelegateRegionChange.Status::Pending);
                    DelegateRegionChange.Modify;
                    Variant := DelegateRegionChange;
                end;



            Database::"Delegate AGM Update Header":
                begin
                    RecRef.SetTable(DelegateAGMUpdateHeader);
                    DelegateAGMUpdateHeader.Validate(Status, DelegateAGMUpdateHeader.Status::Pending);
                    DelegateAGMUpdateHeader.Modify;
                    Variant := DelegateAGMUpdateHeader;
                end;




            Database::"Banking Account Closure":
                begin
                    RecRef.SetTable(BankingAccountClosure);
                    BankingAccountClosure.Validate(Status, BankingAccountClosure.Status::Pending);
                    BankingAccountClosure.Modify;
                    Variant := BankingAccountClosure;
                end;


            Database::"AGM Delegates Payment":
                begin
                    RecRef.SetTable(AGMDelegatesPayment);
                    AGMDelegatesPayment.Validate(Status, AGMDelegatesPayment.Status::Pending);
                    AGMDelegatesPayment.Modify;
                    Variant := AGMDelegatesPayment;
                end;



            Database::"Payments Header":
                begin
                    RecRef.SetTable(PaymentsHeader);
                    PaymentsHeader.Validate(Status, PaymentsHeader.Status::"Pending Approval");
                    PaymentsHeader.Modify;
                    Variant := PaymentsHeader;
                end;
            Database::"Staff Claims Header":
                begin
                    RecRef.SetTable(StaffClaimsHeader);
                    StaffClaimsHeader.Validate(Status, StaffClaimsHeader.Status::"Pending Approval");
                    StaffClaimsHeader.Modify;
                    Variant := StaffClaimsHeader;
                end;
            Database::"Staff Advance Header":
                begin
                    RecRef.SetTable(StaffAdvanceHeader);
                    StaffAdvanceHeader.Validate(Status, StaffAdvanceHeader.Status::"Pending Approval");
                    StaffAdvanceHeader.Modify;
                    Variant := StaffAdvanceHeader;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    RecRef.SetTable(StaffAdvanceSurrenderHeader);
                    StaffAdvanceSurrenderHeader.Validate(Status, StaffAdvanceSurrenderHeader.Status::"Pending Approval");
                    StaffAdvanceSurrenderHeader.Modify;
                    Variant := StaffAdvanceSurrenderHeader;
                end;
            Database::"Imprest Header":
                begin
                    RecRef.SetTable(ImprestHeader);
                    ImprestHeader.Validate(Status, ImprestHeader.Status::"Pending Approval");
                    ImprestHeader.Modify;
                    Variant := ImprestHeader;
                end;
            Database::"Imprest Surrender Header":
                begin
                    RecRef.SetTable(ImprestSurrenderHeader);
                    ImprestSurrenderHeader.Validate(Status, ImprestSurrenderHeader.Status::"Pending Approval");
                    ImprestSurrenderHeader.Modify;
                    Variant := ImprestSurrenderHeader;
                end;
            Database::"Store Requistion Header":
                begin
                    RecRef.SetTable(StoreRequistionHeader);
                    StoreRequistionHeader.Validate(Status, StoreRequistionHeader.Status::"Pending Approval");
                    StoreRequistionHeader.Modify;
                    Variant := StoreRequistionHeader;
                end;
            Database::"InterBank Transfers":
                begin
                    RecRef.SetTable(InterBankTransfers);
                    InterBankTransfers.Validate(Status, InterBankTransfers.Status::"Pending Approval");
                    InterBankTransfers.Modify;
                    Variant := InterBankTransfers;
                end;
            Database::"Overtime Claim Header":
                begin
                    RecRef.SetTable(OvertimeClaimHeader);
                    OvertimeClaimHeader.Validate(Status, OvertimeClaimHeader.Status::"Pending Approval");
                    OvertimeClaimHeader.Modify;
                    Variant := OvertimeClaimHeader;
                end;
            Database::"G/L Budget Name":
                begin
                    RecRef.SetTable(Budget);
                    Budget.Validate(Status, Budget.Status::"Pending Approval");
                    Budget.Modify;
                    Variant := Budget;
                end;
            Database::Workplan:
                begin
                    RecRef.SetTable(Workplan);
                    Workplan.Validate(Status, Workplan.Status::"Pending Approval");
                    Workplan.Modify;
                    Variant := Workplan;
                end;
            Database::"Vote Transfer":
                begin
                    RecRef.SetTable(Vote);
                    Vote.Validate(Status, Vote.Status::"Pending Approval");
                    Vote.Modify;
                    Variant := Vote;
                end;
            Database::"Asset Transfer":
                begin
                    RecRef.SetTable(AssetTransfer);
                    AssetTransfer.Validate(Status, AssetTransfer.Status::"Pending Approval");
                    AssetTransfer.Modify;
                    Variant := AssetTransfer;
                end;
            Database::"Payments Header Board":
                begin
                    RecRef.SetTable(PaymentsHeaderBoard);
                    PaymentsHeaderBoard.Validate(Status, PaymentsHeaderBoard.Status::"Pending Approval");
                    PaymentsHeaderBoard.Modify;
                    Variant := PaymentsHeaderBoard;
                end;
            //Delegates
            Database::"Payments Header Delegates":
                begin
                    RecRef.SetTable(PaymentsHeaderDelegates);
                    PaymentsHeaderDelegates.Validate(Status, PaymentsHeaderDelegates.Status::"Pending Approval");
                    PaymentsHeaderDelegates.Modify;
                    Variant := PaymentsHeaderDelegates;
                end;

            Database::Vendor:
                begin
                    RecRef.SetTable(Vendor);
                    Vendor.Validate(Status, Vendor.Status::"Pending Approval");
                    Vendor.Modify;
                    Variant := Vendor;
                end;

            //Cashier Transactions
            Database::"Cashier Transactions":
                begin
                    RecRef.SetTable(ctrans);
                    ctrans.Validate(Status, ctrans.Status::"Pending Approval");
                    ctrans.Modify;
                    Variant := ctrans;
                end;
            //Cashier Transactions
            //Property Lease
            Database::Lease:
                begin
                    RecRef.SetTable(LeaseDoc);
                    LeaseDoc.Validate(Status, LeaseDoc.Status::"Pending Approval");
                    LeaseDoc.Modify;
                    Variant := LeaseDoc;
                end;
            //Property Lease

            //Property
            Database::"Property Details":
                begin
                    RecRef.SetTable(PropertyDetails);
                    PropertyDetails.Validate(Status, PropertyDetails.Status::"Pending Approval");
                    PropertyDetails.Modify;
                    Variant := PropertyDetails;
                end;
            //Property

            Database::"Document Exemptions Auth.":
                begin
                    RecRef.SetTable(DocExempts);
                    DocExempts.Validate(Status, DocExempts.Status::"Pending Approval");
                    DocExempts.Modify;
                    Variant := DocExempts;
                end;

            //Salary Transactions
            Database::"Salary Header":
                begin
                    RecRef.SetTable(Sal);
                    Sal.Validate(Status, Sal.Status::Pending);
                    Sal.Modify;
                    Variant := Sal;
                end;
            //Salary Transactions

            //Bankers Cheque
            Database::"Bankers Cheque Application":
                begin
                    RecRef.SetTable(BankersC);
                    BankersC.Validate(Status, BankersC.Status::"Pending Approval");
                    BankersC.Modify;
                    Variant := BankersC;
                end;
            //Bankers Cheque

            //Bank Cheque
            Database::"Cheque Book Application":
                begin
                    RecRef.SetTable(BankC);
                    BankC.Validate(Status, BankC.Status::"Pending Approval");
                    BankC.Modify;
                    Variant := BankC;
                end;
            //Bank Cheque

            //Over Draft
            Database::"Over Draft Authorisation":
                begin
                    RecRef.SetTable(OD);
                    OD.Validate(Status, OD.Status::Pending);
                    OD.Modify;
                    Variant := OD;
                end;
            //Over Draft

            //Account Transfers
            Database::"Account Transfer Header":
                begin
                    RecRef.SetTable(ACT);
                    ACT.Validate(Status, ACT.Status::"Pending Approval");
                    ACT.Modify;
                    Variant := ACT;
                end;
            //Account Trasnfers

            //Inter Teller
            Database::"Treasury Cashier Transactions":
                begin
                    RecRef.SetTable(TREAS);
                    TREAS.Validate(Status, TREAS.Status::Pending);
                    TREAS.Modify;
                    Variant := TREAS;
                end;
            //Inter teller

            //Investment
            Database::"Investment Header":
                begin
                    RecRef.SetTable(INV);
                    INV.Validate(Status, INV.Status::"Pending Approval");
                    INV.Modify;
                    Variant := INV;
                end;
            //Investment


            //Cheque Receipts
            Database::"Cheque Receipts":
                begin
                    RecRef.SetTable(CHQ);
                    CHQ.Validate(Status, INV.Status::"Pending Approval");
                    CHQ.Modify;
                    Variant := CHQ;
                end;
            //Cheque Receipts

            //Permission Requistion
            Database::"Permission Requisition":
                begin
                    RecRef.SetTable(PermissionRequisition);
                    PermissionRequisition.Validate(Status, PermissionRequisition.Status::"Pending Approval");
                    PermissionRequisition.Modify;
                    Variant := PermissionRequisition;
                end;

            //Member Application
            Database::"Member Application":
                begin
                    RecRef.SetTable(MemberAppl);
                    MemberAppl.Validate(Status, MemberAppl.Status::Pending);
                    MemberAppl."Created By" := UserId;
                    MemberAppl."Application Date" := Today;
                    MemberAppl.Modify;
                    Variant := MemberAppl;
                end;//
                    //Salary Agreement
            Database::"Salary Agreement":
                begin
                    RecRef.SetTable(SalaryAgreement);
                    SalaryAgreement.Validate(Status, SalaryAgreement.Status::"Pending Approval");
                    SalaryAgreement.Modify;
                    Variant := SalaryAgreement;
                end;//
                    //Account Application
            Database::"Savings Account Application":
                begin
                    RecRef.SetTable(SAccountAppl);
                    SAccountAppl.Validate(Status, SAccountAppl.Status::Pending);
                    SAccountAppl.Modify;
                    Variant := SAccountAppl;
                end;//
                    //Electronic Fund Transfer Application
            Database::"EFT Transfer Header":
                begin
                    RecRef.SetTable(EFTAppl);
                    EFTAppl.Validate(Status, EFTAppl.Status::Pending);
                    EFTAppl.Modify;
                    Variant := EFTAppl;
                end;//
                    //Standing Order Application
            Database::"Standing Order Header":
                begin
                    RecRef.SetTable(STOAppl);
                    STOAppl.Validate(Status, STOAppl.Status::Pending);
                    STOAppl.Modify;
                    Variant := STOAppl;
                end;//
                    //Standing Order Control Application
            Database::"Standing Order Control":
                begin
                    RecRef.SetTable(StandingOrderControl);
                    StandingOrderControl.Validate(Status, StandingOrderControl.Status::Pending);
                    StandingOrderControl.Modify;
                    Variant := StandingOrderControl;
                end;//
                    //Dividend Rate Application
            Database::"Dividend Simulation Header":
                begin
                    RecRef.SetTable(DividendsSimulationHeader);
                    DividendsSimulationHeader.Validate(Status, DividendsSimulationHeader.Status::Pending);
                    DividendsSimulationHeader.Modify;
                    Variant := DividendsSimulationHeader;
                end;//
                    //Account/Member deactivation or reactivation
            Database::"Reactivate/Deactivate Header":
                begin
                    RecRef.SetTable(DeactivateReactivateHeader);
                    DeactivateReactivateHeader.Validate(Status, DeactivateReactivateHeader.Status::Pending);
                    DeactivateReactivateHeader.Modify;
                    Variant := DeactivateReactivateHeader;
                end;//
                    //Loans
            Database::Loans:
                begin
                    RecRef.SetTable(Loans);
                    Loans.Validate(Status, Loans.Status::Pending);
                    Loans."Loan Appraised By" := UserId;
                    Loans.Modify;
                    Variant := Loans;
                end;//
                    //Collateral
            Database::"Securities Register":
                begin
                    RecRef.SetTable(SecuritiesRegister);
                    SecuritiesRegister.Validate(Status, SecuritiesRegister.Status::Pending);
                    SecuritiesRegister.Modify;
                    Variant := SecuritiesRegister;
                end;//

            //Collateral return
            //Collateral
            Database::"Securities Collection Register":
                begin
                    RecRef.SetTable(SecuritiesCollectionRegister);
                    SecuritiesCollectionRegister.Validate(Status, SecuritiesCollectionRegister.Status::Pending);
                    SecuritiesCollectionRegister.Modify;
                    Variant := SecuritiesCollectionRegister;
                end;//
            Database::"Loan Disbursement Header":
                begin
                    RecRef.SetTable(LoanBatch);
                    LoanBatch.Validate(Status, LoanBatch.Status::Pending);
                    LoanBatch.Modify;
                    Variant := LoanBatch;
                end;
            //Interest Billing
            Database::"Interest Header":
                begin
                    RecRef.SetTable(InterestHeader);
                    InterestHeader.Validate(Status, InterestHeader.Status::"Pending Approval");
                    InterestHeader.Modify;
                    Variant := InterestHeader;
                end;//
                    //SavingsInterestHeader
            Database::"Savings Interest Header":
                begin
                    RecRef.SetTable(SavingsInterestHeader);
                    SavingsInterestHeader.Validate(Status, SavingsInterestHeader.Status::"Pending Approval");
                    SavingsInterestHeader.Modify;
                    Variant := SavingsInterestHeader;
                end;//
                    //End Year Transfer Header
            Database::"End Year Transfer Header":
                begin
                    RecRef.SetTable(EndYearTransferHeader);
                    EndYearTransferHeader.Validate(Status, EndYearTransferHeader.Status::"Pending Approval");
                    EndYearTransferHeader.Modify;
                    Variant := EndYearTransferHeader;
                end;//


            //ATM Applications
            Database::"ATM Applications":
                begin
                    RecRef.SetTable(ATMApplications);
                    ATMApplications.Validate(Status, ATMApplications.Status::"Pending Approval");
                    ATMApplications.Modify;
                    Variant := ATMApplications;
                end;//
                    ////ATM Linking Applications
            Database::"ATM Linking Applications":
                begin
                    RecRef.SetTable(ATMLinkingApplications);
                    ATMLinkingApplications.Validate(Status, ATMLinkingApplications.Status::"Pending Approval");
                    ATMLinkingApplications.Modify;
                    Variant := ATMLinkingApplications;
                end;//
                    //Checkoff
            Database::"Checkoff Header":
                begin
                    RecRef.SetTable(Checkoff);
                    Checkoff.Validate(Status, Checkoff.Status::Pending);
                    Checkoff.Modify;
                    Variant := Checkoff;
                end;

            //Membership Closure
            Database::"Membership closure":
                begin
                    RecRef.SetTable(MembClosure);
                    MembClosure.Validate(Status, MembClosure.Status::Pending);
                    MembClosure.Modify;
                    Variant := MembClosure;
                end;

            //Loan Rescheduling
            Database::"Loan Rescheduling":
                begin
                    RecRef.SetTable(LoanRescheduling);
                    LoanRescheduling.Validate(Status, LoanRescheduling.Status::Pending);
                    LoanRescheduling.Modify;
                    Variant := LoanRescheduling;
                end;//

            //HR Employees
            Database::"HR Employees":
                begin
                    RecRef.SetTable(HREmployees);
                    HREmployees.Validate(Status, HREmployees.Status::"Pending Approval");
                    HREmployees.Modify;
                    Variant := HREmployees;
                end;//

            //Member Withdrawal
            Database::"Member withdrawal Notice":
                begin
                    RecRef.SetTable(MemberwithdrawalNotice);
                    MemberwithdrawalNotice.Validate(Status, MemberwithdrawalNotice.Status::Pending);
                    MemberwithdrawalNotice.Modify;
                    Variant := MemberwithdrawalNotice;
                end;
            //

            //Gurantor Substitution
            Database::"Guarantors Substitution":
                begin
                    RecRef.SetTable(GuarantorsSubstitution);
                    GuarantorsSubstitution.Validate(Status, GuarantorsSubstitution.Status::Pending);
                    GuarantorsSubstitution.Modify;
                    Variant := GuarantorsSubstitution;
                end;
            //

            //Loan Recovery
            Database::"Loan Recovery Header":
                begin
                    RecRef.SetTable(LoanRecoveryHeader);
                    LoanRecoveryHeader.Validate(Status, LoanRecoveryHeader.Status::Pending);
                    LoanRecoveryHeader.Modify;
                    Variant := LoanRecoveryHeader;
                end;
            //

            //Bond
            Database::Bond:
                begin
                    RecRef.SetTable(Bond);
                    Bond.Validate("Bond Status", Bond."bond status"::"Pending Approval");
                    Bond.Modify;
                    Variant := Bond;
                end;
            //

            //DelegateGroupsApplicationss
            Database::"Delegate Region Applicationss":
                begin
                    RecRef.SetTable(DelegateGroupsApplicationss);
                    DelegateGroupsApplicationss.Validate(Status, DelegateGroupsApplicationss.Status::Pending);
                    DelegateGroupsApplicationss.Modify;
                    Variant := DelegateGroupsApplicationss;
                end;
            //Sink Fund
            Database::"BBF Requisation Header":
                begin
                    RecRef.SetTable(BBFRequisationHeader);
                    BBFRequisationHeader.Validate(Status, BBFRequisationHeader.Status::Pending);
                    BBFRequisationHeader.Modify;
                    Variant := BBFRequisationHeader;
                end;

            //BDE Management
            Database::"BDE Management Header":
                begin
                    RecRef.SetTable(BDEManagementHeader);
                    BDEManagementHeader.Validate(Status, BDEManagementHeader.Status::Pending);
                    BDEManagementHeader.Modify;
                    Variant := BDEManagementHeader;
                end;
            //

            //Delegate Group Mem Retirements
            Database::"Delegate Region Mem Retirement":
                begin
                    RecRef.SetTable(DelegateGroupMemRetirements);
                    DelegateGroupMemRetirements.Validate(Status, DelegateGroupMemRetirements.Status::Pending);
                    DelegateGroupMemRetirements.Modify;
                    Variant := DelegateGroupMemRetirements;
                end;
            //Delegates Payment
            Database::"Delegates Payment":
                begin
                    RecRef.SetTable(DelegatesPayment);
                    DelegatesPayment.Validate(Status, DelegatesPayment.Status::Pending);
                    DelegatesPayment.Modify;
                    Variant := DelegatesPayment;
                end;

            //HR____________
            //hr
            //Jobs
            Database::"HR Jobs":
                begin
                    RecRef.SetTable(HRJobs);
                    HRJobs.Validate(Status, HRJobs.Status::"Pending Approval");
                    HRJobs.Modify;
                    Variant := HRJobs;
                end;
            //HR Jobs
            //HR leave Planner
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(leavePlanner);
                    leavePlanner.Validate(Status, leavePlanner.Status::"Pending Approval");
                    leavePlanner.Modify;
                    Variant := leavePlanner;
                end;
            //HR Intern Requisition
            Database::"HR Interns Requisition":
                begin
                    RecRef.SetTable(HRInternReq);
                    HRInternReq.Validate(Status, HRInternReq.Status::"Pending Approval");
                    HRInternReq.Modify;
                    Variant := HRInternReq;
                end;
            //HR Intern Requisition

            //Employee Requisition
            Database::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Hrempreq);
                    Hrempreq.Validate("Approval Status", Hrempreq."approval status"::"Pending Approval");
                    Hrempreq.Modify;
                    Variant := Hrempreq;
                end;
            //Leave
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(Leave);
                    Leave.Validate(Status, Leave.Status::"Pending Approval");
                    Leave.Modify;
                    Variant := Leave;
                end;


            //HR Training Feedback
            Database::"HR Training Feedback Form":
                begin
                    RecRef.SetTable(TFeed);
                    TFeed.Validate(Status, TFeed.Status::"Pending Approval");
                    TFeed.Modify;
                    Variant := TFeed;
                end;


            //Interns
            Database::"HR Interns":
                begin
                    RecRef.SetTable(Intern);
                    Intern.Validate("Posting Status", Intern."posting status"::"Pending Approval");
                    Intern.Modify;
                    Variant := Intern;
                end;


            //Appraisal Appeal
            Database::"HR Appraissal Appeal":
                begin
                    RecRef.SetTable(AppraisalAppeal);
                    AppraisalAppeal.Validate(Status, AppraisalAppeal.Status::"Pending Approval");
                    AppraisalAppeal.Modify;
                    Variant := AppraisalAppeal;
                end;

            //Disciplinary Appeal
            Database::"HRDisciplinary Appeal":
                begin
                    RecRef.SetTable(DisciplinaryAppeal);
                    DisciplinaryAppeal.Validate(Status, DisciplinaryAppeal.Status::"Pending Approval");
                    DisciplinaryAppeal.Modify;
                    Variant := DisciplinaryAppeal;
                end;

            //Disciplinary Withdrawal
            Database::"HRDisciplinary Case Withdrawal":
                begin
                    RecRef.SetTable(DiscWithdrawal);
                    DiscWithdrawal.Validate(Status, DiscWithdrawal.Status::"Pending Approval");
                    DiscWithdrawal.Modify;
                    Variant := DiscWithdrawal;
                end;


            //Disciplinary
            Database::"HR Disciplinary Cases NCA":
                begin
                    RecRef.SetTable(Disciplinary);
                    Disciplinary.Validate(Status, Disciplinary.Status::"Pending Approval");
                    Disciplinary.Modify;
                    Variant := Disciplinary;
                end;

            //StaffLoan
            Database::"prSalary Advance":
                begin
                    RecRef.SetTable(StaffLoan);
                    StaffLoan.Validate(Status, StaffLoan.Status::"Pending Approval");
                    StaffLoan.Modify;
                    Variant := StaffLoan;
                end;

            //Training Need
            Database::"HR Training Needs":
                begin
                    RecRef.SetTable(TNeed);
                    TNeed.Validate(Status, TNeed.Status::"Pending Approval");
                    TNeed.Modify;
                    Variant := TNeed;
                end;
            //Training
            Database::"HR Training App Header":
                begin
                    RecRef.SetTable(hrtraining);
                    hrtraining.Validate(Status, hrtraining.Status::"Pending Approval");
                    hrtraining.Modify;
                    Variant := hrtraining;
                end;
            //Hr Transport hrtransport
            Database::"HR Transport Requisition Head":
                begin
                    RecRef.SetTable(hrtransport);
                    hrtransport.Validate(Status, hrtransport.Status::"Pending Approval");
                    hrtransport.Modify;
                    Variant := hrtransport;
                end;

            //Hr Emplpoyee Transfer EmpTrans
            Database::"HR Employee Transfer Header":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::"Pending Approval");
                    EmpTrans.Modify;
                    Variant := EmpTrans;
                end;
            //end HR

            // MSACCO

            //M-SACCO PIN
            Database::"M-SACCO Change PIN No":
                begin
                    RecRef.SetTable(MsaccoPIN);
                    MsaccoPIN.Validate(Status, MsaccoPIN.Status::Pending);
                    MsaccoPIN.Modify;
                    Variant := MsaccoPIN;
                end;

            //M-SACCO APPLICATIONS
            Database::"M-SACCO Applications":
                begin
                    RecRef.SetTable(MsaccoApp);
                    MsaccoApp.Validate(Status, MsaccoApp.Status::Pending);
                    MsaccoApp.Modify;
                    Variant := MsaccoApp;
                end;

            //Agent applications
            Database::"Agent Applications":
                begin
                    RecRef.SetTable(AgentApplications);
                    AgentApplications.Validate("Approval Status", AgentApplications."approval status"::Pending);
                    AgentApplications.Modify;
                    Variant := AgentApplications;
                end;

            //Contract
            Database::Contracts:
                begin
                    RecRef.SetTable(contrct);
                    contrct.Validate(Status, contrct.Status::"Pending Approval");
                    contrct.Modify;
                    Variant := contrct;
                end;

            //SuretyMangt
            Database::"Surety Management":
                begin
                    RecRef.SetTable(SuretyMangt);
                    SuretyMangt.Validate(Status, SuretyMangt.Status::"Pending Approval");
                    SuretyMangt.Modify;
                    Variant := SuretyMangt;
                end;

            //LEGAL
            Database::Legal:
                begin
                    RecRef.SetTable(Cases1);
                    Cases1.Validate(Status, Cases1.Status::"Pending Approval");
                    Cases1.Modify;
                    Variant := Cases1;
                end;

            //M-SACCO Change Transactions
            Database::"M-PESA Change Transactions":
                begin
                    RecRef.SetTable(MpesaChange);
                    MpesaChange.Validate(Status, MpesaChange.Status::Pending);
                    MpesaChange.Modify;
                    Variant := MpesaChange;
                end;

            //Mortgage Release Doc
            Database::"Mortgage Loans Doc Release":
                begin
                    RecRef.SetTable(MortDoc);
                    MortDoc.Validate(Status, MortDoc.Status::Pending);
                    MortDoc.Modify;
                    Variant := MortDoc;
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end
    end;
}

