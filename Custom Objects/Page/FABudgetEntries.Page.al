// page 52185965 "FA Budget Entries"
// {
//     Caption = 'FA Budget Entries';
//     DataCaptionExpression = GetCaption;
//     DelayedInsert = true;
//     DeleteAllowed = false;
//     PageType = List;
//     SourceTable = "FA Budget Entry";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("Budget Name"; Rec."Budget Name")
//                 {
//                     Editable = false;
//                 }
//                 field(Date; Rec.Date)
//                 {
//                 }
//                 field("FA No."; Rec."FA No.")
//                 {
//                 }
//                 field("FA Posting Type"; Rec."FA Posting Type")
//                 {
//                 }
//                 field("Depreciation Book Code"; Rec."Depreciation Book Code")
//                 {
//                 }
//                 field(Description; Rec.Description)
//                 {
//                 }
//                 field("Source Type"; Rec."Source Type")
//                 {
//                     Visible = false;
//                 }
//                 field("Source No."; Rec."Source No.")
//                 {
//                     Visible = false;
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     Enabled = "Global Dimension 1 CodeEnable";
//                     Visible = "Global Dimension 1 CodeVisible";
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                     Enabled = "Global Dimension 2 CodeEnable";
//                     Visible = "Global Dimension 2 CodeVisible";
//                 }
//                 field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
//                 {
//                     Enabled = "Budget Dimension 1 CodeEnable";
//                     Visible = "Budget Dimension 1 CodeVisible";
//                 }
//                 field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
//                 {
//                     Enabled = "Budget Dimension 2 CodeEnable";
//                     Visible = "Budget Dimension 2 CodeVisible";
//                 }
//                 field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
//                 {
//                     Enabled = "Budget Dimension 3 CodeEnable";
//                     Visible = "Budget Dimension 3 CodeVisible";
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     Visible = false;
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                     Visible = false;
//                 }
//                 field("Cost Amount"; Rec."Cost Amount")
//                 {
//                 }
//                 field("Sales Amount"; Rec."Sales Amount")
//                 {
//                     Visible = false;
//                 }
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     Editable = false;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("<Action23>")
//             {
//                 Caption = 'Ent&ry';
//                 Image = Entry;
//                 action("<Action24>")
//                 {
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     ShortCutKey = 'Shift+Ctrl+D';

//                     trigger OnAction()
//                     begin
//                         ShowDimensions;
//                         CurrPage.SaveRecord;
//                     end;
//                 }
//                 action("Update Global Budget")
//                 {
//                     Caption = 'Update Global Budget';
//                     Image = CopyLedgerToBudget;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     Visible = false;

//                     trigger OnAction()
//                     var
//                         FixedAssetsDet: Record "Fixed Asset";
//                         FAPostingGRP: Record "FA Posting Group";
//                         BudgetGl: Code[20];
//                         FixedAssetsDep: Record "FA Depreciation Book";
//                     begin
//                         if "Transferred to budget" <> false then Error('Budget Line already transferred to budget');
//                         BudgetEntry.Init;
//                         BudgetEntry."Entry No." := 0;
//                         BudgetEntry."Budget Name" := "Budget Name";
//                         BudgetEntry.Date := Date;
//                         FixedAssetsDet.Reset;
//                         FixedAssetsDet.SetRange(FixedAssetsDet."No.", "FA No.");
//                         FixedAssetsDet.FindSet;
//                         begin
//                             FixedAssetsDep.Reset;
//                             FixedAssetsDep.SetRange(FixedAssetsDep."FA No.", "FA No.");
//                             FixedAssetsDep.FindSet;
//                             FAPostingGRP.Reset;
//                             FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDep."FA Posting Group");
//                             FAPostingGRP.FindSet;
//                             if "FA Posting Type" = "FA Posting Type"::Maintenance then begin
//                                 BudgetGl := FAPostingGRP."Maintenance Expense Account";
//                                 if BudgetGl = '' then
//                                     Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', "FA No.");
//                             end
//                             else
//                                 if "FA Posting Type" = "FA Posting Type"::"Acquisition Cost" then begin
//                                     BudgetGl := FAPostingGRP."Acquisition Cost Account";
//                                     if BudgetGl = '' then
//                                         Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', "FA No.");
//                                 end;
//                             //To Accomodate any Additional Item under Custom 1 and Custom 2
//                             // else
//                             //     if "FA Posting Type" = "FA Posting Type"::"3" then begin
//                             //         BudgetGl := FAPostingGRP."Custom 2 Account";
//                             //         if BudgetGl = '' then
//                             //             Error('Ensure Fixed Asset No %1 has the %2 G/L Account', "FA No.",
//                             //            FAPostingGRP."Custom 1 Account");
//                             //     end
//                             //     else
//                             //         if "FA Posting Type" = "FA Posting Type"::"4" then begin
//                             //             BudgetGl := FAPostingGRP."Custom 2 Account";
//                             //             if BudgetGl = '' then
//                             //                 Error('Ensure Fixed Asset No %1 has the %2 G/L Account', "FA No.",
//                             //                 FAPostingGRP."Custom 1 Account");
//                             //         end;
//                         end;

//                         BudgetEntry."G/L Account No." := BudgetGl;
//                         BudgetEntry.Amount := "Cost Amount";
//                         BudgetEntry."Global Dimension 1 Code" := "Global Dimension 1 Code";
//                         BudgetEntry."Global Dimension 2 Code" := "Global Dimension 2 Code";
//                         BudgetEntry.Insert(true);

//                         Message('G/L budget updated successfully');
//                         "Transferred to budget" := true;
//                         Modify;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         if "Entry No." <> 0 then
//             if "Dimension Set ID" <> xRec."Dimension Set ID" then
//                 LowestModifiedEntryNo := "Entry No.";
//     end;

//     trigger OnClosePage()
//     var
//         UpdateItemAnalysisView: Codeunit "Update Item Analysis View";
//     begin
//         if LowestModifiedEntryNo < 2147483647 then
//             UpdateItemAnalysisView.SetLastBudgetEntryNo(LowestModifiedEntryNo - 1);
//     end;

//     trigger OnDeleteRecord(): Boolean
//     begin
//         if "Entry No." < LowestModifiedEntryNo then
//             LowestModifiedEntryNo := "Entry No.";
//         exit(true);
//     end;

//     trigger OnInit()
//     begin
//         "Budget Dimension 3 CodeEnable" := true;
//         "Budget Dimension 2 CodeEnable" := true;
//         "Budget Dimension 1 CodeEnable" := true;
//         "Global Dimension 2 CodeEnable" := true;
//         "Global Dimension 1 CodeEnable" := true;
//         "Budget Dimension 3 CodeVisible" := true;
//         "Budget Dimension 2 CodeVisible" := true;
//         "Budget Dimension 1 CodeVisible" := true;
//         "Global Dimension 2 CodeVisible" := true;
//         "Global Dimension 1 CodeVisible" := true;
//         LowestModifiedEntryNo := 2147483647;
//     end;

//     trigger OnModifyRecord(): Boolean
//     begin
//         if "Entry No." < LowestModifiedEntryNo then
//             LowestModifiedEntryNo := "Entry No.";
//         exit(true);
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         //"Budget Name" := GETRANGEMIN("Budget Name");
//         if BudgetaryControl.Get then
//             "Budget Name" := BudgetaryControl."Current Budget Code";
//         //"Analysis Area" := GETRANGEMIN("Analysis Area");
//         //IF (faBudgetName.Name <> "Budget Name") THEN
//         //  faBudgetName.GET("Analysis Area","Budget Name");

//         if GetFilter("FA No.") <> '' then
//             "FA No." := GetFirstItem(GetFilter("FA No."));
//         Date := GetFirstDate(GetFilter(Date));
//         "User ID" := UserId;

//         if GetFilter("Global Dimension 1 Code") <> '' then
//             "Global Dimension 1 Code" :=
//               GetFirstDimValue(GLSetup."Global Dimension 1 Code", GetFilter("Global Dimension 1 Code"));

//         if GetFilter("Global Dimension 2 Code") <> '' then
//             "Global Dimension 2 Code" :=
//               GetFirstDimValue(GLSetup."Global Dimension 2 Code", GetFilter("Global Dimension 2 Code"));

//         if GetFilter("Budget Dimension 1 Code") <> '' then
//             "Budget Dimension 1 Code" :=
//               GetFirstDimValue(faBudgetName."Budget Dimension 1 Code", GetFilter("Budget Dimension 1 Code"));

//         if GetFilter("Budget Dimension 2 Code") <> '' then
//             "Budget Dimension 2 Code" :=
//               GetFirstDimValue(faBudgetName."Budget Dimension 2 Code", GetFilter("Budget Dimension 2 Code"));

//         if GetFilter("Budget Dimension 3 Code") <> '' then
//             "Budget Dimension 3 Code" :=
//               GetFirstDimValue(faBudgetName."Budget Dimension 3 Code", GetFilter("Budget Dimension 3 Code"));

//         if GetFilter("Location Code") <> '' then
//             "Location Code" := GetFirstLocationCode(GetFilter("Location Code"));
//     end;

//     trigger OnOpenPage()
//     begin
//         if GetFilter("Budget Name") = '' then
//             faBudgetName.Init
//         else begin
//             //  COPYFILTER("Analysis Area",fabudgetName."Analysis Area");
//             CopyFilter("Budget Name", faBudgetName.Name);
//             faBudgetName.FindFirst;
//         end;

//         CurrPage.Editable := not faBudgetName.Blocked;
//         GLSetup.Get;
//         "Global Dimension 1 CodeEnable" := GLSetup."Global Dimension 1 Code" <> '';
//         "Global Dimension 2 CodeEnable" := GLSetup."Global Dimension 2 Code" <> '';
//         "Budget Dimension 1 CodeEnable" := faBudgetName."Budget Dimension 1 Code" <> '';
//         "Budget Dimension 2 CodeEnable" := faBudgetName."Budget Dimension 2 Code" <> '';
//         "Budget Dimension 3 CodeEnable" := faBudgetName."Budget Dimension 3 Code" <> '';
//         "Global Dimension 1 CodeVisible" := GLSetup."Global Dimension 1 Code" <> '';
//         "Global Dimension 2 CodeVisible" := GLSetup."Global Dimension 2 Code" <> '';
//         "Budget Dimension 1 CodeVisible" := faBudgetName."Budget Dimension 1 Code" <> '';
//         "Budget Dimension 2 CodeVisible" := faBudgetName."Budget Dimension 2 Code" <> '';
//         "Budget Dimension 3 CodeVisible" := faBudgetName."Budget Dimension 3 Code" <> '';
//     end;

//     var
//         GLSetup: Record "General Ledger Setup";
//         faBudgetName: Record "G/L Budget Name";
//         LowestModifiedEntryNo: Integer;
//         [InDataSet]
//         "Global Dimension 1 CodeVisible": Boolean;
//         [InDataSet]
//         "Global Dimension 2 CodeVisible": Boolean;
//         [InDataSet]
//         "Budget Dimension 1 CodeVisible": Boolean;
//         [InDataSet]
//         "Budget Dimension 2 CodeVisible": Boolean;
//         [InDataSet]
//         "Budget Dimension 3 CodeVisible": Boolean;
//         [InDataSet]
//         "Global Dimension 1 CodeEnable": Boolean;
//         [InDataSet]
//         "Global Dimension 2 CodeEnable": Boolean;
//         [InDataSet]
//         "Budget Dimension 1 CodeEnable": Boolean;
//         [InDataSet]
//         "Budget Dimension 2 CodeEnable": Boolean;
//         [InDataSet]
//         "Budget Dimension 3 CodeEnable": Boolean;
//         BudgetaryControl: Record "Budgetary Control Setup";
//         BudgetEntry: Record "G/L Budget Entry";

//     local procedure GetFirstItem(faFilter: Text[250]): Code[20]
//     var
//         FA: Record "Fixed Asset";
//     begin
//         with FA do begin
//             SetFilter("No.", faFilter);
//             if FindFirst then
//                 exit("No.");

//             exit('');
//         end;
//     end;

//     local procedure GetFirstDate(DateFilter: Text[250]): Date
//     var
//         Period: Record Date;
//     begin
//         if DateFilter = '' then
//             exit(0D);
//         with Period do begin
//             SetRange("Period Type", "Period Type"::Date);
//             SetFilter("Period Start", DateFilter);
//             if FindFirst then
//                 exit("Period Start");

//             exit(0D);
//         end;
//     end;

//     local procedure GetFirstDimValue(DimCode: Code[20]; DimValFilter: Text[250]): Code[20]
//     var
//         DimVal: Record "Dimension Value";
//     begin
//         if (DimCode = '') or (DimValFilter = '') then
//             exit('');
//         with DimVal do begin
//             SetRange("Dimension Code", DimCode);
//             SetFilter(Code, DimValFilter);
//             if FindFirst then
//                 exit(Code);

//             exit('');
//         end;
//     end;

//     local procedure GetFirstLocationCode(LocationCodetFilter: Text[250]): Code[10]
//     var
//         Location: Record Location;
//     begin
//         with Location do begin
//             SetFilter(Code, LocationCodetFilter);
//             if FindFirst then
//                 exit(Code);

//             exit('');
//         end;
//     end;
// }

