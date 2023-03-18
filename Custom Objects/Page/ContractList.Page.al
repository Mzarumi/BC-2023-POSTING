page 52186019 "Contract List"
{
    Caption = 'Grant List';
    //CardPageID = 39005823;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Jobs;
    SourceTableView = WHERE(Status = CONST(Contract),
                            "Approval Status" = FILTER(Open | "Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    Visible = false;
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    Visible = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control7; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Grant")
            {
                Caption = '&Grant';
                action("<Page Proposal Card>")
                {
                    Caption = 'Card';
                    Image = EditLines;
                    // RunObject = Page Page39005856;
                    // RunPageLink = Field1 = FIELD("No.");
                    ShortCutKey = 'Shift+F7';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job),
                                  "No." = FIELD("No.");
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action("<Page Grant Task Dimensions>")
                    {
                        Caption = 'Dimensions-Single';
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            Job: Record Jobs;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Job);
                            //DefaultDimMultiple.SetMultiJob(Job);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action("<Page Grant Ledger Entries>")
                {
                    Caption = 'Ledger E&ntries';
                    // RunObject = Page Page39005819;
                    // RunPageLink = Field2 = FIELD("No.");
                    // RunPageView = SORTING(Field2, Field1000, Field64, Field3);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("Grant Task Lines")
                {
                    Caption = 'Grant Task Lines';

                    trigger OnAction()
                    begin
                        /*JTLines.SetJobNo("No.");
                        JTLines.RUN;
                        */

                    end;
                }
                action("<Page Grant Statistics>")
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    // RunObject = Page Page39005880;
                    // RunPageLink = Field1 = FIELD("No.");
                    ShortCutKey = 'F7';
                }
            }
        }
        area(processing)
        {
            action(cgfdg)
            {
                Caption = 'cgfdg';
                RunObject = Page "G/L Account Card";
            }
        }
    }
}

