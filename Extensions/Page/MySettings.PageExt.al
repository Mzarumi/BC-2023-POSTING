#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187069 pageextension52187069 extends "My Settings" 
{
    layout
    {
        modify(Company)
        {
            ToolTip = 'Select the company to work in on all devices. Changing the company will take effect once you sign out and sign in again.';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on "Company(Control 6)".

            Editable = false;
        }
        modify(NewWorkdate)
        {
            ToolTip = 'Select the work date for transactions on all devices. This change only affects the date on new transations you create.';
            ApplicationArea = Basic;
        }
        // modify("Region & Language")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Region & Language"(Control 2)".

        //     Caption = 'General';

        //     //Unsupported feature: Property Modification (Name) on ""Region & Language"(Control 2)".

        // }
        modify(Locale)
        {

            //Unsupported feature: Property Modification (Level) on "Locale(Control 4)".

            ToolTip = 'Specifies the regional settings, such as date and numeric format, on all devices. Changing the regional settings will take effect once you sign out and sign in again.';
            ApplicationArea = Basic;
        }
        modify(Language)
        {

            //Unsupported feature: Property Modification (Level) on "Language(Control 3)".

            ToolTip = 'Specifies the display language on all devices. Changing the language will take effect once you sign out and sign in again.';
            ApplicationArea = Basic;
        }
        modify(TimeZone)
        {

            //Unsupported feature: Property Modification (Level) on "TimeZone(Control 5)".

            ToolTip = 'Select the time zone setting that controls time and date on all devices. Changing the time zone will take effect once you sign out and sign in again.';
            ApplicationArea = Basic;
        }
        modify(Control14)
        {
            Visible = false;
        }
        modify(UserRoleCenter)
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on "Company(Control 6).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            AllowedCompanies.Initialize;

            IF SelectedCompany.GET(COMPANYNAME) THEN
            #4..6

            IF AllowedCompanies.RUNMODAL = ACTION::LookupOK THEN BEGIN
              AllowedCompanies.GETRECORD(SelectedCompany);
              OnCompanyChange(SelectedCompany.Name,IsSetupInProgress);
              IF IsSetupInProgress THEN BEGIN
                VarCompany := COMPANYNAME;
                MESSAGE(STRSUBSTNO(CompanySetUpInProgressMsg,SelectedCompany.Name,PRODUCTNAME.SHORT));
              END ELSE
                VarCompany := SelectedCompany.Name;
              SetCompanyDisplayName;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
              VarCompany := SelectedCompany.Name;
            END;
            */
        //end;


        //Unsupported feature: Code Modification on "NewWorkdate(Control 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NewWorkdate <> WORKDATE THEN
              OnBeforeWorkdateChange(WORKDATE,NewWorkdate);

            WORKDATE := NewWorkdate;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            WORKDATE := NewWorkdate;
            */
        //end;
        // modify(Locale2)
        // {
        //     Visible = false;
        // }
        // modify(Language2)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (Visible) on ""Region & Language"(Control 2)".



        //Unsupported feature: Code Modification on "Locale(Control 4).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PermissionManager.SoftwareAsAService THEN
              LanguageManagement.LookupWindowsLocale(LocaleID);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            LanguageManagement.LookupWindowsLocale(LocaleID);
            */
        //end;

        //Unsupported feature: Property Deletion (Visible) on "Locale(Control 4)".



        //Unsupported feature: Code Modification on "Language(Control 3).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PermissionManager.SoftwareAsAService THEN
              LanguageManagement.LookupApplicationLanguage(LanguageID);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            LanguageManagement.LookupApplicationLanguage(LanguageID);
            */
        //end;

        //Unsupported feature: Property Deletion (Visible) on "Language(Control 3)".



        //Unsupported feature: Code Insertion (VariableCollection) on "TimeZone(Control 5).OnAssistEdit".

        //trigger (Variable: TimeZone)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "TimeZone(Control 5).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PermissionManager.SoftwareAsAService THEN
              ConfPersonalizationMgt.LookupTimeZone(TimeZoneID);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            TimeZone.SETCURRENTKEY("Display Name");
            TimeZone.ASCENDING(TRUE);

            IF PAGE.RUNMODAL(PAGE::"Time Zones",TimeZone) = ACTION::LookupOK THEN
              TimeZoneID := TimeZone.ID;
            */
        //end;

        //Unsupported feature: Property Deletion (Visible) on "TimeZone(Control 5)".

        modify(RoleCenterOverviewEnabled)
        {
            Visible = false;
        }
        modify(MyNotificationsLbl)
        {
            Visible = false;
        }
        modify(LastLoginInfo)
        {
            Visible = false;
        }
        // moveafter(Control1;"Region & Language")
        // moveafter(General;Language)
        moveafter(Language;Locale)
        moveafter(Locale;TimeZone)
    }


    //Unsupported feature: Property Modification (Id) on "Language(Control 3).OnAssistEdit.LanguageManagement(Variable 1001)".

    //var
        //>>>> ORIGINAL VALUE:
        //Language : 1001;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Language : 1000;
        //Variable type has not been exported.

    var
        TimeZone: Record "Time Zone";

    var
        ReSignInMsg: label 'You must sign out and then sign in again to have the changes take effect.', Comment='"sign out" and "sign in" are the same terms as shown in the Dynamics NAV client.';


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WITH UserPersonalization DO BEGIN
          GET(USERSECURITYID);
          ProfileID := "Profile ID";
          ProfileAppID := "App ID";
          ProfileScope := Scope;
          LanguageID := "Language ID";
          LocaleID := "Locale ID";
          TimeZoneID := "Time Zone";
          IF COMPANYNAME <> Company THEN BEGIN
            VarCompany := COMPANYNAME;
            // Mark that the company is changed
            IsCompanyChanged := TRUE
          END ELSE
            VarCompany := Company;
          NewWorkdate := WORKDATE;
          SetCompanyDisplayName;
        END;
        IF RoleCenterNotificationMgt.IsEvaluationNotificationClicked THEN BEGIN
          // change notification state from Clicked to Enabled in order to avoid appearing a new notification
          // on this page after decline of terms & conditions in the 30 days trial wizard
          RoleCenterNotificationMgt.EnableEvaluationNotification;
          COMMIT;
        END;
        RoleCenterOverviewEnabled := RolecenterSelectorMgt.GetShowStateFromUserPreference(USERID);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WITH UserPersonalization DO BEGIN
          GET(USERSECURITYID);
        #6..8
          VarCompany := Company;
          NewWorkdate := WORKDATE;
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF CloseAction <> ACTION::Cancel THEN BEGIN
          WITH UserPersonalization DO BEGIN
            GET(USERSECURITYID);

            IF ("Language ID" <> LanguageID) OR
               ("Locale ID" <> LocaleID) OR
               ("Time Zone" <> TimeZoneID) OR
               (Company <> VarCompany) OR IsCompanyChanged OR
               ("Profile ID" <> ProfileID)
            THEN BEGIN
              AnythingUpdated := TRUE;
              sessionSetting.INIT;

              IF Company <> VarCompany THEN BEGIN
                WasEvaluation := IsEvaluation;
                sessionSetting.COMPANY := VarCompany;
              END;

              IF "Profile ID" <> ProfileID THEN BEGIN
                sessionSetting.PROFILEID := ProfileID;
                sessionSetting.PROFILEAPPID := ProfileAppID;
                sessionSetting.PROFILESYSTEMSCOPE := ProfileScope = ProfileScope::System;
              END;

              IF "Language ID" <> LanguageID THEN BEGIN
                OnBeforeLanguageChange("Language ID",LanguageID);
                sessionSetting.LANGUAGEID := LanguageID;
              END;

              IF "Locale ID" <> LocaleID THEN
                sessionSetting.LOCALEID := LocaleID;

              IF "Time Zone" <> TimeZoneID THEN
                sessionSetting.TIMEZONE := TimeZoneID;
            END;
          END;

          IF WasEvaluation AND IsTrial THEN
            MESSAGE(STRSUBSTNO(TrialStartMsg,PRODUCTNAME.MARKETING));

          OnQueryClosePageEvent(LanguageID,LocaleID,TimeZoneID,VarCompany,ProfileID);

          IF AnythingUpdated THEN
            sessionSetting.REQUESTSESSIONUPDATE(TRUE);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF CloseAction = ACTION::OK THEN
        #2..7
               (Company <> VarCompany)
            THEN BEGIN
              VALIDATE("Language ID",LanguageID);
              VALIDATE("Locale ID",LocaleID);
              VALIDATE("Time Zone",TimeZoneID);
              VALIDATE(Company,VarCompany);
              MODIFY;
              MESSAGE(ReSignInMsg);
            END;
          END;
        */
    //end;


    //Unsupported feature: Code Modification on "GetTimeZone(PROCEDURE 2)".

    //procedure GetTimeZone();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TimeZone.SETRANGE(ID,TimeZoneID);
        IF TimeZone.FINDFIRST THEN
          EXIT(TimeZone."Display Name");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF TimeZone.GET(TimeZoneID) THEN
          EXIT(TimeZone."Display Name");
        */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
