tableextension 60001 "Customer Dog Club" extends Customer
{
    fields
    {
        field(60000; "Dog Club Name"; Text[100])
        {
            Caption = 'Dog Club Name';
            DataClassification = CustomerContent;
        }
        field(60001; "Dog Club Membership No."; Code[20])
        {
            Caption = 'Dog Club Membership No.';
            DataClassification = CustomerContent;
        }
        field(60002; "Dog Club Member Since"; Date)
        {
            Caption = 'Dog Club Member Since';
            DataClassification = CustomerContent;
        }
    }
}
