#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52186023 "Recruited By Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Recruited By Report.rdlc';

    dataset
    {
        dataitem("Member Application"; "Member Application")
        {
            //DataItemTableView = where(Status = filter(<> Rejected), "Recruited By" = filter(<> ""), "Recruited by Type" = filter(<> Self));
            RequestFilterFields = "Application Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(PrintedBy; PrintedBy)
            {
            }
            column(PrintedAt; PrintedAt)
            {
            }
            column(RecruiterEmployerCode; RecruiterEmployerCode)
            {
            }
            column(RecruiterEmployerName; RecruiterEmployerName)
            {
            }
            column(RecruitedByMemberNumber; RecruitedByMemberNumber)
            {
            }
            column(RecruitedByName; RecruitedByName)
            {
            }
            column(RecruitedByPhone; RecruitedByPhone)
            {
            }
            column(MemberEmployerCode; MemberEmployerCode)
            {
            }
            column(MemberEmployerName; MemberEmployerName)
            {
            }
            column(MobilePhoneNo_MemberApplication; "Member Application"."Mobile Phone No")
            {
            }
            column(No_MemberApplication; "Member Application"."No.")
            {
            }
            column(Name_MemberApplication; "Member Application".Name)
            {
            }
            column(Status_MemberApplication; "Member Application".Status)
            {
            }
            column(MemberNumber; MemberNumber)
            {
            }

            trigger OnAfterGetRecord()
            var
                Members: Record "Members";
                HREmployees: Record "HR Employees";
                Customer: Record Customer;
            begin
                if ("Member Application"."Recruited by Type" = "Member Application"."recruited by type"::Delegates) or
                    ("Member Application"."Recruited by Type" = "Member Application"."recruited by type"::Others)
                then begin
                    if Members.Get("Member Application"."Recruited By") then begin
                        RecruitedByMemberNumber := Members."No.";
                        RecruitedByName := Members.Name;
                        RecruitedByPhone := Members."Mobile Phone No";
                        RecruiterEmployerCode := Members."Employer Code";
                        if Customer.Get(Members."Employer Code") then
                            RecruiterEmployerName := Customer.Name;
                    end;
                end;


                if "Member Application"."Recruited by Type" = "Member Application"."recruited by type"::Staff then begin
                    if HREmployees.Get("Member Application"."Recruited By") then begin
                        Members.Reset;
                        Members.SetRange("Payroll/Staff No.", HREmployees."No.");
                        if Members.FindFirst then begin
                            RecruitedByMemberNumber := Members."No.";
                            RecruitedByName := Members.Name;
                            RecruitedByPhone := Members."Mobile Phone No";
                            RecruiterEmployerCode := Members."Employer Code";
                            if Customer.Get(Members."Employer Code") then
                                RecruiterEmployerName := Customer.Name;
                        end;
                    end;
                end;

                MemberEmployerCode := "Member Application"."Employer Code";
                if Customer.Get("Member Application"."Employer Code") then
                    MemberEmployerName := Customer.Name;

                if "Member Application".Status = "Member Application".Status::Created then begin
                    Members.Reset;
                    Members.SetRange("ID No.", "Member Application"."ID No.");
                    if Members.FindFirst then
                        MemberNumber := Members."No.";
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        PrintedBy := CopyStr(UserId, StrPos(UserId, '\') + 1, StrLen(UserId));
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then
            PrintedBy := UserSetup."Full Name";
        //PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
    end;

    var
        PrintedBy: Code[50];
        PrintedAt: Text;
        //SkyHarambeePortal: Codeunit 52185428;
        RecruiterEmployerCode: Code[50];
        UserSetup: Record "User Setup";
        RecruiterEmployerName: Text;
        RecruitedByMemberNumber: Code[30];
        RecruitedByName: Text;
        RecruitedByPhone: Code[30];
        MemberEmployerCode: Code[10];
        MemberEmployerName: Text;
        MemberNumber: Code[10];
}
