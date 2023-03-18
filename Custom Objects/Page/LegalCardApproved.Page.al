page 52186100 "Legal Card Approved"
{
    Editable = false;
    PageType = Card;
    SourceTable = Legal;
    SourceTableView = WHERE("Case Level" = CONST(Closed));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field("Type of Complainant"; Rec."Type of Complainant")
                {
                }
                field(Reporter; Rec.Reporter)
                {
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                }
                field("Case Discussion"; Rec."Case Discussion")
                {
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                }
                field(Recomendations; Rec.Recomendations)
                {
                }
                field("Action Taken"; Rec."Action Taken")
                {
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                }
                field("Policy Description"; Rec."Policy Description")
                {
                }
                field("Taken Action Description"; Rec."Taken Action Description")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                }
            }
            part("Legal Line"; "Legal Line")
            {
                Caption = 'Legal Line';
                SubPageLink = No = FIELD("Case Number");
            }
        }
    }

    actions
    {
    }
}

