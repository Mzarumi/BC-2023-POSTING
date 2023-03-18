#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186410 tableextension52186410 extends "Company Information" 
{
    fields
    {
        field(50000;"Company TIN";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001;"Company Watermark2";Blob)
        {
            DataClassification = ToBeClassified;
            SubType = Bitmap;
        }
        field(50002;"PIN No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003;Mission;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50004;"Receipt Statement";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50005;"Use Sales Agents";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50006;"Accrue Registration Fee";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50007;"Sacco Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50008;"ED Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
}
