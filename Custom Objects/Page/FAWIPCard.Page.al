page 52186094 "FA WIP Card"
{
    SourceTable = Job;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {

                    trigger OnAssistEdit()
                    begin
                        // if AssistEdit(xRec) then
                        //     CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    Importance = Promoted;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                }
                field("Search Description"; Rec."Search Description")
                {
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    Caption = 'Project Manager';
                    Importance = Promoted;
                }
                field("WIP Vendor"; Rec."WIP Vendor")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Usage (Cost)"; Rec."Usage (Cost)")
                {
                    Caption = 'WIP Cost';
                }
                // field("Amount Posted to FA"; Rec."Amount Posted to FA")
                // {
                // }
                field("Expected FA Quantity"; Rec."Expected FA Quantity")
                {
                }
                field("WIP GL Balance (LCY)"; Rec."WIP GL Balance (LCY)")
                {
                }
                field("FA No."; Rec."FA No.")
                {
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                }
                field("WIP Method"; Rec."WIP Method")
                {
                }
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                }
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                }
                field("Apply Usage Link"; Rec."Apply Usage Link")
                {
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Importance = Additional;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    Caption = '% Completed';
                    Editable = false;
                    Importance = Additional;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Additional;
                }
            }
            group(Duration)
            {
                Caption = 'Duration';
                field("Starting Date"; Rec."Starting Date")
                {
                    Importance = Promoted;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Importance = Promoted;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
            }
            group("FA Details")
            {
                Caption = 'FA Details';
                field("FA Description"; Rec."FA Description")
                {
                }
                field("FA Description 2"; Rec."FA Description 2")
                {
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                }
                field("Depreciation Method"; Rec."Depreciation Method")
                {
                }
                field("Straight-Line %"; Rec."Straight-Line %")
                {
                }
                field("FA Posting Group"; Rec."FA Posting Group")
                {
                }
                field("No. of FA Created"; Rec."No. of FA Created")
                {
                }
                field("FA Quantity to Register"; Rec."FA Quantity to Register")
                {
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Visible = false;
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = CurrencyCodeEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        CurrencyCheck;
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    Editable = InvoiceCurrencyCodeEditable;

                    trigger OnValidate()
                    begin
                        CurrencyCheck;
                    end;
                }
                field("Exch. Calculation (Cost)"; Rec."Exch. Calculation (Cost)")
                {
                }
                field("Exch. Calculation (Price)"; Rec."Exch. Calculation (Price)")
                {
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                Visible = false;
                group("To Post")
                {
                    Caption = 'To Post';
                    field("WIP Posting Date"; Rec."WIP Posting Date")
                    {
                    }
                    field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                    {
                    }
                    field("Applied Sales G/L Amount"; Rec."Applied Sales G/L Amount")
                    {
                        Visible = false;
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        Visible = false;
                    }
                    field("Recog. Sales Amount"; Rec."Recog. Sales Amount")
                    {
                    }
                    field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                    {
                    }
                    field("Recog. Profit Amount"; Rec.CalcRecognizedProfitAmount)
                    {
                        Caption = 'Recog. Profit Amount';
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage)
                    {
                        Caption = 'Recog. Profit %';
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount)
                    {
                        Caption = 'Acc. WIP Costs Amount';
                        Visible = false;
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount)
                    {
                        Caption = 'Acc. WIP Sales Amount';
                        Visible = false;
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        Visible = false;
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        Visible = false;
                    }
                }
                group(Posted)
                {
                    Caption = 'Posted';
                    field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                    {
                    }
                    field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                    {
                    }
                    field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                    {
                    }
                    field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                    {
                    }
                    field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                    {
                    }
                    field("Recog. Profit G/L Amount"; Rec.CalcRecognizedProfitGLAmount)
                    {
                        Caption = 'Recog. Profit G/L Amount';
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage)
                    {
                        Caption = 'Recog. Profit G/L %';
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        Visible = false;
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        Visible = false;
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control5; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Control4; "Job No. of Prices FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Resource Filter" = FIELD("Resource Filter"),
                              "Posting Date Filter" = FIELD("Posting Date Filter"),
                              "Resource Gr. Filter" = FIELD("Resource Gr. Filter"),
                              "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = true;
            }
            part(Control3; "Job WIP/Recognition FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Resource Filter" = FIELD("Resource Filter"),
                              "Posting Date Filter" = FIELD("Posting Date Filter"),
                              "Resource Gr. Filter" = FIELD("Resource Gr. Filter"),
                              "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = false;
            }
            systempart(Control2; Links)
            {
                Visible = false;
            }
            systempart(Control1; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&FA WIP")
            {
                Caption = '&FA WIP';
                Image = Job;
                action("FA WIP &Task Lines")
                {
                    Caption = 'FA WIP &Task Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // RunObject = Page "FA WIP Job Task Lines";
                    // RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                }
                action("FA WIP &Planning Lines")
                {
                    Caption = 'FA WIP &Planning Lines';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        // TestField("No.");
                        // JobPlanningLine.SetRange("Job No.", "No.");
                        JobPlanningLines.SetJobNoVisible(false);
                        JobPlanningLines.SetTableView(JobPlanningLine);
                        JobPlanningLines.Editable := false;
                        JobPlanningLines.Run;
                    end;
                }
                action("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(167),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("&Statistics")
                {
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                }
                separator(Action112)
                {
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job),
                                  "No." = FIELD("No.");
                }
                action("&Online Map")
                {
                    Caption = '&Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        // DisplayMap;
                    end;
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
                    Visible = false;
                }
                action("WIP &G/L Entries")
                {
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.");
                    Visible = false;
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    Caption = '&Resource';
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&Item")
                {
                    Caption = '&Item';
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&G/L Account")
                {
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                }
                action("Res. &Gr. All&ocated per Job")
                {
                    Caption = 'Res. &Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    RunObject = Page "Res. Gr. Allocated per Job";
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                action("Copy Tasks &from...")
                {
                    Caption = 'Copy Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
                action("Copy Tasks &to...")
                {
                    Caption = 'Copy Tasks &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RunModal;
                    end;
                }
            }
            group(Action93)
            {
                Caption = 'W&IP';
                Image = WIP;
                action("<Action82>")
                {
                    Caption = '&Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        // TestField("No.");
                        // Job.Copy(Rec);
                        // Job.SetRange("No.", "No.");
                        //REPORT.RunModal(REPORT::"Job Calculate WIP", true, false, Job);
                    end;
                }
                action("<Action83>")
                {
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    var
                        Job: Record Job;
                    begin
                        // TestField("No.");
                        // Job.Copy(Rec);
                        // Job.SetRange("No.", "No.");
                        //REPORT.RunModal(REPORT::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("WIP Actual to Budget")
            {
                Caption = 'WIP Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ////here//RunObject = Report "Job Actual To Budget";
            }
            action("WIP Analysis")
            {
                Caption = 'WIP Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Analysis";
            }
            action("WIP - Planning Lines")
            {
                Caption = 'WIP - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job - Planning Lines";
            }
            action("WIP - Suggested Billing")
            {
                Caption = 'WIP - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job Suggested Billing";//here
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //Type := Type::"1";
    end;

    var
        [InDataSet]
        InvoiceCurrencyCodeEditable: Boolean;
        [InDataSet]
        CurrencyCodeEditable: Boolean;

    //[Scope('Internal')]
    procedure CurrencyCheck()
    begin
        // if "Currency Code" <> '' then
        //     InvoiceCurrencyCodeEditable := false
        // else
        //     InvoiceCurrencyCodeEditable := true;

        // if "Invoice Currency Code" <> '' then
        //     CurrencyCodeEditable := false
        // else
        //     CurrencyCodeEditable := true;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update;
    end;
}

