#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186402 tableextension52186402 extends "G/L Account" 
{
    fields
    {

        //Unsupported feature: Property Modification (Name) on ""Account Category"(Field 8)".


        //Unsupported feature: Property Modification (Name) on ""Dimension Set ID Filter"(Field 400)".


        //Unsupported feature: Code Modification on ""Account Category"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Account Category" = "Account Category"::" " THEN
              EXIT;

            IF "Account Category" IN ["Account Category"::Income,"Account Category"::"Cost of Goods Sold","Account Category"::Expense] THEN
              "Income/Balance" := "Income/Balance"::"Income Statement"
            ELSE
              "Income/Balance" := "Income/Balance"::"Balance Sheet";
            IF "Account Category" <> xRec."Account Category" THEN
              "Account Subcategory Entry No." := 0;

            UpdateAccountCategoryOfSubAccounts;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            // IF "Account Category" = "Account Category"::" " THEN
            //  EXIT;
            //
            // IF "Account Category" IN ["Account Category"::Income,"Account Category"::"Cost of Goods Sold","Account Category"::Expense] THEN
            //  "Income/Balance" := "Income/Balance"::"Income Statement"
            // ELSE
            //  "Income/Balance" := "Income/Balance"::"Balance Sheet";
            // IF "Account Category" <> xRec."Account Category" THEN
            //  "Account Subcategory Entry No." := 0;
            //
            // UpdateAccountCategoryOfSubAccounts;
            */
        //end;
        field(50000;"Budget Controlled";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001;"Account Categor 2";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Capital Fund","Revaluation Reserve","Revenue Reserve","Year PL ","Prior year","Long Term Liability","Current Liability","Fixed Asset","Current Asset",Revenue,"Direct Costs",Expense;

            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                Rec.TestNoEntriesExist(Rec.FieldCaption(Rec."Account Category"));
            end;
        }
        field(50002;"Global Dimension 3 Filter";Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));
        }
        field(50003;"Global Dimension 4 Filter";Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Global Dimension 4 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));
        }
        field(50004;"Expense Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Expense Code";

            trigger OnValidate()
            begin
                  //Expense code only applicable if account type is posting and Budgetary control is applicable
                  Rec.TestField(Rec."Account Type",Rec."account type"::Posting);
                  Rec.TestField(Rec."Budget Controlled",true);
            end;
        }
        field(50005;"Grant Expense";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006;"Budget Control Account";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";

            trigger OnValidate()
            var
                GLAcc: Record "G/L Account";
            begin
                   if GLAcc.Get(Rec."Budget Control Account") then begin
                     if GLAcc."Account Type"<>GLAcc."account type"::Total  then
                      Error('The Budget Control Account can only be of Account Type Total');
                  end;
            end;
        }
        field(50007;"Budget Reporting";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008;"Dimension Set ID Filter 2";Integer)
        {
            Editable = false;
            FieldClass = FlowFilter;
            TableRelation = "Dimension Set Entry"."Dimension Set ID";
        }
        field(39004240;"Old Acc. No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Account Category"(Key)".
        // 
        // key(Key1;"Account Category 1")
        // {
        // }
    }

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        GLLedgEntry: Record "G/L Entry";
    begin
        
         //To prevent change of field
         /*GLLedgEntry.SETCURRENTKEY(GLLedgEntry."G/L Account No.");
         GLLedgEntry.SETRANGE("G/L Account No.","No.");
        IF GLLedgEntry.FIND('-') THEN
          ERROR(
            Text000,
            CurrentFieldName);*/

    end;
}
