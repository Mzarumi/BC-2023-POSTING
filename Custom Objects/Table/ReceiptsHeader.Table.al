table 52185889 "Receipts Header"
{
    //DrillDownPageID = "Receipts List";
    //LookupPageID = "Receipts List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the code of the receipt in the database';
            Editable = false;

            trigger OnValidate()
            begin
                // if "No." <> xRec."No." then begin
                //     GenLedgerSetup.Get;
                //     //NoSeriesMgtTestManual(GenLedgerSetup."Receipts No");
                //     "No. Series" := '';
                // end;
            end;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the receipt was entered into the system';

            trigger OnValidate()
            begin
                if Date > Today then Error('You can not post with a future date');
            end;
        }
        field(3; Cashier; Code[50])
        {
            Description = 'Stores the user id of the cashier';
        }
        field(4; "Date Posted"; Date)
        {
        }
        field(5; "Time Posted"; Time)
        {
        }
        field(6; Posted; Boolean)
        {
        }
        field(7; "No. Series"; Code[20])
        {
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No." WHERE("Currency Code" = FIELD("Currency Code"));

            trigger OnValidate()
            begin
                // if PayLinesExist then begin
                //     Error('You first need to delete the existing Receipt lines before changing the Currency Code'
                //     );
                // end;
                // if bank.Get("Bank Code") then
                //     "Bank Name" := bank.Name;
            end;
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; "Amount Recieved"; Decimal)
        {
        }
        field(26; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin


                // DimVal.Reset;
                // //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                // DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                // if DimVal.Find('-') then
                //     Dim1 := DimVal.Name
            end;
        }
        field(27; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin


                // DimVal.Reset;
                // //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                // DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                // if DimVal.Find('-') then
                //     Dim2 := DimVal.Name
            end;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                // if PayLinesExist then begin
                //     Error('You first need to delete the existing Receipt lines before changing the Currency Code'
                //     );
                // end else begin
                //     "Bank Code" := '';
                // end;
            end;
        }
        field(30; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(38; "Total Amount"; Decimal)
        {
            CalcFormula = Sum("Receipt Line"."Total Amount" WHERE(No = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "Posted By"; Code[50])
        {
        }
        field(40; "Print No."; Integer)
        {
        }
        field(41; Status; Option)
        {
            OptionMembers = " ",Normal,"Post Dated",Posted,Partial,"Pending Approval",Approved,Cancelled;
        }
        field(42; "Cheque No."; Code[20])
        {
        }
        field(43; "No. Printed"; Integer)
        {
        }
        field(44; "Created By"; Code[50])
        {
        }
        field(45; "Created Date Time"; DateTime)
        {
        }
        field(46; "Register No."; Integer)
        {
        }
        field(47; "From Entry No."; Integer)
        {
        }
        field(48; "To Entry No."; Integer)
        {
        }
        field(49; "Document Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Document Date" > Today then Error('You can not post with a future date');
            end;
        }
        field(81; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility CenterBR";

            trigger OnValidate()
            begin
                // if PayLinesExist then begin
                //     Error('You first need to delete the existing Receipt lines before changing the Currency Code');
                // end else begin
                //     "Bank Code" := '';
                // end;


                TestField(Status, Status::" ");
                // if not UserMgt.CheckRespCenter(1, "Responsibility Center") then
                //     Error(
                //       Text001,
                //       RespCenter.TableCaption, UserMgt.GetPurchasesFilter);
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(83; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin

                Validate("Shortcut Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                DimVal.Reset;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code");
                if DimVal.Find('-') then
                    Dim3 := DimVal.Name
            end;
        }
        field(84; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin

                Validate("Shortcut Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code");
                if DimVal.Find('-') then
                    Dim4 := DimVal.Name
            end;
        }
        field(86; Dim3; Text[250])
        {
        }
        field(87; Dim4; Text[250])
        {
        }
        field(88; "Bank Name"; Text[250])
        {
        }
        field(89; "Receipt Type"; Option)
        {
            OptionCaption = 'Bank,Cash';
            OptionMembers = Bank,Cash;
        }
        field(90; "Account Type"; Option)
        {
            Caption = 'Account Type';
            Editable = false;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Savings,Credit';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        }
        field(91; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Savings)) "Savings Accounts" WHERE("Product Type" = FILTER('PRIME' | 'TWIGA'))
            ELSE
            IF ("Account Type" = CONST(Credit)) "Credit Accounts";

            trigger OnValidate()
            begin
                if bank.Get("Account No.") then begin
                    bank.CalcFields("Balance (LCY)");
                    "Bank Name" := bank.Name;
                    "SinkFund Account  Balance" := bank."Balance (LCY)";
                end;
            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin

            end;
        }
        field(481; Dim1; Text[250])
        {
        }
        field(482; Dim2; Text[250])
        {
        }
        field(483; "Group Code"; Code[20])
        {
            Description = '//Added by Kigen--Lookup to members -- To gather for Micro Credit Groups to filter its members';
            TableRelation = Members."No." WHERE("Group Account" = FILTER(true));

            trigger OnValidate()
            begin
                if Members.Get("Group Code") then
                    "Group Name" := Members.Name;
            end;
        }
        field(484; "Group Name"; Text[100])
        {
            Editable = false;
        }
        field(485; "SinkFund Receipt"; Boolean)
        {
        }
        field(486; "Insurance Claim no"; Code[20])
        {
            TableRelation = "SinkFund Report Information".No WHERE("Insurance Payment Status" = FILTER("Pending Payment" | "Principal Amount Paid"),
                                                                    "Member No" = FIELD("Member No"));

            trigger OnValidate()
            begin
                SinkFundReportInformation.Reset;
                SinkFundReportInformation.SetRange(No, Rec."Insurance Claim no");
                if SinkFundReportInformation.Find('-') then begin
                    "Claim For" := SinkFundReportInformation."Deceased Person";
                    "Amount Recieved" := SinkFundReportInformation."Total Net Amount";
                end;
            end;
        }
        field(487; "Claim For"; Text[50])
        {
            Editable = false;
        }
        field(488; "CIC Claim No(External)"; Code[50])
        {

            trigger OnValidate()
            var
                ReceiptsHeader: Record "Receipts Header";
            begin
                ReceiptsHeader.Reset;
                ReceiptsHeader.SetRange(ReceiptsHeader."CIC Claim No(External)", Rec."CIC Claim No(External)");
                if ReceiptsHeader.Find('-') then
                    Error('This Claim has been receipted');
            end;
        }
        field(489; "Member No"; Code[20])
        {
            TableRelation = Members."No.";
        }
        field(490; "Consolidated Doc No"; Code[20])
        {
        }
        field(491; "SinkFund Account  Balance"; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('You Cannot Delete this record');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get;
            TestNoSeries;
            ////NoSeriesMgtInitSeries(GetNoSeriesCode,xRec."No. Series",0D,"No.","No. Series");
            //NoSeriesMgtInitSeries(GenLedgerSetup."Receipts No", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        UserTemplate.Reset;
        UserTemplate.SetRange(UserTemplate.UserID, UserId);
        if UserTemplate.FindFirst then begin
            //"Bank Code":=UserTemplate."Default Receipts Bank";
            //VALIDATE("Bank Code");
            Cashier := UserId;
        end;
        //*****************************JACK**************************//
        "Created By" := UserId;
        "Created Date Time" := CreateDateTime(Today, Time);
        //*****************************END***************************//
        //STIMA
        Usersetup.Reset;
        Usersetup.SetRange("User ID", UserId);
        if Usersetup.Find('-') then
            "Responsibility Center" := Usersetup."Responsibility Centre";
        "Account Type" := "Account Type"::"Bank Account";
    end;

    trigger OnModify()
    begin
        RLine.Reset;
        RLine.SetRange(RLine.No, "No.");
        if RLine.FindFirst then begin
            repeat
                RLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                RLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                RLine."Dimension Set ID" := "Dimension Set ID";
                RLine.Modify;
            until RLine.Next = 0;
        end;
    end;

    var
        GenLedgerSetup: Record "Cash Office Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserTemplate: Record "Cash Office User Template";
        RLine: Record "Receipt Line";
        RespCenter: Record "Responsibility CenterBR";
        // UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        DimVal: Record "Dimension Value";
        bank: Record "Bank Account";
        DimMgt: Codeunit DimensionManagement;
        Members: Record Members;
        Usersetup: Record "User Setup";
        SinkFundReportInformation: Record "SinkFund Report Information";

    //[Scope('Internal')]
    procedure PayLinesExist(): Boolean
    begin
        RLine.Reset;
        RLine.SetRange(RLine.No, "No.");
        exit(RLine.FindFirst);
    end;

    local procedure TestNoSeries(): Boolean
    begin
        if "Receipt Type" = "Receipt Type"::Bank then
            GenLedgerSetup.TestField(GenLedgerSetup."Receipts No")
        else
            GenLedgerSetup.TestField(GenLedgerSetup."Cash Receipt Nos")
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        // if "Receipt Type" = "Receipt Type"::Bank then
        //     NoSeriesCode := GenLedgerSetup."Receipts No"
        // else
        //     NoSeriesCode := GenLedgerSetup."Cash Receipt Nos";

        // exit(GetNoSeriesRelCode(NoSeriesCode));
        /*
        NoSrsRel.SETRANGE(NoSrsRel.Code,NoSeriesCode);
        NoSrsRel.SETRANGE(NoSrsRel."Responsibility Center","Responsibility Center");
        
        IF NoSrsRel.FINDFIRST THEN
        EXIT(NoSrsRel."Series Code")
        ELSE
        EXIT(NoSeriesCode);
        
        IF NoSrsRel.FINDSET THEN BEGIN
          IF PAGE.RUNMODAL(458,NoSrsRel,NoSrsRel."Series Code") = ACTION::LookupOK THEN
          EXIT(NoSrsRel."Series Code")
        END
        ELSE
        EXIT(NoSeriesCode);
        */

    end;

    //[Scope('Internal')]
    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Receipt', "No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    //[Scope('Internal')]
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    //[Scope('Internal')]
    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);

    end;

    //[Scope('Internal')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    //[Scope('Internal')]
    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        RespCenter: Record "Responsibility CenterBR";
        DimMgt: Codeunit DimensionManagement;
        NoSrsRel: Record "No. Series Relationship";
    begin
        // exit(GetNoSeriesRelCode(NoSeriesCode));
        /*
        GenLedgerSetup.GET;
        CASE GenLedgerSetup."Base No. Series" OF
          GenLedgerSetup."Base No. Series"::"1":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Responsibility Center");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"2":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Global Dimension 1 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"3":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 2 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"4":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 3 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"5":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 4 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          ELSE EXIT(NoSeriesCode);
        END;
        */

    end;
}

