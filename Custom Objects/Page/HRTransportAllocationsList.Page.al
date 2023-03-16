page 52186467 "HR Transport Allocations List"
{
    CardPageID = "HR Transport Allocation";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Transport Allocations Head";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    Importance = Promoted;
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    Importance = Promoted;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    Importance = Promoted;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    Importance = Promoted;
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            part("HR Transport Allocations Factbox"; "HR Transport Alloc. Factbox")
            {
                Caption = 'HR Transport Allocations Factbox';
                SubPageLink = "Transport Allocation No" = FIELD("Transport Allocation No");
            }
            systempart(Control1102755006; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Print")
                {
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRTransportAllocationsH.Reset;
                        HRTransportAllocationsH.SetRange(HRTransportAllocationsH."Transport Allocation No", Rec."Transport Allocation No");
                        //if HRTransportAllocationsH.Find('-') then
                        //REPORT.Run(52185534, true, true, HRTransportAllocationsH);
                    end;
                }
                action("<Action1102755035>p")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                        Message('Transport Allocation No :: :: has been Re-Opened', Rec."Transport Allocation No");
                    end;
                }
                action(Release)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Question := Text001;
                        if Confirm(Question) then begin
                            Rec.Status := Rec.Status::Released;
                            Rec.Modify;
                            Message('Transport Allocation No :: :: has been released', Rec."Transport Allocation No");
                        end else begin
                            Message('You selected :: NO :: Release Cancelled');
                        end;
                    end;
                }
            }
        }
        area(reporting)
        {
        }
    }

    var
        HRTransportAllocationsH: Record "HR Transport Allocations Head";
        Text19021002: Label 'Passenger List';
        Text001: Label 'Are you sure you want to Release this Document?';
        Question: Text;
}

