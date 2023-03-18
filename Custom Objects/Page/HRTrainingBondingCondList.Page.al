page 52186493 "HR Training Bonding Cond. List"
{
    Caption = 'HR Training Bonding Conditions List';
    PageType = List;
    SourceTable = "HR Training Bonding Conditions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Condition Type"; Rec."Condition Type")
                {

                    trigger OnValidate()
                    begin
                        HRTrainingNeeds.Reset;
                        if HRTrainingNeeds.Get(Rec."Training Bonding Code") then begin
                            HRTrainingNeeds.TestField(HRTrainingNeeds."Allow Early Exit if Bonded?", true);
                        end;
                    end;
                }
                field("Condition Description"; Rec."Condition Description")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
            }
            systempart(Control9; Notes)
            {
            }
        }
    }

    actions
    {
    }

    var
        HRTrainingNeeds: Record "HR Training Needs";
}

