page 52186330 "Delegate Region Cards"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Delegate Region";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Region Description"; Rec."Delegate Region Description")
                {
                    Caption = 'Electoral Zone Description';
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                    Caption = 'Region Name';
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                    Caption = 'Region Name Description';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                }
                field("Region Code"; Rec."Region Code")
                {
                }
                field("Region Name"; Rec."Region Name")
                {
                }
                field(County; Rec.County)
                {
                }
                field("County Name"; Rec."County Name")
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
            part(Control11; "Delegate Memberss")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Delegates)
            {
                Image = BOMLedger;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    DelegateGroupss.Reset;
                    //DelegateGroupss.SetRange(Code, Code);
                    //if DelegateGroupss.Find('-') then
                    //REPORT.Run(52186061, true, true, DelegateGroupss)
                end;
            }
            action("Delegate Tariff Payments")
            {
                Image = ProductionSetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Region Delegate Tariffs";
                RunPageLink = "Region Code" = FIELD(Code);
            }
        }
    }

    var
        DelegateGroupss: Record "Delegate Region";
}

