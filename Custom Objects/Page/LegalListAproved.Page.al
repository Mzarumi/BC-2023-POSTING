page 52186101 "Legal List Aproved"
{
    CardPageID = "Legal Card Approved";
    PageType = List;
    SourceTable = Legal;
    SourceTableView = WHERE("Case Level" = CONST(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Type of Complainant"; Rec."Type of Complainant")
                {
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field(Reporter; Rec.Reporter)
                {
                }
                field(Witness; Rec.Witness)
                {
                }
                field("Witness #2"; Rec."Witness #2")
                {
                }
                field("Action Taken"; Rec."Action Taken")
                {
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                }
                field(Comments; Rec.Comments)
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
                field("No. Series"; Rec."No. Series")
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
                field("Witness #1 Name"; Rec."Witness #1 Name")
                {
                }
                field("Witness #2  Name"; Rec."Witness #2  Name")
                {
                }
                field("Legal Type"; Rec."Legal Type")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Accused Name"; Rec."Accused Name")
                {
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

