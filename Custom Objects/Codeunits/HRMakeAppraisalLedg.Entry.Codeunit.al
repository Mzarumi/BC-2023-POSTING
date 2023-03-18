#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185451 "HR Make Appraisal Ledg. Entry"
{

    trigger OnRun()
    begin
    end;


    procedure CopyFromJnlLine(var InsCoverageLedgEntry: Record 52185514; var InsuranceJnlLine: Record 52186145)
    begin
        begin
            // "User ID" := UserId;
            // "Appraisal Period" := InsuranceJnlLine."Appraisal Period";
            // "Staff No." := InsuranceJnlLine."Staff No.";
            // "Staff Name" := InsuranceJnlLine."Staff Name";
            // "Posting Date" := InsuranceJnlLine."Posting Date";
            // "Appraisal Entry Type" := InsuranceJnlLine."Appraisal Entry Type";
            // "Appraisal Type" := InsuranceJnlLine."Appraisal Type";
            // "Appraisal Approval Date" := InsuranceJnlLine."Appraisal Approval Date";
            // if "Appraisal Approval Date" = 0D then
            //     "Appraisal Approval Date" := "Posting Date";
            // "Document No." := InsuranceJnlLine."Document No.";
            // "External Document No." := InsuranceJnlLine."External Document No.";
            // Score := InsuranceJnlLine.Score;
            // "Appraisal Posting Description" := InsuranceJnlLine.Description;
            // "Global Dimension 1 Code" := InsuranceJnlLine."Shortcut Dimension 1 Code";
            // "Global Dimension 2 Code" := InsuranceJnlLine."Shortcut Dimension 2 Code";
            // "Source Code" := InsuranceJnlLine."Source Code";
            // "Journal Batch Name" := InsuranceJnlLine."Journal Batch Name";
            // "Reason Code" := InsuranceJnlLine."Reason Code";
            // Closed := SetDisposedFA(InsCoverageLedgEntry."Staff No.");
            // "No. Series" := InsuranceJnlLine."Posting No. Series";
            // "Self Appraisal" := InsuranceJnlLine."Self Rating";
            // "Supervisor Appraisal" := InsuranceJnlLine."Supervisor Rating";
            // "Agreed Appraisal" := InsuranceJnlLine."Agreed Rating";
        end;
    end;


    procedure CopyFromInsuranceCard(var InsCoverageLedgEntry: Record 52185514; var Insurance: Record 52186145)
    begin
        /*WITH InsCoverageLedgEntry DO BEGIN
          "FA Class Code" := Insurance."FA Class Code";
          "FA Subclass Code" := Insurance."FA Subclass Code";
          "FA Location Code" := Insurance."FA Location Code";
          "Location Code" := Insurance."Location Code";
        END;*/

    end;


    procedure SetDisposedFA(FANo: Code[20]): Boolean
    var
        FASetup: Record 52185550;
    begin
        /*FASetup.GET;
        FASetup.TESTFIELD("Insurance Depr. Book");
        IF FADeprBook.GET(FANo,FASetup."Insurance Depr. Book") THEN
          EXIT(FADeprBook."Disposal Date" > 0D)
        ELSE
          EXIT(FALSE);
         */

    end;


    procedure UpdateLeaveApp(LeaveCode: Code[20]; Status: Option)
    var
        LeaveApplication: Record 52185532;
    begin
    end;
}
