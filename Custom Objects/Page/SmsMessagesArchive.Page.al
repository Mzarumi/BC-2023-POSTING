page 52185476 "Sms Messages Archive"
{
    Editable = false;
    PageType = List;
    SourceTable = "M-SACCO SMS MessagesBackup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Source; Rec.Source)
                {
                }
                field("Telephone No"; Rec."Telephone No")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field("SMS Message"; Rec."SMS Message")
                {
                }
                field("Sent To Server"; Rec."Sent To Server")
                {
                }
                field("Date Sent to Server"; Rec."Date Sent to Server")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("System Created Entry"; Rec."System Created Entry")
                {
                }
                field("Bulk SMS Balance"; Rec."Bulk SMS Balance")
                {
                }
            }
        }
    }

    actions
    {
    }
}

