page 52186329 "Delegates Payment List"
{
    //CardPageID = "Delegates Payment Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Delegates Payment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Region"; Rec."Delegate Region")
                {
                }
                field("Delegate Region Description"; Rec."Delegate Region Description")
                {
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field(County; Rec.County)
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("County Name"; Rec."County Name")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Amount To Pay"; Rec."Amount To Pay")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Payment Description"; Rec."Payment Description")
                {
                }
                field("Total Payment"; Rec."Total Payment")
                {
                }
            }
        }
    }

    actions
    {
    }
}

