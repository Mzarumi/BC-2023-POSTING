page 52186529 "HR Employee Transfer Line"
{
    PageType = ListPart;
    SourceTable = "HR Employee Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No"; Rec."Request No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                }
                field("New Global Dimension 1 Code"; Rec."New Global Dimension 1 Code")
                {
                }
                field("New Global Dimension 2 Code"; Rec."New Global Dimension 2 Code")
                {
                    Caption = 'Requested New Region Code';
                }
                field("New Shortcut Dimension 3 Code"; Rec."New Shortcut Dimension 3 Code")
                {
                }
                field("Dimension 1 Description"; Rec."Dimension 1 Description")
                {
                }
                field("New Dimension 1 Description"; Rec."New Dimension 1 Description")
                {
                }
                field("Dimension 2 Description"; Rec."Dimension 2 Description")
                {
                }
                field("New Dimension 2 Description"; Rec."New Dimension 2 Description")
                {
                }
                field("Dimension 3 Description"; Rec."Dimension 3 Description")
                {
                }
                field("New Dimension 3 Description"; Rec."New Dimension 3 Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

