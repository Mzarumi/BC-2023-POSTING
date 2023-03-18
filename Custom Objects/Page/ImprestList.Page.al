page 52185905 "Imprest List"
{
    Caption = 'Travel Advance Request';
    CardPageID = "Imprest Request Header";
    Editable = false;
    PageType = List;
    SourceTable = "Imprest Header";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Payee; Rec.Payee)
                {
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ImprestHeader.Reset;
                    ImprestHeader.SetRange(ImprestHeader."No.", Rec."No.");
                    //REPORT.Run(39005885, true, false, ImprestHeader);
                end;
            }
        }
    }

    var
        ImprestHeader: Record "Imprest Header";
}

