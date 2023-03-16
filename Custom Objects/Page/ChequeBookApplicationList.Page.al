page 52185813 "Cheque Book Application List"
{
    CardPageID = "Cheque Application";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = "Cheque Book Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = false;
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Cheque Account No."; Rec."Cheque Account No.")
                {
                    Editable = false;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Application Exported"; Rec."Application Exported")
                {
                    Editable = false;
                }
                field(Select; Rec.Select)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Export Applications")
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ChqAppl.Reset;
                    ChqAppl.SetRange(ChqAppl."Application Exported", false);
                    ChqAppl.SetRange(Select, true);
                    XMLPORT.Run(52185623, true, false, ChqAppl);

                end;
            }
        }
    }

    var
        ChqAppl: Record "Cheque Book Application";
}

