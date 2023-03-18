page 52186641 "Member Statistics"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Members;

    layout
    {
        area(content)
        {
            group("Member Statistics")
            {
                part(Control4; "Savings Statistics")
                {
                    SubPageLink = "Member No." = FIELD ("No.");
                }
                group(Control7)
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    ShowCaption = false;
                }
                part(Control6; "Savings Statistics Unallocated")
                {
                    SubPageLink = "Member No." = FIELD ("No.");
                    UpdatePropagation = Both;
                }
                part(Control5; "Credit Statistics")
                {
                    SubPageLink = "Member No." = FIELD ("No.");
                }
                part(Control8; "Loans Statistics")
                {
                    SubPageLink = "Member No." = FIELD ("No.");
                }
                part(Control3; "Signatories List")
                {
                    SubPageLink = "Member No." = FIELD ("No.");
                }
            }
        }
    }

    actions
    {
    }

    var
        UserSetup: Record "User Setup";
}

