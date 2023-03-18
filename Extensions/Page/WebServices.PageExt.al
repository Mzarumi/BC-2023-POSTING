#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185976 pageextension52185976 extends "Web Services" 
{

    //Unsupported feature: Property Modification (SourceTable) on ""Web Services"(Page 810)".

    layout
    {
        modify("Object Type")
        {
            ApplicationArea = Basic;
            Caption = 'Object Type';
        }
        modify("Object ID")
        {
            ApplicationArea = Basic;
            Caption = 'Object ID';
        }
        modify(ObjectName)
        {
            ApplicationArea = Basic;
        }
        modify("Service Name")
        {
            ApplicationArea = Basic;
            Caption = 'Service Name';
        }
        modify(Published)
        {
            ApplicationArea = Basic;
            Caption = 'Published';
        }
        modify(ODataUrl)
        {
            ApplicationArea = Basic;
        }
        modify(SOAPUrl)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Object Type"(Control 1102601001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Object ID"(Control 1102601003)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ObjectName(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Service Name"(Control 1102601005)".

        modify("All Tenants")
        {
            Visible = false;
        }

        //Unsupported feature: Code Insertion on "Published(Control 1102601007)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            CurrPage.UPDATE;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Published(Control 1102601007)".

        modify(ODataV4Url)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "ODataUrl(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SOAPUrl(Control 7)".

    }
    actions
    {
        // modify("Action")
        // {
        //     Visible = false;
        // }
        modify("<Reload>")
        {
            Visible = false;
        }
        modify("Create Data Set")
        {
            Visible = false;
        }
    }

    var
        NotApplicableTxt: label 'Not applicable';


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //var
        //AllObj: Record AllObj;
    //begin
        /*
        TESTFIELD("Object ID");
        TESTFIELD("Service Name");
        IF NOT ("Object Type" IN ["Object Type"::Codeunit,"Object Type"::Page,"Object Type"::Query]) THEN
          FIELDERROR("Object Type");
        IF ("Object Type" = "Object Type"::Page) AND ("Object ID" = PAGE::"Web Services") THEN
          FIELDERROR("Object ID");
        AllObj.GET("Object Type","Object ID");
        */
    //end;


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //var
        //AllObj: Record AllObj;
    //begin
        /*
        TESTFIELD("Object ID");
        TESTFIELD("Service Name");
        IF NOT ("Object Type" IN ["Object Type"::Codeunit,"Object Type"::Page,"Object Type"::Query]) THEN
          FIELDERROR("Object Type");
        IF ("Object Type" = "Object Type"::Page) AND ("Object ID" = PAGE::"Web Services") THEN
          FIELDERROR("Object ID");
        AllObj.GET("Object Type","Object ID");
        */
    //end;

    local procedure GetODataUrl(): Text
    begin
        if not Rec.Published then
          exit('');

        case Rec."Object Type" of
          Rec."object type"::Page:
            exit(GetUrl(Clienttype::OData,COMPANYNAME,Objecttype::Page,Rec."Object ID"));
          Rec."object type"::Query:
            exit(GetUrl(Clienttype::OData,COMPANYNAME,Objecttype::Query,Rec."Object ID"));
          else
            exit(NotApplicableTxt);
        end;
    end;

    local procedure GetSOAPUrl(): Text
    begin
        if not Rec.Published then
          exit('');

        case Rec."Object Type" of
          Rec."object type"::Page:
            exit(GetUrl(Clienttype::SOAP,COMPANYNAME,Objecttype::Page,Rec."Object ID"));
          Rec."object type"::Codeunit:
            exit(GetUrl(Clienttype::SOAP,COMPANYNAME,Objecttype::Codeunit,Rec."Object ID"));
          else
            exit(NotApplicableTxt);
        end;
    end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).


    //Unsupported feature: Property Deletion (SourceTableTemporary).

}
