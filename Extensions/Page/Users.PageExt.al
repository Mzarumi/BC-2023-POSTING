#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187200 pageextension52187200 extends Users
{

    //Unsupported feature: Property Insertion (InsertAllowed) on "Users(Page 9800)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on "Users(Page 9800)".

    layout
    {
        modify("User Security ID")
        {
            ApplicationArea = Basic;
        }
        modify("User Name")
        {
            ApplicationArea = Basic;
        }
        modify("Full Name")
        {
            ApplicationArea = Basic;
        }
        modify("Windows Security ID")
        {
            ApplicationArea = Basic;
        }
        modify("Windows User Name")
        {
            ApplicationArea = Basic;
        }
        modify("License Type")
        {
            ApplicationArea = Basic;
        }
        modify("Authentication Email")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Authentication Email"(Control 13)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""User Security ID"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User Name"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Full Name"(Control 5)".


        //Unsupported feature: Property Deletion (Editable) on ""Full Name"(Control 5)".

        modify(State)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Windows Security ID"(Control 7)".


        //Unsupported feature: Code Modification on ""Windows User Name"(Control 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF WindowsUserName = '' THEN
          "Windows Security ID" := ''
        ELSE BEGIN
          UserSID := SID(WindowsUserName);
          WindowsUserName := IdentityManagement.UserName(UserSID);
          IF WindowsUserName <> '' THEN BEGIN
            "Windows Security ID" := UserSID;
            ValidateSid;
            SetUserName;
          END ELSE
            ERROR(Text001Err,WindowsUserName);
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF WindowsUserName = '' THEN BEGIN
          "Windows Security ID" := '';
        END ELSE BEGIN
        #4..9
          END ELSE BEGIN
            ERROR(Text001,WindowsUserName);
          END
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Windows User Name"(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Windows User Name"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""License Type"(Control 14)".


        //Unsupported feature: Property Deletion (Editable) on ""License Type"(Control 14)".


        //Unsupported feature: Property Deletion (ExtendedDatatype) on ""Authentication Email"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Authentication Email"(Control 13)".


        //Unsupported feature: Property Deletion (Editable) on ""Authentication Email"(Control 13)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control18(Control 18)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control17(Control 17)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control20(Control 20)".

        modify(Control33)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control32(Control 32)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control28(Control 28)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control29(Control 29)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control30(Control 30)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control11(Control 11)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control12(Control 12)".

    }
    actions
    {
        modify(Action15)
        {
            ApplicationArea = Basic;
        }
        modify("Permission Sets")
        {
            ApplicationArea = Basic;
        }
        modify("Permission Set by User")
        {
            ApplicationArea = Basic;
        }
        modify("Permission Set by User Group")
        {
            ApplicationArea = Basic;
        }
        modify("User Setup")
        {
            ApplicationArea = Basic;
        }
        modify("Printer Selections")
        {
            ApplicationArea = Basic;
        }
        modify("Warehouse Employees")
        {
            ApplicationArea = Basic;
        }
        modify("FA Journal Setup")
        {
            ApplicationArea = Basic;
        }
        modify(AddMeAsSuper)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "AddMeAsSuper(Action 21)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Action15(Action 15)".

        modify("User Task Groups")
        {
            Visible = false;
        }
        modify("Effective Permissions")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Permission Sets"(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Permission Set by User"(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Permission Set by User Group"(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User Setup"(Action 23)".


        //Unsupported feature: Property Deletion (Promoted) on ""User Setup"(Action 23)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""User Setup"(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Printer Selections"(Action 26)".


        //Unsupported feature: Property Deletion (Promoted) on ""Printer Selections"(Action 26)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Printer Selections"(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Warehouse Employees"(Action 27)".


        //Unsupported feature: Property Deletion (Promoted) on ""Warehouse Employees"(Action 27)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Warehouse Employees"(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""FA Journal Setup"(Action 31)".


        //Unsupported feature: Property Deletion (Promoted) on ""FA Journal Setup"(Action 31)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""FA Journal Setup"(Action 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AddMeAsSuper(Action 21)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "AddMeAsSuper(Action 21)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "AddMeAsSuper(Action 21)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "AddMeAsSuper(Action 21)".

        // modify("Get Users from Office 365")
        // {
        //     Visible = false;
        // }
        modify("Invite External Accountant")
        {
            Visible = false;
        }
        modify("Restore User Default User Groups")
        {
            Visible = false;
        }
        // modify("Refresh all User Groups")
        // {
        //     Visible = false;
        // }
    }


    //Unsupported feature: Property Modification (ExternalDataType) on ""Windows User Name"(Control 6).OnAssistEdit.DSOP(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=14.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.

    var
        Text001: label 'The account %1 is not a valid Windows account.';
        Text002: label 'The account %1 already exists.';
        Text003: label 'The account %1 is not allowed.';
        Text004: label '%1 cannot be empty.';


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");
    NoUserExists := FALSE;
    RestoreUserGroupsForAnotherUser := "User Security ID" <> USERSECURITYID;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");
    NoUserExists := FALSE;
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT UserCard.ManageUsersIsAllowed THEN
      ERROR('');
    IF "User Name" = '' THEN
      ERROR(Text004Err,FIELDCAPTION("User Name"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "User Name" = '' THEN
      ERROR(Text004,FIELDCAPTION("User Name"));
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    NoUserExists := ISEMPTY;

    HideExternalUsers;
    IsSaaS := PermissionManager.SoftwareAsAService;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    NoUserExists := ISEMPTY;
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateSid(PROCEDURE 1)".

    //procedure ValidateSid();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Windows Security ID" = '' THEN
      ERROR(Text001Err,"User Name");

    IF ("Windows Security ID" = 'S-1-1-0') OR ("Windows Security ID" = 'S-1-5-7') THEN
      ERROR(Text003Err,"User Name");

    User.SETFILTER("Windows Security ID","Windows Security ID");
    User.SETFILTER("User Security ID",'<>%1',"User Security ID");
    IF NOT User.ISEMPTY THEN
      ERROR(Text002Err,WindowsUserName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF "Windows Security ID" = '' THEN
      ERROR(Text001,"User Name");

    IF ("Windows Security ID" = 'S-1-1-0') OR ("Windows Security ID" = 'S-1-5-7') THEN
      ERROR(Text003,"User Name");

    User.SETCURRENTKEY("Windows Security ID");
    User.SETFILTER("Windows Security ID","Windows Security ID");
    User.SETFILTER("User Security ID",'<>%1',"User Security ID");
    IF User.FINDFIRST THEN
      ERROR(Text002,WindowsUserName);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "GetSelectionFilter(PROCEDURE 2)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (SourceTableView).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).


    //Unsupported feature: Property Deletion (RefreshOnActivate).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
