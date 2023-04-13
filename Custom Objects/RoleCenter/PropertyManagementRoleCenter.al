page 52186820 PropertyManagementRCPage
{
    PageType = RoleCenter;
    Caption = 'SACCO Property Management Role Center';

    layout
    {
        area(RoleCenter)
        {
            // part(Part1; "Headline RC Registry")
            // {
            //     ApplicationArea = All;
            // }
        }
    }

    actions
    {
        area(Sections)
        {
            group(PropertyManagement)
            {
                Caption = 'Properties';
                Image = Administration;

                action("All Property List")
                {
                    Caption = 'All Properties';
                    ApplicationArea = All;
                    RunObject = page "All Property List";
                }
				action("Land Property List")
                {
                    Caption = 'Land Properties';
                    ApplicationArea = All;
                    RunObject = page "Land Property List";
                }
				action("Active Property List")
                {
                    Caption = 'Active Properties';
                    ApplicationArea = All;
                    RunObject = page "Active Property List";
                }
				action("Property Expense List")
                {
                    Caption = 'Property Expenses';
                    ApplicationArea = All;
                    RunObject = page "Property Expense List";
                }
				action("Property Charges")
                {
                    Caption = 'Property Charges';
                    ApplicationArea = All;
                    RunObject = page "Property Charges";
                }
				action("Active Properties")
                {
                    Caption = 'Active Properties 2';
                    ApplicationArea = All;
                    RunObject = page "Active Properties";
                }
				action("Property Category")
                {
                    Caption = 'Property Categories';
                    ApplicationArea = All;
                    RunObject = page "Property Category";
                }
				action("Property List")
                {
                    Caption = 'All Properties 2';
                    ApplicationArea = All;
                    RunObject = page "Property List";
                }
            }
			group(TenantManagement)
            {
                Caption = 'Tenants';
                Image = Administration;

                action("Tenant List")
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    RunObject = page "Tenant List";
                }
				
				action("List - Water Tenants")
                {
                    Caption = 'List - Water Tenants';
                    ApplicationArea = All;
                    RunObject = page "Water Tenant List";
                }
			}
			group(WaterBillManagement)
            {
                Caption = 'Water Bills';
                Image = Administration;

                action("Water Billing rates")
                {
                    Caption = 'Water Billing rates';
                    ApplicationArea = All;
                    RunObject = page "Water Billing rates";
                }
				action("Tenant List-Water Billing")
                {
                    Caption = 'Tenant List';
                    ApplicationArea = All;
                    RunObject = page "Tenant List-Water Billing";
                }
				action("Water Tenant List")
                {
                    Caption = 'Water Tenant List';
                    ApplicationArea = All;
                    RunObject = page "Water Tenant List";
                }
				action("Nairobi Water Bill List")
                {
                    Caption = 'Nairobi Water Bill List';
                    ApplicationArea = All;
                    RunObject = page "Nairobi Water Bill List";
                }
				action("Posted Nairobi Water Bill List")
                {
                    Caption = 'Posted Nairobi Water Bill List';
                    ApplicationArea = All;
                    RunObject = page "Posted Nairobi Water Bill List";
                }
				action("B/hole Water Bill List")
                {
                    Caption = 'B/hole Water Bill List';
                    ApplicationArea = All;
                    RunObject = page "B/hole Water Bill List";
                }
			}
			group(LandlordManagement)
            {
                Caption = 'Landlords';
                Image = Administration;

                action("Landlord List")
                {
                    Caption = 'Landlord List';
                    ApplicationArea = All;
                    RunObject = page "Landlord  List";
                }
				
				action("Landlord Commission Calc list")
                {
                    Caption = 'Landlord Comissions';
                    ApplicationArea = All;
                    RunObject = page "Landlord Commission Calc list";
                }
			}
			group(LeaseManagement)
            {
                Caption = 'Leases';
                Image = Administration;

                action("Lease-List")
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    RunObject = page "Lease-List";
                }
				
				action("Active Lease-List")
                {
                    Caption = 'Active';
                    ApplicationArea = All;
                    RunObject = page "Active Lease-List";
                }
				
				action("Terminated Leases")
                {
                    Caption = 'Terminated';
                    ApplicationArea = All;
                    RunObject = page "Terminated Leases";
                }
				
				action("Approved Leases")
                {
                    Caption = 'Terminated';
                    ApplicationArea = All;
                    RunObject = page "Approved Leases";
                }
				
				action("Billed Leases")
                {
                    Caption = 'Billed';
                    ApplicationArea = All;
                    RunObject = page "Lease-Billed";
                }
				
				action("Expired Leases")
                {
                    Caption = 'Billed';
                    ApplicationArea = All;
                    RunObject = page "Lease-Expired";
                }
				
				action("Lease Charge Review View")
                {
                    Caption = 'Charge Review';
                    ApplicationArea = All;
                    RunObject = page "Lease Charge Review View";
                }
			}
        }
		
		area(Processing)
        {
			action("Lease Billing")
            {
                Caption = 'Lease Billing';
                ApplicationArea = All;
                RunObject = page "Lease-Billing";
            }
			action("Lease-InActivate")
            {
                Caption = 'Lease InActivation';
                ApplicationArea = All;
                RunObject = page "Lease-InActivate";
            }
            action("Lease Commencement")
            {
                Caption = 'Lease Commencement';
                ApplicationArea = All;
                RunObject = page "Lease-Commencement";
            }
			action("Lease Review & Effect")
            {
                Caption = 'Lease Review & Effect';
                ApplicationArea = All;
                RunObject = page "Lease Review-Effect";
            }
        }
		
		area(Creation)
        {
		    action(AddProperty)
            {
                Caption = 'Add Property';
                Image = NewDocument;
                RunObject = page "All Property List";
				RunPageMode = Create;
                ApplicationArea = All;
            }
		    action(AddTenant)
            {
                Caption = 'Add Tenant';
                Image = NewDocument;
                RunObject = page "Customer Card-Tenant";
                ApplicationArea = All;
            }
			action(AddWaterTenant)
            {
                Caption = 'Add Water Tenant';
                Image = NewDocument;
                RunObject = page "Customer Card-Water Tenant";
                ApplicationArea = All;
            }
			action(AddTenantBill)
            {
                Caption = 'Add Tenant Bill';
                Image = NewDocument;
                RunObject = page "Customer Card-Tenant Billing";
                ApplicationArea = All;
            }
            action(AddLandlord)
            {
                Caption = 'Add Landlord';
                Image = NewDocument;
                RunObject = page "Vendor Card-Landlord";
                ApplicationArea = All;
            }
        }
		
		area(Reporting)
        {
            action(PropertyVacancySchedule)
            {
                Caption = 'Property Vacancy Schedule';
                Image = "Report";
                RunObject = Report "Property Vacancy Schedule";
                ApplicationArea = All;
            }
		}
    }
}

profile PropertyManagementProfile
{
    ProfileDescription = 'SACCO Property Management Profile';
    RoleCenter = PropertyManagementRCPage;
    Caption = 'SACCO Property Management';
}