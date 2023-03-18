#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185852 pageextension52185852 extends "XBRL Schemas" 
{
    layout
    {
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify(targetNamespace)
        {
            ApplicationArea = Basic;
        }
        modify(schemaLocation)
        {
            ApplicationArea = Basic;
        }
        modify("XSD.HASVALUE")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "targetNamespace(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "schemaLocation(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""XSD.HASVALUE"(Control 16)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(Linkbases)
        {
            ApplicationArea = Basic;
        }
        modify(Import)
        {
            ApplicationArea = Basic;
        }
        modify("E&xport")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Linkbases(Action 12)".


        //Unsupported feature: Code Modification on "Import(Action 14).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CALCFIELDS(XSD);
            XMLExists := XSD.HASVALUE;
            FileName := FileMgt.BLOBImport(TempBlob,'*.xsd');
            IF FileName = '' THEN
              EXIT;
            XSD := TempBlob.Blob;
            IF XMLExists THEN
              IF NOT ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN
                EXIT;
            IF STRPOS(FileName,'\') <> 0 THEN BEGIN
              i := STRLEN(FileName);
            #12..18
              schemaLocation := CONVERTSTR(FileName,' ','_');
            CurrPage.SAVERECORD;
            CODEUNIT.RUN(CODEUNIT::"XBRL Import Taxonomy Spec. 2",Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
              IF NOT CONFIRM(Text001,FALSE) THEN
            #9..21
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Import(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xport"(Action 15)".

    }
}
