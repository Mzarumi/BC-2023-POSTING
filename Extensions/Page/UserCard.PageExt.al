#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187207 pageextension52187207 extends "User Card"
{
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
        modify("License Type")
        {
            ApplicationArea = Basic;
        }
        modify(State)
        {
            ApplicationArea = Basic;
        }
        modify("Expiry Date")
        {
            ApplicationArea = Basic;
        }
        modify("Contact Email")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Visible) on ""Windows Authentication"(Control 11)".

        modify("Windows Security ID")
        {
            ApplicationArea = Basic;
        }
        // modify("Windows User Name Desktop")
        // {

        //     //Unsupported feature: Property Modification (Name) on ""Windows User Name Desktop"(Control 7)".

        //     ApplicationArea = Basic;
        // }
        modify(ACSStatus)
        {
            ApplicationArea = Basic;
        }
        modify("NAV Password Authentication")
        {
            Caption = 'Microsoft Dynamics NAV Password Authentication';
        }
        modify(Password)
        {
            ApplicationArea = Basic;
        }
        modify("Change Password")
        {
            ApplicationArea = Basic;
        }
        modify(WebServiceID)
        {
            ApplicationArea = Basic;
        }
        modify(WebServiceExpiryDate)
        {
            ApplicationArea = Basic;
        }
        modify("Authentication Email")
        {
            ApplicationArea = Basic;
        }
        modify(AuthenticationStatus)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""User Security ID"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User Name"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Full Name"(Control 5)".


        //Unsupported feature: Property Deletion (Editable) on ""Full Name"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""License Type"(Control 8)".


        //Unsupported feature: Property Deletion (Visible) on ""License Type"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "State(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expiry Date"(Control 13)".


        //Unsupported feature: Property Deletion (Visible) on ""Expiry Date"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Contact Email"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Windows Security ID"(Control 12)".

        modify("Windows User Name")
        {
            Visible = false;
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""Windows User Name"(Control 7).OnValidate".

        //trigger (Variable: UserSID)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Windows User Name Desktop"(Control 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateWindowsUserName;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF WindowsUserName = '' THEN BEGIN
          "Windows Security ID" := '';
        END ELSE BEGIN
          UserSID := SID(WindowsUserName);
          WindowsUserName := IdentityManagement.UserName(UserSID);
          IF WindowsUserName <> '' THEN BEGIN
            "Windows Security ID" := UserSID;
            ValidateSid;
            SetUserName;
          END ELSE
            ERROR(Text001,WindowsUserName);
        END;
        */
        //end;

        //Unsupported feature: Property Deletion (AssistEdit) on ""Windows User Name Desktop"(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Windows User Name Desktop"(Control 7)".


        //Unsupported feature: Property Deletion (Visible) on ""Windows User Name Desktop"(Control 7)".


        //Unsupported feature: Property Deletion (Visible) on ""ACS Authentication"(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ACSStatus(Control 22)".


        //Unsupported feature: Property Deletion (Visible) on "ACSStatus(Control 22)".


        //Unsupported feature: Property Deletion (Visible) on ""NAV Password Authentication"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Password(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Change Password"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WebServiceID(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on "WebServiceExpiryDate(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Authentication Email"(Control 28)".


        //Unsupported feature: Property Deletion (Editable) on ""Authentication Email"(Control 28)".

        modify(ApplicationID)
        {
            Visible = false;
        }
        modify(MappedToExchangeIdentifier)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "AuthenticationStatus(Control 32)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "UserGroups(Control 33)".


        //Unsupported feature: Property Deletion (UpdatePropagation) on "UserGroups(Control 33)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Permissions(Control 14)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control17(Control 17)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control18(Control 18)".

    }
    actions
    {
        modify(AcsSetup)
        {

            //Unsupported feature: Property Modification (Name) on "AcsSetup(Action 21)".

            ApplicationArea = Basic;
        }
        modify(ChangePassword)
        {

            //Unsupported feature: Property Modification (Name) on "ChangePassword(Action 24)".

            ApplicationArea = Basic;
        }
        modify(ChangeWebServiceAccessKey)
        {

            //Unsupported feature: Property Modification (Name) on "ChangeWebServiceAccessKey(Action 20)".

            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "AcsSetup(Action 21)".


        //Unsupported feature: Property Deletion (Visible) on "AcsSetup(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ChangePassword(Action 24)".


        //Unsupported feature: Property Deletion (Visible) on "ChangePassword(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ChangeWebServiceAccessKey(Action 20)".


        //Unsupported feature: Property Deletion (Enabled) on "ChangeWebServiceAccessKey(Action 20)".

        modify(DeleteExchangeIdentifier)
        {
            Visible = false;
        }
        // modify(ActionGroup39)
        // {
        //     Visible = false;
        // }
        modify("Effective Permissions")
        {
            Visible = false;
        }
    }


    //Unsupported feature: Property Modification (ExternalDataType) on ""Windows User Name Desktop"(Control 7).OnAssistEdit.DSOP(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Windows User Name Desktop" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=14.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Windows User Name Desktop" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.

    var
        UserSID: Text;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WindowsUserName := IdentityManagement.UserName("Windows Security ID");

    TESTFIELD("User Name");

    Password := IdentityManagement.GetMaskedNavPassword("User Security ID");
    ACSStatus := IdentityManagement.GetACSStatus("User Security ID");
    WebServiceExpiryDate := IdentityManagement.GetWebServiceExpiryDate("User Security ID");
    AuthenticationStatus := IdentityManagement.GetAuthenticationStatus("User Security ID");
    HasExchangeIdentifier := "Exchange Identifier" <> '';
    InitialState := State;

    IF NOT ISNULLGUID("Application ID") THEN
      ApplicationID := "Application ID";

    IF PermissionManager.SoftwareAsAService AND (USERID <> "User Name") THEN BEGIN
      AllowChangeWebServiceAccessKey := FALSE;
      WebServiceID := '*************************************';
    END ELSE BEGIN
      AllowChangeWebServiceAccessKey := TRUE;
      WebServiceID := IdentityManagement.GetWebServicesKey("User Security ID");
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    WebServiceID := IdentityManagement.GetWebServicesKey("User Security ID");
    #6..8
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF NOT ManageUsersIsAllowed THEN
      ERROR('');
    WindowsUserName := '';
    Password := '';
    "Change Password" := FALSE;
    WebServiceID := '';
    CLEAR(WebServiceExpiryDate);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #3..7
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateSid(PROCEDURE 1)".

    //procedure ValidateSid();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF "Windows Security ID" = '' THEN
      ERROR(Text001,"User Name");

    IF ("Windows Security ID" = 'S-1-1-0') OR ("Windows Security ID" = 'S-1-5-7') OR ("Windows Security ID" = 'S-1-5-32-544') THEN
      ERROR(Text003,IdentityManagement.UserName("Windows Security ID"));

    User.SETFILTER("Windows Security ID","Windows Security ID");
    User.SETFILTER("User Security ID",'<>%1',"User Security ID");
    IF NOT User.ISEMPTY THEN
      ERROR(Text002,User."User Name");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    User.SETCURRENTKEY("Windows Security ID");
    User.SETFILTER("Windows Security ID","Windows Security ID");
    User.SETFILTER("User Security ID",'<>%1',"User Security ID");
    IF User.FINDFIRST THEN
      ERROR(Text002,WindowsUserName);
    */
    //end;


    //Unsupported feature: Code Modification on "ValidateAuthentication(PROCEDURE 7)".

    //procedure ValidateAuthentication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UserSecID.RESET;
    IF (UserSecID.COUNT = 1) OR (USERSECURITYID = "User Security ID") THEN BEGIN
      IF IdentityManagement.IsWindowsAuthentication AND ("Windows Security ID" = '') THEN
    #4..15
        EXIT(CONFIRM(Confirm004Qst,FALSE));
    END;

    IF (InitialState = State::Enabled) AND (State = State::Disabled) THEN
      EXIT(CONFIRM(Confirm003Qst,FALSE));

    EXIT(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    IF State <> State::Enabled THEN
    #20..22
    */
    //end;
}
