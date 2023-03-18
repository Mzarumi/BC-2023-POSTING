table 52185942 Contracts
{

    fields
    {
        field(1; "Contract No"; Code[30])
        {
            Description = 'iko';
            Editable = false;

            trigger OnValidate()
            begin
                if "Contract No" <> xRec."Contract No" then begin
                    PurchSetup.Get;
                    //NoSeriesMgtTestManual(PurchSetup."Contract No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Contractor Type"; Option)
        {
            Description = 'iko';
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;

            trigger OnValidate()
            begin
                "Contractor No" := '';
                "Contractor Name" := '';
                Address := '';
                "Tel No." := '';
            end;
        }
        field(3; "Contractor No"; Code[60])
        {
            Description = 'iko';
            TableRelation = IF ("Contractor Type" = CONST(Vendor)) Vendor."No."
            ELSE
            IF ("Contractor Type" = CONST(Customer)) Customer."No.";

            trigger OnValidate()
            begin

                "Contractor Name" := '';

                if "Contractor Type" in ["Contractor Type"::Customer, "Contractor Type"::Vendor]
                then
                    case "Contractor Type" of
                        "Contractor Type"::Customer:
                            begin
                                Cust.Get("Contractor No");
                                "Contractor Name" := Cust.Name;
                                Address := Cust.Address;
                                "Tel No." := Cust."Phone No.";
                                //"Contact Person":=Cust.Contact;
                            end;
                        "Contractor Type"::Vendor:
                            begin
                                Vend.Get("Contractor No");
                                "Contractor Name" := Vend.Name;
                                Address := Vend.Address;
                                "Tel No." := Vend."Phone No.";
                                // "Contact Person":=Vend.Contact;
                            end;
                    end;
            end;
        }
        field(4; "Contractor Name"; Text[60])
        {
            Description = 'iko';
        }
        field(5; Address; Code[30])
        {
            Description = 'iko';
        }
        field(6; "Tel No."; Code[30])
        {
            Description = 'iko';
        }
        field(8; "Start Date"; Date)
        {
            Description = 'iko';

            trigger OnValidate()
            begin
                //"Remaining Days":="End Date"-"Start Date";
            end;
        }
        field(9; "End Date"; Date)
        {
            Description = 'iko';

            trigger OnValidate()
            begin
                //"Remaining Days":="End Date"-"Start Date";
            end;
        }
        field(10; "Contract Description"; Text[250])
        {
        }
        field(14; "Contract Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Balance" := "Contract Amount" - Balance;
            end;
        }
        field(15; Balance; Decimal)
        {
            CalcFormula = Sum("Payment Line"."Net Amount" WHERE("Contract No" = FIELD("Contract No")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Total Balance" := "Contract Amount" - Balance;
            end;
        }
        field(17; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Payment Terms"; Option)
        {
            OptionCaption = ' ,Monthly,Quarterly,Bi-Annually,Annually,As Per Need';
            OptionMembers = " ",Monthly,Quarterly,"Bi-Annually",Annually,"As Per Need";
        }
        field(24; "Responsible Employee"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(25; "Amount Paid"; Decimal)
        {
        }
        field(26; "Responsible Employee Name"; Text[30])
        {
            CalcFormula = Lookup("HR Employees"."Full Name" WHERE("No." = FIELD("Responsible Employee")));
            FieldClass = FlowField;
        }
        field(31; "Review Interval"; Option)
        {
            OptionMembers = " ",Daily,Weekly,Monthly,Quaterly,BiAnnually,Anually;
        }
        field(32; "Type Of Service"; Option)
        {
            OptionMembers = " ",Goods,Services;

            trigger OnValidate()
            begin
                "Nature Of Service" := '';
                "Start Date" := 0D;
                "End Date" := 0D;
            end;
        }
        field(33; "Advocate Name"; Text[30])
        {
        }
        field(34; "Nature Of Service"; Code[30])
        {
            TableRelation = "Nature Of Sevices";
        }
        field(35; Comment; Boolean)
        {
        }
        field(36; "Board Approval Date"; Date)
        {
        }
        field(37; "User Department"; Code[50])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('ACTIVITY'));
        }
        field(50000; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50001; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(50003; "Remaining Days"; Integer)
        {

            trigger OnValidate()
            begin
                "Remaining Days" := "End Date" - "Start Date";
            end;
        }
        field(50004; "Defect Liability Period"; DateFormula)
        {
        }
        field(50005; "Support Period"; DateFormula)
        {
        }
        field(50006; "Warranty Period"; DateFormula)
        {
        }
        field(50007; Remarks; Text[150])
        {
        }
        field(50009; "Total Balance"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                "Total Balance" := "Contract Amount" - Balance;
            end;
        }
        field(39003904; Terminated; Boolean)
        {
            Editable = false;
        }
        field(39003905; "Termination Reason"; Text[250])
        {
        }
        field(39003906; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(39003907; UserID; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Contract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        UserID := DATABASE.UserId;
        if "Contract No" = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField(PurchSetup."Contract No");
            //NoSeriesMgtInitSeries(PurchSetup."Contract No", xRec."No. Series", 0D, "Contract No", "No. Series");
        end;

        UserSetup.Reset;
        UserSetup.SetRange(UserSetup."User ID", UserID);
        if UserSetup.Find('-') then
            "Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
    end;

    var
        Cust: Record Customer;
        Vend: Record Vendor;
        PurchSetup: Record "Purchases & Payables Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Hrempl: Record "HR Employees";
        ContractLineType: Record "Contract Lines Types";
        UserSetup: Record "User Setup";
}

