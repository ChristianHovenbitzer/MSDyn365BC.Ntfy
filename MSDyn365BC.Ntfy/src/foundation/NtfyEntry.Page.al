namespace StefanMaron.Ntfy;
using StefanMaron.Ntfy;
page 71179875 NtfyEntryNTSTM
{
    Caption = 'Ntfy Entry';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    DelayedInsert = true;
    SourceTable = NtfyEntryNTSTM;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(UserName; Rec.UserName)
                {
                    //TODO: Visible for administrators 
                    Visible = false;
                }
                field(NtfyTopic; Rec.NtfyTopic) { }
                field(EventType; Rec.EventType) { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetUserFilter();
    end;

    local procedure SetUserFilter()
    begin
        //TODO: Administrators should be able to see all users
        Rec.FilterGroup(2);
        Rec.SetRange(UserName, UserId);
        Rec.FilterGroup(0);
    end;
}