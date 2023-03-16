page 52186123 "ApprovedSurety Management Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Surety Management";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Surety No"; Rec."Surety No")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Type Of Account"; Rec."Type Of Account")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("Refference No"; Rec."Refference No")
                {
                }
                field("Refference Details"; Rec."Refference Details")
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                }
                field(Court; Rec.Court)
                {
                }
                field("Court Name"; Rec."Court Name")
                {
                }
                field("Case No"; Rec."Case No")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                    end else
                        Error('You can only Print approved Document');

                    Rec.Reset;
                    Rec.SetFilter("Surety No", Rec."Surety No");
                    //REPORT.Run(39006073, true, true, Rec);
                    Rec.Reset;
                end;
            }
        }
    }

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
}

