codeunit 50000 "Hello World"
{
    Access = Public;

    procedure SayHello(): Text
    begin
        exit('Hello, Business Central!');
    end;

    procedure SayHelloTo(Name: Text): Text
    begin
        if Name = '' then
            exit('Hello, stranger!');
        exit('Hello, ' + Name + '!');
    end;

    procedure SayGoodbye(): Text
    begin
        exit('Goodbye, Business Central!');
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

    procedure MultiplyNumbers(FirstNumber: Decimal; SecondNumber: Decimal): Decimal
    begin
        exit(FirstNumber * SecondNumber);
    end;

    procedure IsEven(Value: Integer): Boolean
    begin
        exit(Value mod 2 = 0);
    end;

    procedure SubtractNumbers(FirstNumber: Decimal; SecondNumber: Decimal): Decimal
    begin
        exit(FirstNumber - SecondNumber);
    end;

    procedure DivideNumbers(Numerator: Decimal; Denominator: Decimal): Decimal
    begin
        if Denominator = 0 then
            Error('Cannot divide by zero');
        exit(Numerator / Denominator);
    end;

    procedure IsNegative(Value: Decimal): Boolean
    begin
        exit(Value < 0);
    end;
}
