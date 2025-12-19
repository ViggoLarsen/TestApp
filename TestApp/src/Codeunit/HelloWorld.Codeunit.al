codeunit 50000 "Hello World"
{
    Access = Public;

    procedure SayHello(): Text
    begin
        exit('Hello, World!');
    end;

    procedure GetCurrentDateTime(): DateTime
    begin
        exit(CurrentDateTime);
    end;

    procedure AddNumbers(FirstNumber: Decimal; SecondNumber: Decimal): Decimal
    begin
        exit(FirstNumber + SecondNumber);
    end;

    procedure IsPositive(Value: Decimal): Boolean
    begin
        exit(Value > 0);
    end;

    procedure ReverseText(InputText: Text): Text
    var
        ResultText: Text;
        Position: Integer;
    begin
        for Position := StrLen(InputText) downto 1 do
            ResultText += InputText[Position];
        exit(ResultText);
    end;
}
