page 52186478 "HR Asset Transfer Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'Manage,Proces,Report,Transfer';
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = WHERE(Transfered = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                }
                field("Raised by"; Rec."Raised by")
                {
                    Editable = false;
                }
                field("Current Holder"; Rec."Current Holder")
                {
                }
                field("Current Holder Name"; Rec."Current Holder Name")
                {
                    Editable = false;
                }
                field("Asset to Transfer"; Rec."Asset to Transfer")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                    Editable = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    Editable = false;
                }
                field("New Holder"; Rec."New Holder")
                {
                }
                field("New Holder Name"; Rec."New Holder Name")
                {
                    Editable = false;
                }
                field(Transfered; Rec.Transfered)
                {
                    Editable = false;
                }
                field("Date Transfered"; Rec."Date Transfered")
                {
                    Editable = false;
                }
                field("Transfered By"; Rec."Transfered By")
                {
                    Editable = false;
                }
                field("Time Transferred"; Rec."Time Transferred")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Links)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Transfer)
            {
                Image = TransferToLines;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //Rec.TestField(Status,Status::Approved);

                    if Confirm(Txt001, false) = true then begin

                        EmployeeAssets.Reset;
                        EmployeeAssets.SetRange(EmployeeAssets."Employee No.", Rec."Current Holder");
                        EmployeeAssets.SetRange(EmployeeAssets."Misc. Article Code", Rec."Asset to Transfer");
                        if EmployeeAssets.Find('-') then begin
                            EmployeeAssets."In Use" := false;
                            EmployeeAssets."To Date" := Today;
                            EmployeeAssets.Modify;

                            EmployeeAssets.Reset;
                            EmployeeAssets.Init;
                            EmployeeAssets."Employee No." := Rec."New Holder";
                            EmployeeAssets."Misc. Article Code" := Rec."Asset to Transfer";
                            EmployeeAssets.Description := Rec."Asset Description";
                            EmployeeAssets."Serial No." := Rec."Serial No.";
                            EmployeeAssets."From Date" := Today;
                            EmployeeAssets."In Use" := true;
                            EmployeeAssets.Insert(true);

                            Rec.Transfered := true;
                            Rec."Transfered By" := UserId;
                            Rec."Date Transfered" := Today;
                            Rec."Time Transferred" := Time;

                            Message(Txt002, Rec."Asset to Transfer", Rec."New Holder");
                        end;


                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Updatecontrol;
    end;

    trigger OnAfterGetRecord()
    begin
        Updatecontrol;
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        ApprovalEntries: Page "Approval Entries";
        Edit: Boolean;
        Line: Boolean;
        EmployeeAssets: Record "Misc. Article Information";
        Txt001: Label 'Do you want to effect the transfer';
        Txt002: Label 'Asset %1 Successfully Transferred to Employee %2';

    //[Scope('Internal')]
    procedure Updatecontrol()
    begin
        /*
        IF Status=Status::Open THEN BEGIN
        Edit:=TRUE;
        Line:=TRUE;
        END ELSE IF Status=Status::"Pending Approval" THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END ELSE IF Status=Status::Approved THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END
         */

    end;
}

