page 52186077 "Legal List"
{
    CardPageID = "Legal Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Legal;
    SourceTableView = WHERE("Case Level" = FILTER(<> Closed));

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
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field("Accused Employee"; Rec."Accused Employee")
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
                field("Accused Name"; Rec."Accused Name")
                {
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                }
                field("Action Taken"; Rec."Action Taken")
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
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
                field(Recomendations; Rec.Recomendations)
                {
                }
                field("No. Series"; Rec."No. Series")
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
            }
        }
    }

    actions
    {
    }
}

