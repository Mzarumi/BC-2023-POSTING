#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185853 pageextension52185853 extends "XBRL Linkbases" 
{
    layout
    {
        modify(Type)
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("XML.HASVALUE")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Type(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""XML.HASVALUE"(Control 12)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(Import)
        {
            ApplicationArea = Basic;
        }
        modify("E&xport")
        {
            ApplicationArea = Basic;
        }
        modify("Apply to Taxonomy")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Code Modification on "Import(Action 15).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CALCFIELDS(XML);
            XMLExists := XML.HASVALUE;
            "File Name" := COPYSTR(FileMgt.BLOBImport(TempBlob,'*.xml'),1,MAXSTRLEN("File Name"));
            IF "File Name" = '' THEN
              EXIT;
            XML := TempBlob.Blob;
            IF XMLExists THEN
              IF NOT ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN
                EXIT;
            CurrPage.SAVERECORD;
            COMMIT;
            IF ConfirmManagement.ConfirmProcess(Text002,TRUE) THEN
              CASE Type OF
                Type::Label:
                  XBRLImport.ImportLabels(Rec);
            #16..19
                Type::Reference:
                  XBRLImport.ImportReference(Rec);
              END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..7
              IF NOT CONFIRM(Text001,FALSE) THEN
            #9..11
            IF CONFIRM(Text002,FALSE) THEN
            #13..22
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Import(Action 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xport"(Action 16)".



        //Unsupported feature: Code Modification on ""Apply to Taxonomy"(Action 20).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ConfirmManagement.ConfirmProcess(STRSUBSTNO(Text003,"XBRL Taxonomy Name"),TRUE) THEN BEGIN
              XBRLLinkbase := Rec;
              CurrPage.SETSELECTIONFILTER(XBRLLinkbase);
              WITH XBRLLinkbase DO
            #5..15
                    END;
                  UNTIL NEXT = 0;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF CONFIRM(STRSUBSTNO(Text003,"XBRL Taxonomy Name"),FALSE) THEN BEGIN
            #2..18
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Apply to Taxonomy"(Action 20)".

    }
}
