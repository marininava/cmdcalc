// Файл реализации методов обьявленых в calc.h
#include <string.h>

#include "calc.h"

bool is_number(char *text)
{
    int i = 0;

    if (text[0] == '-') {
        i = 1;
    }
    if (text[i] == '\0') {
        return false;
    }
    while (text[i] != '\0') {
        if (text[i] < '0' || text[i] > '9') {
            return false;
        }
        i++;
    }
    return true;
}