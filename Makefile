# Какой компилятор использовать (тот же, что в compile.sh)
CC     = gcc

# Флаги компилятора:
#   -std=c11    — стандарт C11
#   -Wall       — основные предупреждения
#   -Wextra     — дополнительные предупреждения
#   -Wpedantic  — строго по стандарту
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic

# Имя итогового исполняемого файла (тот же, что в compile.sh)
TARGET = cmdcalc

# Список объектных файлов, которые нужно собрать и потом слинковать.
# Такое же перечисление было в compile.sh
OBJS   = main.o calc.o decode.o


# Линковка: собираем cmdcalc из всех .o
# (нет флага -c — значит линковка, а не компиляция)
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)


# Компиляция main.c → main.o
# Зависит от main.c и заголовков, которые он подключает:
# изменится любой из них — main.o пересоберётся
main.o: main.c calc.h decode.h
	$(CC) $(CFLAGS) -c main.c -o main.o


# Компиляция calc.c → calc.o
calc.o: calc.c calc.h
	$(CC) $(CFLAGS) -c calc.c -o calc.o


# Компиляция decode.c → decode.o
decode.o: decode.c decode.h
	$(CC) $(CFLAGS) -c decode.c -o decode.o


# Фиктивная цель: удалить объектные файлы и исполняемый файл
clean:
	rm -f $(OBJS) $(TARGET)


# Фиктивная цель: запустить программу на примере из задания
# Зависит от $(TARGET) — если cmdcalc не собран, сначала соберётся
run: $(TARGET)
	./$(TARGET) 41 + 33 111 - 8 22 '*' 5 221 % 111 100 + 13 -k 2


# clean и run — не файлы, а действия.
# Без .PHONY make может сказать "run is up to date",
# если в каталоге случайно окажется файл с таким именем
.PHONY: clean run
