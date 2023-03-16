page 52185631 "HR Employee Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("No."; Rec."No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        /*
                        IF AssistEdit THEN
                          CurrPage.UPDATE;
                        */

                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    Importance = Promoted;
                }
                field(Citizenship; Rec.Citizenship)
                {
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                // }
                // field("<GlobSal Dimension 1 Code>"; Rec."Global Dimension 1 Code")
                // {
                //     ShowMandatory = true;
                // }
                // field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                // {
                //     ShowMandatory = true;
                // }
                field(Title; Rec.Title)
                {
                }
                field(Picture; Rec.Picture)
                {
                }
                field("User ID"; Rec."User ID")
                {
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                        SupervisorNames := GetSupervisor(Rec."User ID");
                    end;
                }
                // field("Supervisor Code"; Rec."Supervisor Code")
                // {

                //     trigger OnValidate()
                //     begin
                //         if (Rec."User ID" = 'HARAMBEESACCO\ADMINISTRATOR') or
                //            (Rec."User ID" = 'HARAMBEESACCO\AGENCYBANKING') or
                //            (Rec."User ID" = 'HARAMBEESACCO\ATMBRIDGE') or
                //            (Rec."User ID" = 'HARAMBEESACCO\MBANKING') or
                //            (Rec."User ID" = 'HARAMBEESACCO\MSACCO') or
                //            (Rec."User ID" = 'HARAMBEESACCO\SKYWORLDLTD') or
                //            (Rec."User ID" = 'HARAMBEESACCO\WEBPORTAL')
                //            then
                //             Error('User ID not valid user');

                //         if (Rec."Supervisor Code" = 'HARAMBEESACCO\ADMINISTRATOR') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\AGENCYBANKING') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\ATMBRIDGE') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\MBANKING') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\MSACCO') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\SKYWORLDLTD') or
                //            (Rec."Supervisor Code" = 'HARAMBEESACCO\WEBPORTAL')
                //            then
                //             Error('Supervisor Code not valid user');
                //     end;
                // }
                // field("Supervisor Name"; Rec."Supervisor Name")
                // {
                // }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                // field("Reason For Status Change"; Rec."Reason For Status Change")
                // {
                // }
                // field("Last Date Modified By"; Rec."Last Date Modified By")
                // {
                // }
                // field("Residential status"; Rec."Residential status")
                // {
                // }
                // field("Type of Employee"; Rec."Type of Employee")
                // {
                // }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    StyleExpr = StyleTxt;

                    trigger OnValidate()
                    begin

                        //HR Value Change
                        prEmployees.Reset;
                        if prEmployees.Get(Rec."No.") then begin
                            //HRCodeunit.fn_HRChangeLog('Status',"No.",FORMAT(prEmployees.Status),FORMAT(Status));
                        end;
                        if (Rec."User ID" = 'HARAMBEESACCO\ADMINISTRATOR') or
                           (Rec."User ID" = 'HARAMBEESACCO\AGENCYBANKING') or
                           (Rec."User ID" = 'HARAMBEESACCO\ATMBRIDGE') or
                           (Rec."User ID" = 'HARAMBEESACCO\MBANKING') or
                           (Rec."User ID" = 'HARAMBEESACCO\MSACCO') or
                           (Rec."User ID" = 'HARAMBEESACCO\SKYWORLDLTD') or
                           (Rec."User ID" = 'HARAMBEESACCO\WEBPORTAL')
                           then
                            Error('User ID not valid user');

                        // if (Rec."Supervisor Code" = 'HARAMBEESACCO\ADMINISTRATOR') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\AGENCYBANKING') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\ATMBRIDGE') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\MBANKING') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\MSACCO') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\SKYWORLDLTD') or
                        //    (Rec."Supervisor Code" = 'HARAMBEESACCO\WEBPORTAL')
                        //    then
                        //     Error('Supervisor Code not valid user');
                    end;
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Rec.Gender)
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(Religion; Rec.Religion)
                {
                    Importance = Promoted;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    Importance = Promoted;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                }
                field("First Language Write"; Rec."First Language Write")
                {
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    Importance = Promoted;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                }
                field("Additional Language"; Rec."Additional Language")
                {
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    Importance = Promoted;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                }
                field(Disabled; Rec.Disabled)
                {
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ExtendedDatatype = EMail;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Postal Address"; Rec."Postal Address")
                {
                }
                field(City; Rec.City)
                {
                }
                field(County; Rec.County)
                {
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        if Rec."Date Of Birth" >= Today then begin
                            Error('Invalid Entry');
                        end;
                        //DAge:= HRCodeunit.DetermineAge("Date Of Birth",TODAY);
                    end;
                }
                // field(DAge; Rec.DAge)
                // {
                //     Caption = 'Age';
                //     Editable = false;
                //     Enabled = false;
                //     Importance = Promoted;
                // }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                //     Importance = Promoted;
                //     Visible = true;

                //     trigger OnValidate()
                //     begin
                //         //DService:= HRCodeunit.DetermineAge("Date Of Join",TODAY);
                //     end;
                // }
                // field(DService; Rec.DService)
                // {
                //     Caption = 'Length of Service';
                //     Editable = false;
                //     Enabled = false;
                // }
                // field("Probation Duration"; Rec."Probation Duration")
                // {
                // }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                }
                field("Retirement date"; Rec."Retirement date")
                {

                    trigger OnValidate()
                    begin
                        Dretire := HRCodeunit.DetermineAge(Rec."Retirement date", Today);
                    end;
                }
                // field("Pension Scheme Join Date"; Rec."Pension Scheme Join Date")
                // {

                //     trigger OnValidate()
                //     begin
                //         DPension := HRCodeunit.DetermineAge(Rec."Pension Scheme Join Date", Today);
                //     end;
                // }
                // field(Dretire; Rec.Dretire)
                // {
                //     Caption = 'Days to Retire';
                // }
                // field(DPension; Rec.DPension)
                // {
                //     Caption = 'Days to Retirement';
                //     Enabled = false;
                // }
                // field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                // {

                //     trigger OnValidate()
                //     begin
                //         DMedical := HRCodeunit.DetermineAge(Rec."Medical Scheme Join Date", Today);
                //     end;
                // }
                // field(DMedical; Rec.DMedical)
                // {
                //     Caption = 'Time On Medical Aid Scheme';
                //     Editable = false;
                //     Enabled = false;
                // }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                // field("Salary Grade"; Rec."Salary Grade")
                // {
                // }
                // field(Grade; Rec.Grade)
                // {
                //     Caption = 'Job Grade';
                //     Importance = Promoted;
                //     ShowMandatory = true;
                // }
                field("Posting Group"; Rec."Posting Group")
                {
                    ShowMandatory = true;
                }
                field("Professional Body"; Rec."Professional Body")
                {
                }
                // field("Effective From Date"; Rec."Effective From Date")
                // {
                // }
                // field("Expiry Date"; Rec."Expiry Date")
                // {
                // }
            }
            group("Terms of Service")
            {
                Caption = 'Terms of Service';
                field("Contract Type"; Rec."Contract Type")
                {
                    Caption = 'Contract Type';
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                // field("Employee Group"; Rec."Employee Group")
                // {
                // }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    Editable = true;
                    Importance = Promoted;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("PIN No."; Rec."PIN No.")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                // field("No. Of Bank A/Cs"; Rec."No. Of Bank A/Cs")
                // {
                //     Editable = false;
                // }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                // field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                // {
                //     Importance = Promoted;
                // }
                // field("Allocated Leave Days"; Rec."Allocated Leave Days")
                // {
                //     Importance = Promoted;
                // }
                // field("Total (Leave Days)"; Rec."Total (Leave Days)")
                // {
                //     Importance = Promoted;
                // }
                // field("Total Leave Taken"; Rec."Total Leave Taken")
                // {
                //     Editable = false;
                //     Importance = Promoted;
                // }
                // field("Leave Balance"; Rec."Leave Balance")
                // {
                //     Enabled = false;
                //     Importance = Promoted;
                // }
                // field("Acrued Leave Days"; Rec."Acrued Leave Days")
                // {
                //     Importance = Promoted;
                // }
                // field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                // {
                // }
                // field("Cash per Leave Day"; Rec."Cash per Leave Day")
                // {
                // }
            }
            group("Separation Details")
            {
                Caption = 'Separation Details';
                // field("Date Of Leaving the Company"; Rec."Date Of Leaving the Company")
                // {
                //     Importance = Promoted;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin

                //         /*
                //         FrmCalendar.SetDate("Date Of Leaving the Company");
                //         FrmCalendar.RUNMODAL;
                //         D := FrmCalendar.GetDate;
                //         CLEAR(FrmCalendar);
                //         IF D <> 0D THEN
                //           "Date Of Leaving the Company":= D;
                //         //DAge:= HRCodeunit.DetermineAge("Date Of Birth",TODAY);

                //         */

                //     end;
                // }
                // field("Termination Grounds"; Rec."Termination Grounds")
                // {
                //     Importance = Promoted;
                // }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    Importance = Promoted;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    Importance = Promoted;
                }
                // field(Activate; Rec.Activate)
                // {
                // }
            }
        }
        area(factboxes)
        {
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            part(Control1102755004; "HR Employees Factbox")
            {
                SubPageLink = "No." = FIELD("No.");
            }
            systempart(Control1102755002; Outlook)
            {
            }
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Print")
            {
                Caption = '&Print';
                action("Misc. Article Info")
                {
                    Caption = 'Misc. Article Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Misc.Reset;
                        Misc.SetRange(Misc."Employee No.", Rec."No.");
                        //if Misc.Find('-') then
                        //REPORT.Run(5202, true, true, Misc);
                    end;
                }
                action("Confidential Info")
                {
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Conf.Reset;
                        Conf.SetRange(Conf."Employee No.", Rec."No.");
                        //if Conf.Find('-') then
                        //REPORT.Run(5203, true, true, Conf);
                    end;
                }
                action(Label)
                {
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        //if HREmp.Find('-') then
                        //REPORT.Run(5200, true, true, HREmp);
                    end;
                }
                action(Addresses)
                {
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        //if HREmp.Find('-') then
                        //REPORT.Run(5207, true, true, HREmp);
                    end;
                }
                action("Alt. Addresses")
                {
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        //if HREmp.Find('-') then
                        //REPORT.Run(5213, true, true, HREmp);
                    end;
                }
                action("Phone Nos")
                {
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        //if HREmp.Find('-') then
                        //REPORT.Run(5210, true, true, HREmp);
                    end;
                }
            }
            group("&Employee")
            {
                Caption = '&Employee';
                action("Next of Kin")
                {
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = WHERE(Type = FILTER("Next of Kin"));
                }
                action(Dependants)
                {
                    Caption = 'Dependants';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = WHERE(Type = FILTER(Beneficiary));
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Employee),
                                  "No." = FIELD("No.");
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Qualification Line";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Alternative Addresses")
                {
                    Caption = 'Alternative Addresses';
                    Image = AlternativeAddress;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Alternative Address Card";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Misc. Articles")
                {
                    Caption = 'Misc. Articles';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Misc. Articles Overview")
                {
                    Caption = 'Misc. Articles Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("&Confidential Information")
                {
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Co&nfidential Info. Overview")
                {
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Info. Overview";
                }
                action("A&bsences")
                {
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5200),
                                  "No." = FIELD("No.");
                }
                action("Bank Accounts")
                {
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Bank Accounts List";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageMode = Edit;
                }
                action("<Page Employee Competence>")
                {
                    Caption = 'Employee Competence';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Competence List";
                    RunPageLink = "Employee No" = FIELD("No.");
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //Rec.TestField("No of Posts");
                        /*Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");*/
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Staff File")
                {
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DMS: Record EDMS;
                    begin
                        DMS.Reset;
                        DMS.SetRange(DMS.Key, DMS.Key::"Employee File");
                        if DMS.Find('-') then begin
                            HyperLink(DMS."url path" + Rec."No.");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        //StyleTxt := HRCodeunit.fn_SetStyle(FORMAT(Status));
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(Rec.RecordId);
        //CRMIsCoupledToRecord := CRMIntegrationEnabled AND CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);


        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';
        Dretire := '';

        //Recalculate Important Dates
        //     if (Rec."Date Of Leaving the Company" = 0D) then begin
        //         if (Rec."Date Of Birth" <> 0D) then
        //             // DAge:= HRCodeunit.DetermineAge("Date Of Birth",TODAY);
        //             if (Rec."Date Of Join" <> 0D) then
        //                 //DService:= HRCodeunit.DetermineAge("Date Of Join",TODAY);
        //                 if (Rec."Pension Scheme Join Date" <> 0D) then
        //                     DPension := HRCodeunit.DetermineAge(Rec."Pension Scheme Join Date", Today);
        //         if (Rec."Medical Scheme Join Date" <> 0D) then
        //             DMedical := HRCodeunit.DetermineAge(Rec."Medical Scheme Join Date", Today);
        //         //MODIFY;
        //     end else begin
        //         /*
        //         IF  ("Date Of Birth" <> 0D) THEN
        //         DAge:= HRCodeunit.DetermineAge("Date Of Birth","Date Of Leaving the Company");
        //         IF  ("Date Of Join" <> 0D) THEN
        //         DService:= HRCodeunit.DetermineAge("Date Of Join","Date Of Leaving the Company");
        //         IF  ("Pension Scheme Join Date" <> 0D) THEN
        //         DPension:= HRCodeunit.DetermineAge("Pension Scheme Join Date","Date Of Leaving the Company");
        //         IF  ("Medical Scheme Join Date" <> 0D) THEN
        //         DMedical:= HRCodeunit.DetermineAge("Medical Scheme Join Date","Date Of Leaving the Company");
        //         //MODIFY;
        //       END;
        //       */
        //         //Recalculate Leave Days
        //         // Rec.Validate("Allocated Leave Days");
        //         SupervisorNames := GetSupervisor(Rec."User ID");

        //         if Rec."Retirement date" <> 0D then begin
        //             //Dretire:=HRCodeunit.DetermineAge(TODAY,"Retirement date");
        //             //END;
        //         end;
        //     end;

    end;

    var
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        Text003: Label 'Welcome to Lotus Capital Limited';
        Text004a: Label 'It is a great pleasure to welcome you to Moi Teaching and Referral Hospital. You are now part of an organization that has its own culture and set of values. On your resumption and during your on-boarding process,  to help you to understand and adapt quickly and easily to the LOTUS CAPITAL culture and values, HR Unit shall provide you with various important documents that you are encouraged to read and understand.';
        Text004b: Label 'On behalf of the Managing Director, I congratulate you for your success in the interview process and I look forward to welcoming you on board LOTUS CAPITAL Limited.';
        Text004c: Label 'Adebola SAMSON-FATOKUN';
        Text004d: Label 'Strategy & Corporate Services';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        PictureExists: Boolean;
        HRCodeunit: Codeunit "HR Codeunit2";
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        D: Date;
        DoclLink: Record "HR Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HR Employees";
        prPayrollType: Record "prPayroll Type";
        Mail: Codeunit Mail;
        HREmp: Record "HR Employees";
        SupervisorNames: Text[60];
        Misc: Record "Misc. Article Information";
        Conf: Record "Confidential Information";
        //SMTP: Codeunit "SMTP Mail";
        CompInfo: Record "Company Information";
        Body: Text[1024];
        Filename: Text;
        Recordlink: Record "Record Link";
        NL: Char;
        LF: Char;
        objpostingGroup: Record "PR Salary Card";
        objDimVal: Record "Dimension Value";
        "Citizenship Text": Text[200];
        BankEditable: Boolean;
        HRBankAccounts: Record "HR Employee Bank Accounts";
        Dretire: Text[100];
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        StyleTxt: Text;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    //[Scope('Internal')]
    procedure GetSupervisor(var sUserID: Code[50]) SupervisorName: Text[200]
    var
        UserSetup: Record "User Setup";
    begin
        if sUserID <> '' then begin
            UserSetup.Reset;
            if UserSetup.Get(sUserID) then begin

                SupervisorName := UserSetup."Approver ID";
                if SupervisorName <> '' then begin

                    HREmp.SetRange(HREmp."User ID", SupervisorName);
                    if HREmp.Find('-') then
                        SupervisorName := ''; //HREmp.FullName

                end else begin
                    SupervisorName := '';
                end;


            end else begin
                Error('User' + ' ' + sUserID + ' ' + 'does not exist in the user setup table');
                SupervisorName := '';
            end;
        end;
    end;

    //[Scope('Internal')]
    procedure GetSupervisorID(var EmpUserID: Code[50]) SID: Text[200]
    var
        UserSetup: Record "User Setup";
        SupervisorID: Code[20];
    begin
        if EmpUserID <> '' then begin
            SupervisorID := '';

            UserSetup.Reset;
            if UserSetup.Get(EmpUserID) then begin
                SupervisorID := UserSetup."Approver ID";
                if SupervisorID <> '' then begin
                    SID := SupervisorID;
                end else begin
                    SID := '';
                end;
            end else begin
                Error('User' + ' ' + EmpUserID + ' ' + 'does not exist in the user setup table');
            end;
        end;
    end;
}

