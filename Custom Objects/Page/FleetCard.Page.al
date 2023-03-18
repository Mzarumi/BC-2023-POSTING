page 52186085 "Fleet Card"
{
    PageType = Card;
    SourceTable = "Fixed Asset";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        // if AssistEdit(xRec) then
                        //     CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    Importance = Promoted;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Importance = Promoted;
                }
                field("Search Description"; Rec."Search Description")
                {
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    Importance = Promoted;
                }
                field(Inactive; Rec.Inactive)
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fixed &Asset")
            {
                Caption = 'Fixed &Asset';
                Image = FixedAssets;
                action("Depreciation &Books")
                {
                    Caption = 'Depreciation &Books';
                    Image = DepreciationBooks;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "FA Depreciation Books";
                    RunPageLink = "FA No." = FIELD("No.");
                    Visible = false;
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Fixed Asset Statistics";
                    RunPageLink = "FA No." = FIELD("No.");
                    ShortCutKey = 'F7';
                    Visible = false;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5600),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
                action("Maintenance &Registration")
                {
                    Caption = 'Maintenance &Registration';
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Maintenance Registration";
                    RunPageLink = "FA No." = FIELD("No.");
                }
                action(Picture)
                {
                    Caption = 'Picture';
                    Image = Picture;
                    RunObject = Page "Fixed Asset Picture";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("C&opy Fleet Asset")
                {
                    Caption = 'C&opy Fleet Asset';
                    Ellipsis = true;
                    Image = CopyFixedAssets;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    var
                        CopyFA: Report "Copy Fixed Asset";
                    begin
                        // CopyFA.SetFANo("No.");
                        CopyFA.RunModal;
                    end;
                }
                action("FA Posting Types Overview")
                {
                    Caption = 'FA Posting Types Overview';
                    Image = ShowMatrix;
                    RunObject = Page "FA Posting Types Overview";
                    Visible = false;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Fixed Asset"),
                                  "No." = FIELD("No.");
                }
            }
            group("Main Asset")
            {
                Caption = 'Main Asset';
                action("M&ain Fleet Components")
                {
                    Caption = 'M&ain Fleet Components';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Main Asset Components";
                    RunPageLink = "Main Asset No." = FIELD("No.");
                }
                action("Ma&in Fleet Statistics")
                {
                    Caption = 'Ma&in Fleet Statistics';
                    Image = StatisticsDocument;
                    RunObject = Page "Main Asset Statistics";
                    RunPageLink = "FA No." = FIELD("No.");
                    Visible = false;
                }
                separator(Action39)
                {
                    Caption = '';
                }
            }
            group(Insurance)
            {
                Caption = 'Insurance';
                Image = TotalValueInsured;
                Visible = false;
                action("Total Value Ins&ured")
                {
                    Caption = 'Total Value Ins&ured';
                    Image = TotalValueInsured;
                    RunObject = Page "Total Value Insured";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                Visible = false;
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = FixedAssetLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "FA Ledger Entries";
                    RunPageLink = "FA No." = FIELD("No.");
                    RunPageView = SORTING("FA No.");
                    ShortCutKey = 'Ctrl+F7';
                    Visible = false;
                }
                action("Error Ledger Entries")
                {
                    Caption = 'Error Ledger Entries';
                    Image = ErrorFALedgerEntries;
                    RunObject = Page "FA Error Ledger Entries";
                    RunPageLink = "Canceled from FA No." = FIELD("No.");
                    RunPageView = SORTING("Canceled from FA No.");
                    Visible = false;
                }
                action("Main&tenance Ledger Entries")
                {
                    Caption = 'Main&tenance Ledger Entries';
                    Image = MaintenanceLedgerEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Maintenance Ledger Entries";
                    RunPageLink = "FA No." = FIELD("No.");
                    RunPageView = SORTING("FA No.");
                }
            }
        }
        area(processing)
        {
            action(CalculateDepreciation)
            {
                Caption = 'Calculate Depreciation';
                Image = CalculateDepreciation;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    FixedAsset: Record "Fixed Asset";
                begin
                    // FixedAsset.SetRange("No.", "No.");
                    //REPORT.RunModal(REPORT::"Calculate Depreciation", true, false, FixedAsset);
                end;
            }
        }
        area(reporting)
        {
            action("Fleet  List")
            {
                Caption = 'Fleet  List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - List";
            }
            action("Acquisition List")
            {
                Caption = 'Acquisition List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Acquisition List";
                Visible = false;
            }
            action(Details)
            {
                Caption = 'Details';
                Image = View;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Details";
                Visible = false;
            }
            action("Book Value 01")
            {
                Caption = 'Book Value 01';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 01";
                Visible = false;
            }
            action("Book Value 02")
            {
                Caption = 'Book Value 02';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 02";
                Visible = false;
            }
            action(Analysis)
            {
                Caption = 'Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Analysis";
                Visible = false;
            }
            action("Projected Value")
            {
                Caption = 'Projected Value';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Projected Value";
                Visible = false;
            }
            action("G/L Analysis")
            {
                Caption = 'G/L Analysis';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - G/L Analysis";
                Visible = false;
            }
            action(Register)
            {
                Caption = 'Register';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset Register";
                Visible = false;
            }
        }
    }
}

