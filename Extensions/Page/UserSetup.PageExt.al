#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185502 pageextension52185502 extends "User Setup"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""User Setup"(Page 119)".

    layout
    {
        modify("User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Allow Posting From")
        {
            ApplicationArea = Basic;
        }
        modify("Allow Posting To")
        {
            ApplicationArea = Basic;
        }
        modify("Register Time")
        {
            ApplicationArea = Basic;
        }
        modify("Salespers./Purch. Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Salespers./Purch. Code"(Control 5)".


            //Unsupported feature: Property Modification (Name) on ""Salespers./Purch. Code"(Control 5)".

        }
        modify("Sales Resp. Ctr. Filter")
        {
            ApplicationArea = Basic;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            ApplicationArea = Basic;
        }
        modify("Service Resp. Ctr. Filter")
        {
            ApplicationArea = Basic;
        }
        modify("Time Sheet Admin.")
        {
            ApplicationArea = Basic;
        }
        modify(Email)
        {

            //Unsupported feature: Property Modification (Name) on "Email(Control 7)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on "Email(Control 7)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Posting From"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Posting To"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Register Time"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sales Resp. Ctr. Filter"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Resp. Ctr. Filter"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Service Resp. Ctr. Filter"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Time Sheet Admin."(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Email(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("User ID")
        {
            // field("Full Name"; "Full Name")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Allow Posting To")
        {
            // field("Allow Posting From [Time]"; "Allow Posting From [Time]")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Allow Posting To [Time]"; "Allow Posting To [Time]")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Double Login"; "Double Login")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Extended Posting Date"; "Extended Posting Date")
            // {
            //     ApplicationArea = Basic;
            // }
            field("Approver ID"; Rec."Approver ID")
            {
                ApplicationArea = Basic;
            }
            field(Substitute; Rec.Substitute)
            {
                ApplicationArea = Basic;
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Email)
        {
            //     field("Responsibility Centre"; "Responsibility Centre")
            //     {
            //         ApplicationArea = Basic;
            //     }
            // }
            // addafter("Time Sheet Admin.")
            // {
            //     field("Unlimited PV Amount Approval"; "Unlimited PV Amount Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("PV Amount Approval Limit"; "PV Amount Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited PettyAmount Approval"; "Unlimited PettyAmount Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Petty C Amount Approval Limit"; "Petty C Amount Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Imprest Amt Approval"; "Unlimited Imprest Amt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Imprest Amount Approval Limit"; "Imprest Amount Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Store RqAmt Approval"; "Unlimited Store RqAmt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Store Req. Amt Approval Limit"; "Store Req. Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited ImprestSurr Amt Appr"; "Unlimited ImprestSurr Amt Appr")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("ImprestSurr Amt Approval Limit"; "ImprestSurr Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Interbank Amt Appr"; "Unlimited Interbank Amt Appr")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Interbank Amt Approval Limit"; "Interbank Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Imprest Account"; "Imprest Account")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Post JVs"; "Post JVs")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Post Bank Rec"; "Post Bank Rec")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Receipt Amt Approval"; "Unlimited Receipt Amt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Receipt Amt Approval Limit"; "Receipt Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Claim Amt Approval"; "Unlimited Claim Amt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Claim Amt Approval Limit"; "Claim Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited Advance Amt Approval"; "Unlimited Advance Amt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Advance Amt Approval Limit"; "Advance Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Unlimited AdvSurr Amt Approval"; "Unlimited AdvSurr Amt Approval")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("AdvSurr Amt Approval Limit"; "AdvSurr Amt Approval Limit")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Other Advance Staff Account"; "Other Advance Staff Account")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Employee No."; "Employee No.")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Office/Group"; "Office/Group")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Show Hidden"; "Show Hidden")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Post Reversals"; "Post Reversals")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Post Dividend"; "Post Dividend")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Restricted Posting Date"; "Restricted Posting Date")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Show Hidden Balance"; "Show Hidden Balance")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Self Posting Gn Jnl"; "Self Posting Gn Jnl")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Credit FOSA Account"; "Credit FOSA Account")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field(Admin; Admin)
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Allow Overdrawal"; "Allow Overdrawal")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Guarantor Release"; "Guarantor Release")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Update Loan Instalments"; "Update Loan Instalments")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Deactivate Recovered"; "Deactivate Recovered")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Run Sasra Report"; "Run Sasra Report")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Portal Onboarding"; "Portal Onboarding")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Member Change Permission"; "Member Change Permission")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Edit Sal Through FOSA"; "Edit Sal Through FOSA")
            //     {
            //         ApplicationArea = Basic;
            //     }
        }
        //moveafter("Global Dimension 1 Code"; Email)
    }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HideExternalUsers;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FnRestrictAccess();
    */
    //end;

    procedure FnRestrictAccess()
    var
        StatusPermission: Record 52185687;
        ErrorOnRestrictViewTxt: label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", Database.UserId);
        StatusPermission.SetRange("Edit Setup", true);
        if not StatusPermission.Find('-') then begin
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
