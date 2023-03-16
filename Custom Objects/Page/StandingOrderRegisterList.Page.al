page 52185748 "Standing Order Register List"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Standing Order Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Date Processed"; Rec."Date Processed")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Source Account No."; Rec."Source Account No.")
                {
                }
                field("Source Account Name"; Rec."Source Account Name")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Staff/Payroll No."; Rec."Staff/Payroll No.")
                {
                }
                field("Allow Partial Deduction"; Rec."Allow Partial Deduction")
                {
                }
                field("Deduction Status"; Rec."Deduction Status")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Deducted"; Rec."Amount Deducted")
                {
                }
                field("Effective/Start Date"; Rec."Effective/Start Date")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field(Frequency; Rec.Frequency)
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field(EFT; Rec.EFT)
                {
                }
                field("Transfered to EFT"; Rec."Transfered to EFT")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Process Standing Order")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                // ProcessStandingOrder: Codeunit "Mngt. Routine Processes";
                begin
                    // ProcessStandingOrder.Run;
                end;
            }
        }
    }
}

