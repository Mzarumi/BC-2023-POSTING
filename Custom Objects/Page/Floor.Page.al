page 52186184 Floor
{
    Caption = 'Property Lines';
    PageType = ListPart;
    SourceTable = Floor;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field("Floor Code"; Rec."Floor Code")
                {
                    Caption = 'Code';
                    NotBlank = true;
                }
                field("Property Type"; Rec."Property Type")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        //if "Property Type" = 'RESIDENTIAL' then
                        //CurrPage."Total Area sq ft".VISIBLE:=FALSE;
                    end;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Floor Area sq ft"; Rec."Floor Area sq ft")
                {
                    Caption = 'Area';
                    Editable = true;
                }
                field("Occupied Units"; Rec."Occupied Units")
                {
                    Editable = false;
                }
                field("Vacant Units"; Rec."Vacant Units")
                {
                    Editable = false;
                }
                field("Total Units"; Rec."Total Units")
                {
                    Importance = Promoted;

                    trigger OnDrillDown()
                    begin
                        // Validate("Floor Code");
                        // unit.Reset;
                        // unit.SetFilter(unit."Property No.", "No.");
                        // unit.SetFilter(unit."Floor Code", "Floor Code");
                        PAGE.Run(52186008, unit);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        unit: Record Unit;
}

