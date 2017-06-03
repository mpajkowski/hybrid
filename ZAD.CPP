#include <iostream.h>

extern "C" float calcAverage (float *tab, int amount);
extern "C" int signCounter (char *typedText , char sign);

void calc(float *tab);
void checkSignAmount(char *t, char s);

/////////////////////////////////////////////////////////////////////////////

int main()
{
    char sign;
    char text[100];
    char select;
    float *tab;

    cout << "Witaj! \n";

    while (select != '3') {
        cout << "Wybierz program: \n";
        cout << "1. Obliczenie sredniej z elementow tablicy liczb. \n";
        cout << "2. Sprawdzenie ilosci wystapienia znaku w tekscie. \n";
		cout << "3. Zakonczenie pracy programu. \n";
        cin.get(select);

        switch (select) {
            case '1':
                calc(tab);
                break;
            case '2':
                checkSignAmount(text, sign);
                break;
    		case '3':
                cout << "Koniec!";
                break;
            default:
                cout << "Niepoprawny wybor! Wybierz jeszcze raz! \n";
                break;
        }
    }

    return 0;
}

/////////////////////////////////////////////////////////////////////////////

void calc(float *tab)
{
    int amount;   // <---- amount of values, which person want to insert into array

    //---------CHOOSING AMOUNT OF VALUES--------//
    cout << "Ile chcesz wprowadzic liczb do obliczenia sredniej? \n";

    while (!(cin >> amount) || amount < 0 || cin.get() != '\n') {
        cin.clear(); cin.sync();
        cout << "Blad! Wprowadz poprawna wartosc\n";
    }

    tab = new float[amount];

    //--------------INSERT  VALUES--------------//
    for (int i = 0; i < amount; i++) {
        cout <<"Podaj liczbe nr " << i + 1 << " \n";

        while (!(cin >> tab[i]) || cin.get() != '\n') {
            cout << "Wprowadz poprawna wartosc liczbowa\n";
            cin.clear();
            cin.sync();
        }
    }

    //-------RETURNING RESULT FROM ASM MODULE'S FUNCTION-------//
    cout << "Wynik wynosi: " << calcAverage(tab, amount) << "\n";

    delete[] tab;
}

void checkSignAmount(char *t, char s)
{
    //------------INSERT TEXT AND SIGN---------//
    cout << "Podaj tekst!\n";
    cin.sync(); cin.getline(t, 100);
    cout << "Podaj znak!\n";
    cin.get(s);

    //------------RETURN RESULT---------------//
    cout << "Wynik wynosi: " << signCounter(t, s) << "\n";
}