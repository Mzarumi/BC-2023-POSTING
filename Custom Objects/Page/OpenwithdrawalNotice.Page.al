page 52185853 "Open withdrawal Notice"
{
    CardPageID = "Member withdrawal Notice";
    Editable = false;
    PageType = List;
    SourceTable = "Member withdrawal Notice";
    SourceTableView = WHERE(Status = CONST(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {

                    trigger OnValidate()
                    begin
                        Rec."Date Entered" := Today;
                        Rec."Date Modified" := Today;
                        Rec.Modify;
                    end;
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Reason for withdrawal"; Rec."Reason for withdrawal")
                {
                }
                field("Withdrawal Notice Date"; Rec."Withdrawal Notice Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Date Modified"; Rec."Date Modified")
                {
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(Status, MemberwithdrawalNotice.Status::Open);
        MemberwithdrawalNotice.SetFilter("Notice Type", '%1|%2', MemberwithdrawalNotice."Notice Type"::"Withdrawal - Normal", MemberwithdrawalNotice."Notice Type"::" ");
        if MemberwithdrawalNotice.FindFirst then Error('Kindly make use of card %1', MemberwithdrawalNotice."No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(Status, MemberwithdrawalNotice.Status::Open);
        MemberwithdrawalNotice.SetFilter("Notice Type", '%1|%2', MemberwithdrawalNotice."Notice Type"::"Withdrawal - Normal", MemberwithdrawalNotice."Notice Type"::" ");
        if MemberwithdrawalNotice.FindFirst then Error('Kindly make use of card %1', MemberwithdrawalNotice."No.");
    end;

    var
        MemberwithdrawalNotice: Record "Member withdrawal Notice";
}

