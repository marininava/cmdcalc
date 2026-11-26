// Заголовочный файл
// Содержит только объявления (прототипы) функций, без тел
// Связывает его с calc.c и вызывающий main.c, встроеный механизм линкования
#ifndef CALC_H
#define CALC_H

#include <stdbool.h>

bool is_number(char *text);

#endif