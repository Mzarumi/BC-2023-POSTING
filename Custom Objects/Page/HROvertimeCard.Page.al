page 52186590 "HR Overtime Card"
{
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report,Convert';
    SourceTable = "HR Overtime Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application Code"; Rec."Application Code")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Weekend Hours"; Rec."Weekend Hours")
                {
                }
                field("Holiday Hours"; Rec."Holiday Hours")
                {
                }
                field("Extra Hours"; Rec."Extra Hours")
                {
                }
                field("Total Overtime Hours"; Rec."Total Overtime Hours")
                {
                }
                field("Convert To?"; Rec."Convert To?")
                {
                }
                field(Converted; Rec.Converted)
                {
                }
                field("Posted to Payroll"; Rec."Posted to Payroll")
                {
                    Visible = false;
                }
            }
            group(Control1000000017)
            {
                ShowCaption = false;
                part(Control1000000004; "HR Overtime Lines")
                {
                    SubPageLink = "Application Code" = FIELD("Application Code");
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Convert)
            {
                Image = ProjectExpense;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //Rec.TestField(Status,Status::Approved);

                    if Confirm('Do you want to convert this Overtime?', true) = false then exit;

                    if Rec.Converted = true then
                        Message(Txt001);

                    if Rec."Convert To?" = Rec."Convert To?"::" " then
                        Message(Txt002);

                    if Rec."Convert To?" = Rec."Convert To?"::"Convert to Leave" then begin

                        Message(Txt003);
                        Rec.Converted := true;
                    end;


                    if Rec."Convert To?" = Rec."Convert To?"::"Convert to Pay" then begin

                        Message(Txt004);
                        Rec.Converted := true;
                    end;
                end;
            }
            action("Overtime Report")
            {
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Overtime.Reset;
                    Overtime.SetRange(Overtime."Application Code", Rec."Application Code");
                    //if Overtime.Find('-') then
                    //REPORT.Run(REPORT::"HR Overtime Report", true, true, Overtime);
                end;
            }
        }
    }

    var
        HRSetup: Record "HR Setup";
        Txt001: Label 'This overtime has already been converted';
        Txt002: Label 'Kindly select what you want to convert to';
        Txt003: Label 'Overtime succesfully converted to Leave';
        Txt004: Label 'Overtime succesfully converted to Pay';
        Overtime: Record "HR Overtime Header";
}

