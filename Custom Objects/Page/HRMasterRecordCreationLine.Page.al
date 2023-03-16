page 52186530 "HR Master Record Creation Line"
{
    PageType = ListPart;
    SourceTable = "Master Record Creation Lines";

    layout
    {
        area(content)
        {
            group(Control3)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                    OptionCaption = ',,Dimension,,,,,,Dimension Value';

                    trigger OnValidate()
                    begin
                        UpdateControls;
                    end;
                }
                repeater(Group)
                {
                    Caption = 'G/L Account';
                    Visible = "G/LAccountVisible";
                    field("Suggested No."; Rec."Suggested No.")
                    {
                    }
                    field("G/L Account Name"; Rec.Name)
                    {
                        Caption = 'G/L Account Name';
                    }
                    field("Debit/Credit"; Rec."Debit/Credit")
                    {
                    }
                    field("Account Type"; Rec."Account Type")
                    {
                    }
                    field(Blocked; Rec.Blocked)
                    {
                    }
                    field("General Posting Type"; Rec."General Posting Type")
                    {
                    }
                    field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                    }
                    field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                    {
                    }
                    field("VAT. Bus. Posting Group"; Rec."VAT. Bus. Posting Group")
                    {
                    }
                    field("VAT. Prod. Posting Group"; Rec."VAT. Prod. Posting Group")
                    {
                    }
                    field("Income/Balance Sheet A/C"; Rec."Income/Balance Sheet A/C")
                    {
                    }
                    field(Reason; Rec.Reason)
                    {
                    }
                    field("Created Document No."; Rec."Created Document No.")
                    {
                        Editable = false;
                    }
                    field("Created Document Name"; Rec."Created Document Name")
                    {
                        Editable = false;
                    }
                }
                repeater(Bank)
                {
                    Caption = 'Bank';
                    Visible = BankVisible;
                    field("Bank Name"; Rec.Name)
                    {
                        Caption = 'Name';
                    }
                    field("Bank Address"; Rec.Address)
                    {
                    }
                    field("Bank Post Code"; Rec."Post Code")
                    {
                        Caption = 'Post Code';
                    }
                    field("Bank City"; Rec.City)
                    {
                        Caption = 'City';
                    }
                    field("Bank Country/Region Code"; Rec."Country/Region Code")
                    {
                        Caption = 'Country/Region Code';
                    }
                    field("BankPhone No."; Rec."Phone No.")
                    {
                        Caption = 'Phone No.';
                    }
                    field("Bank Branch No."; Rec."Bank Branch No.")
                    {
                    }
                    field("Bank Type"; Rec."Bank Type")
                    {
                    }
                    field("BankFax No."; Rec."Fax No.")
                    {
                        Caption = 'Fax No.';
                    }
                    field("Bank Email"; Rec.Email)
                    {
                        Caption = ' Email';
                    }
                    field("Bank Home Page"; Rec."Home Page")
                    {
                        Caption = 'Home Page';
                    }
                    field("Bakn Currency Code"; Rec."Currency Code")
                    {
                        Caption = 'Currency Code';
                    }
                    field("Bank Account Posting Groups"; Rec."Bank Account Posting Groups")
                    {
                    }
                    field("Bank Created Document No."; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("Bank Created Document Name"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
                repeater("Customer/Vendor")
                {
                    Caption = 'Customer/Vendor';
                    Visible = "Customer/VendorVisible";
                    field(Name; Rec.Name)
                    {
                        Caption = 'Name';
                    }
                    field(Address; Rec.Address)
                    {
                        Caption = 'Address';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                    }
                    field(City; Rec.City)
                    {
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                    }
                    field(Email; Rec.Email)
                    {
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                    }
                    field("Vendor/Customer Posting Group"; Rec."Vendor/Customer Posting Group")
                    {
                    }
                    field("Cust VAT. Bus. Posting Group"; Rec."VAT. Bus. Posting Group")
                    {
                        Caption = 'VAT. Bus. Posting Group';
                    }
                    field("Cust Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                    {
                        Caption = 'Gen. Bus. Posting Group';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                    }
                    field("Cust Created Document No."; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("Cust Created Document Name"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
                repeater(Item)
                {
                    Caption = 'Item';
                    Visible = ItemVisible;
                    field("ItemName "; Rec.Name)
                    {
                        Caption = 'Description';
                    }
                    field("Base Unit of Measure"; Rec."Base Unit of Measure")
                    {
                    }
                    field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
                    {
                    }
                    field("<Item VAT. Prod. Posting Group>"; Rec."VAT. Prod. Posting Group")
                    {
                        Caption = 'VAT. Prod. Posting Group';
                    }
                    field("Item Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                    {
                        Caption = 'Gen. Prod. Posting Group';
                    }
                    field("Inventory Posting Group"; Rec."Inventory Posting Group")
                    {
                    }
                    field("Item Created Document No."; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("Item Created Document Name"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
                repeater("Fixed Asset")
                {
                    Caption = 'Fixed Asset';
                    Visible = FixedAssetVisible;
                    field("FA Name"; Rec.Name)
                    {
                        Caption = 'Description';
                    }
                    field("Depreciation Book"; Rec."Depreciation Book")
                    {
                    }
                    field("FA Posting Group"; Rec."FA Posting Group")
                    {
                    }
                    field("Depreciation Method"; Rec."Depreciation Method")
                    {
                    }
                    field("FA Class Code"; Rec."FA Class Code")
                    {
                    }
                    field("FA Subclass Code"; Rec."FA Subclass Code")
                    {
                    }
                    field("FA Location Code"; Rec."FA Location Code")
                    {
                    }
                    field("<FA Created Document No.>"; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("<FA Created Document Name>"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
                repeater("Dimensions Value")
                {
                    Caption = 'Dimensions Value';
                    Visible = DimensionValueVisible;
                    field("Dimension Code"; Rec."Dimension Code")
                    {
                    }
                    field("Dimension Name"; Rec."Dimension Name")
                    {
                    }
                    field("Dimension Value Code"; Rec."Dimension Value Code")
                    {
                    }
                    field("Dimension Value Name"; Rec."Dimension Value Name")
                    {
                    }
                    field("<DimValCreated Document No.>"; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("<DimValCreated Document Name>"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
                repeater(Dimension)
                {
                    Caption = 'Dimension';
                    Visible = DimensionsVisible;
                    field("Dimension Code Insert"; Rec."Dimension Code Insert")
                    {
                        Caption = 'Dimension Code';
                    }
                    field("Dimension Name Insert"; Rec."Dimension Name Insert")
                    {
                        Caption = 'Dimension Name';
                    }
                    field("<Dim Created Document No.>"; Rec."Created Document No.")
                    {
                        Caption = 'Created Document No.';
                    }
                    field("<Dim Created Document Name>"; Rec."Created Document Name")
                    {
                        Caption = 'Created Document Name';
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        CurrPage.Update;
        UpdateControls;
    end;

    var
        "G/LAccountVisible": Boolean;
        BankVisible: Boolean;
        "Customer/VendorVisible": Boolean;
        ItemVisible: Boolean;
        FixedAssetVisible: Boolean;
        DimensionsVisible: Boolean;
        DimensionValueVisible: Boolean;

    local procedure UpdateControls()
    begin
        case Rec.Type of
            Rec.Type::"G/L Account":
                begin
                    "G/LAccountVisible" := true;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Customer, Rec.Type::Vendor:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := true;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Bank:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := true;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Item:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := true;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::"Fixed Asset":
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := true;
                    DimensionsVisible := false;
                    DimensionValueVisible := false;
                end;
            Rec.Type::Dimension:
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := true;
                    DimensionValueVisible := false;
                end;
            Rec.Type::"Dimension Value":
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := false;
                    DimensionValueVisible := true;
                end;


           Rec.Type::" ":  //This will be the default when the page is opened
                begin
                    "G/LAccountVisible" := false;
                    BankVisible := false;
                    "Customer/VendorVisible" := false;
                    ItemVisible := false;
                    FixedAssetVisible := false;
                    DimensionsVisible := true;
                    DimensionValueVisible := false;
                end;






        end; //end of cases
    end;
}

