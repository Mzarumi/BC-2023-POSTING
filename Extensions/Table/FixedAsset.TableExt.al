#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186436 tableextension52186436 extends "Fixed Asset" 
{
    fields
    {
        field(50000;"Asset Model";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001;"Asset Tag";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50010;"Budget Controlled";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50011;"Date Filter";Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50012;"Global Dimension 1 Filter";Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(50013;"Global Dimension 2 Filter";Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(50014;"Location Filter";Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50015;"Budget Name";Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Budget Name";
        }
        field(50016;"Budget Qty";Decimal)
        {
            CalcFormula = sum("FA Budget Entry"."Cost Amount" where ("FA No."=field("No."),
                                                                     "Budget Name"=field("Budget Name"),
                                                                     Date=field("Date Filter")));
            FieldClass = FlowField;
        }
        field(50017;No2;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50018;Donated;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50051;"WIP No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(39003930;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(39003931;"Vendor Name";Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(39003932;"LPO No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where (Status=const(Released));

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.",Rec."LPO No.");
                if Vendor.Find('-') then
                Rec."Vendor Name":=Vendor.Name;
            end;
        }
        field(39003933;"Brand Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(39003934;"REG No.";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(39003935;"Chasis No";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(39003936;"Engine No";Code[60])
        {
            DataClassification = ToBeClassified;
        }
        field(39003937;"Asset Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicles,"Other Assets";
        }
    }

    var
        Vendor: Record Vendor;
}
