page 52186223 "Active Properties-Edit"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Property Details";
    SourceTableView = WHERE("Agreement Status" = CONST(Active));

    layout
    {
        area(content)
        {
            group("Property Information")
            {
                Caption = 'Property Information';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Property Name';
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                }
                field(City; Rec.City)
                {
                }
                field(Street; Rec.Street)
                {
                }
                field("Property Type"; Rec."Property Type")
                {
                    LookupPageID = "Property Category";

                    trigger OnValidate()
                    begin
                        if Rec."Property Type" = 'RESIDENTIAL' then
                            "Total Area sq ftVisible" := false;
                    end;
                }
                field("Property Code"; Rec."Property Code")
                {
                    Caption = 'Department Code';
                }
                field("Department name"; Rec."Department name")
                {
                }
                field("Total Area sq ft"; Rec."Total Area sq ft")
                {
                    Visible = "Total Area sq ftVisible";
                }
                field("total Units"; Rec."total Units")
                {
                    Caption = 'Total Units';
                }
                field("Property Manager[Staff]"; Rec."Property Manager[Staff]")
                {
                }
            }
            part(Control1102755008; Floor)
            {
                SubPageLink = "No." = FIELD("No.");
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("File Ref No."; Rec."File Ref No.")
                {
                }
                field("Commence Date"; Rec."Commence Date")
                {
                }
                field("Duration Type"; Rec."Duration Type")
                {
                }
                field("Duration Value"; Rec."Duration Value")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field("Agreement Status"; Rec."Agreement Status")
                {
                }
            }
            group("Management Fees")
            {
                Caption = 'Management Fees';
                field("Commission Rate"; Rec."Commission Rate")
                {
                    Caption = 'Management Fee Rate';
                }
                field("Commision Flat Amount"; Rec."Commision Flat Amount")
                {
                    Caption = 'Management Fee Amount';
                }
                field("Letting Fee Rate(%)"; Rec."Letting Fee Rate(%)")
                {
                }
                field("Letting Flat Amount"; Rec."Letting Flat Amount")
                {
                }
                field("Reletting Fee Rate(%)"; Rec."Reletting Fee Rate(%)")
                {
                }
                field("Reletting Flat Amount"; Rec."Reletting Flat Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Property)
            {
                Caption = 'Property';
                Visible = true;
                action(Caretakers)
                {
                    Caption = 'Caretakers';
                    RunObject = Page "Caretaker List";
                    RunPageLink = "Property No" = FIELD("No.");
                }
                action(Charges)
                {
                    Caption = 'Charges';
                    RunObject = Page "Property Charges";
                    RunPageLink = "Property Code" = FIELD("No.");
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Total Area sq ftVisible" := true;
    end;

    var
        [InDataSet]
        "Total Area sq ftVisible": Boolean;
}

