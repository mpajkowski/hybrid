#include <iostream.h>
extern "C" int calcAverage (int *tab, int *amount);
extern "C" int signCounter (char* typedText , char* sign);

int calc(int* tab)
{
    int a = 0;   // <---- amount of values, which person want to insert into array
    int* amount; // <---- pointer
    amount = &a;

    //---------CHOOSING AMOUNT OF VALUES--------//
    cout << "Ile c? \n";
    cin >> a;

    //--------------INSERT  VALUES--------------//
    for (int i = 0; i < a; i++)
    {
        cout <<"Podaj liczbe nr " << i+1 << " \n";
        cin >> tab[i];
    }

    //-------RETURNING RESULT FROM ASM MODULE'S FUNCTION-------//
    cout << "Wynik wynosi: \n";
    return calcAverage(tab, amount);
}

int checkSignAmount(char* t, char* s)
{
    //------------INSERT TEXT AND SIGN---------//
    cout << "Podaj tekst!\n";
    cin >> t;
    cout << "Podaj znak!\n";
    cin >> s;

	//------------RETURN RESULT---------------//
    cout << "Wynik wynosi: \n";
    return signCounter(t,s);
}

int main() {

    char* sign;
    char text[10];
    int tab[10], select;

    cout << "Witaj! \n";
    do {
        cout << "Wybierz program: \n";
        cout << "1. Obliczenie sredniej z elementow tablicy liczb. \n";
        cout << "2. Sprawdzenie ilosci wystapienia znaku w tekscie. \n";
		cout << "3. Zakończenie pracy programu. \n";
        cin >> select;
        if (select == 1) cout << calc(tab) << endl;
        else if (select == 2) cout << checkSignAmount(text,sign) << endl;
		else if (select == 3) cout << "Koniec!";
        else cout << "Niepoprawny wybor! Wybierz jeszcze raz! \n";
    }while (select != 3);

    return 0;
}