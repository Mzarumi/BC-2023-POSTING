page 52185571 "HR Leave Period List"
{
    PageType = List;
    SourceTable = "HR Leave Periods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code"; Rec."Period Code")
                {
                }
                field("Starting Date"; Rec."Starting Date")
                {
                }
                field("Period Description"; Rec."Period Description")
                {
                }
                field(Closed; Rec.Closed)
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Outlook)
            {
            }
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Create Year")
            {
                Caption = '&Create Year';
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report "HR Create Leave Year";
            }
            action("C&lose Year")
            {
                Caption = 'C&lose Year';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Codeunit "HR Leave Year - Close";
            }
        }
    }
}

