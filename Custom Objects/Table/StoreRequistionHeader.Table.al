table 52185868 "Store Requistion Header"
{
    //DrillDownPageID = "Store Requisitions List";
    //LookupPageID = "Store Requisitions List";

    fields
    {
        field(1; "No."; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            begin
                //IF "No." = '' THEN BEGIN
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    //NoSeriesMgtTestManual(GenLedgerSetup."Stores Requisition No");
                    "No." := '';
                end;
                //END;
            end;
        }
        field(2; "Request date"; Date)
        {

            trigger OnValidate()
            begin
                if "Request date" < Today then Error('Required date should be furturistic');
            end;
        }
        field(5; "Required Date"; Date)
        {
        }
        field(6; "Requester ID"; Code[50])
        {
            Caption = 'Requester ID';
            Editable = false;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            var
                //LoginMgt: Codeunit "User Management";
            begin
            end;

            trigger OnValidate()
            var
                //LoginMgt: Codeunit "User Management";
            begin
            end;
        }
        field(7; "Request Description"; Text[150])
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; Status; Option)
        {
            Editable = true;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Cancelled,Posted;
        }
        field(11; Supplier; Code[20])
        {
            TableRelation = Vendor;
        }
        field(12; "Action Type"; Option)
        {
            OptionMembers = " ","Ask for Tender","Ask for Quote";

            trigger OnValidate()
            begin
                /*
                IF Type=Type::"G/L Account" THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN
                            ERROR('You cannot Issue a G/L Account please order for it')
                END;


               //Compare Quantity in Store and Qty to Issue
                IF Type=Type::Item THEN BEGIN
                   IF "Action Type"="Action Type"::Issue THEN BEGIN
                    IF Quantity>"Qty in store" THEN
                      ERROR('You cannot Issue More than what is available in store')
                   END;
                END;
                */

            end;
        }
        field(29; Justification; Text[250])
        {
        }
        field(30; "User ID"; Code[50])
        {
            Editable = false;
        }
        field(31; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 1);
                Dimval.SetRange(Dimval.Code, "Global Dimension 1 Code");
                if Dimval.Find('-') then
                    "Function Name" := Dimval.Name;


            end;
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                Dimval.Reset;
                Dimval.SetRange(Dimval."Global Dimension No.", 2);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 2 Code");
                if Dimval.Find('-') then
                    "Budget Center Name" := Dimval.Name;


            end;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
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
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",3);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 3 Code");
                if Dimval.Find('-') then
                    Dim3 := Dimval.Name;

                // ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
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
                Dimval.Reset;
                //Dimval.SETRANGE(Dimval."Global Dimension No.",4);
                Dimval.SetRange(Dimval.Code, "Shortcut Dimension 4 Code");
                if Dimval.Find('-') then
                    Dim4 := Dimval.Name;

                // ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(83; Dim3; Text[250])
        {
        }
        field(84; Dim4; Text[250])
        {
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility CenterBR";

            trigger OnValidate()
            begin

                TestField(Status, Status::Open);
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
        field(86; TotalAmount; Decimal)
        {
            CalcFormula = Sum("Store Requistion Lines"."Line Amount" WHERE("Requistion No" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(87; "Issuing Store"; Code[10])
        {
            TableRelation = Location;

            trigger OnValidate()
            begin

                ReqLines.Reset;
                ReqLines.SetRange(ReqLines."Requistion No", "No.");
                if ReqLines.Find('-') then begin
                    repeat
                        ReqLines."Issuing Store" := "Issuing Store";
                    until ReqLines.Next = 0;
                end;
            end;
        }
        field(88; "Job No"; Code[20])
        {
            TableRelation = Job;
        }
        field(89; "Posting Date"; Date)
        {
        }
        field(90; "Document Type"; Option)
        {
            OptionCaption = ' ,Grant,PR';
            OptionMembers = " ",Grant,PR;
        }
        field(91; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ;
            end;
        }
        field(481; "Quantity Issued"; Decimal)
        {
            CalcFormula = Sum("Store Requistion Lines".Quantity WHERE("Requistion No" = FIELD("No.")));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(482; "Date Posted"; Date)
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
        if Status <> Status::Open then
            Error('You Cannot DELETE an already released Requisition')
    end;

    trigger OnInsert()
    begin

        if "No." = '' then begin
            //NoSeriesMgtInitSeries(GetNoSeriesCode, xRec."No. Series", 0D, "No.", "No. Series");
        end;
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        "Request date" := Today;
        "Posting Date" := Today;
        "User ID" := UserId;
        GeneralSetUp.Get;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.Find('-') then begin
            "Responsibility Center" := UserSetup."Responsibility Centre";
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
        end;

        StoreRequistionHeader.Reset;
        StoreRequistionHeader.SetRange("User ID", UserId);
        StoreRequistionHeader.SetRange(Status, StoreRequistionHeader.Status::Open);
        if StoreRequistionHeader.Find('-') then begin
            if StoreRequistionHeader.Count >= GeneralSetUp."Max Store Open Documents" then
                Error('This user has documents that have not been used  Do No %1', StoreRequistionHeader."No.");
        end;

        "Request date" := Today;
    end;

    trigger OnModify()
    begin
        //  IF Status=Status::Released THEN
        //     ERROR('You Cannot modify an already Approved Requisition');
        /*
        ReqLines.RESET;
        ReqLines.SETRANGE(ReqLines."Requistion No","No.");
        IF ReqLines.FIND('-') THEN BEGIN
        REPEAT
          ReqLines."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
          ReqLines."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
        //  ReqLines."dimension set id" := "dimension set id";
        UNTIL ReqLines.NEXT=0;
        END;
        */

    end;

    var
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Purchases & Payables Setup";
        UserDept: Record "Imprest Surrender Details";
        RespCenter: Record "Responsibility CenterBR";
        // UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Dimval: Record "Dimension Value";
        ReqLines: Record "Store Requistion Lines";
        DimMgt: Codeunit DimensionManagement;
        UserSetup: Record "User Setup";
        StoreRequistionHeader: Record "Store Requistion Header";
        GeneralSetUp: Record "General Set-Up";

    //[Scope('Internal')]
    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        RespCenter: Record "Responsibility CenterBR";
        DimMgt: Codeunit DimensionManagement;
        NoSrsRel: Record "No. Series Relationship";
    begin
        /*GenLedgerSetup.GET;
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

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSeriesCode: Code[20];
    begin
        GenLedgerSetup.Get();
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          GenLedgerSetup.TESTFIELD(GenLedgerSetup."Staff Grants Nos.")
       ELSE
       */
        GenLedgerSetup.TestField(GenLedgerSetup."Stores Requisition No");
        /*
        IF "Document Type" = "Document Type"::Grant THEN
          NoSeriesCode:=GenLedgerSetup."Staff Grants Nos."
        ELSE
        */

        NoSeriesCode := GenLedgerSetup."Stores Requisition No";

        exit(NoSeriesCode);

    end;

    //[Scope('Internal')]
    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payments', "No."));
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
}

