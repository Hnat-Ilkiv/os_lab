all: main

static: main_static
	mv main_static main



main: main.o factorial.o power.o
	gcc main.o factorial.o power.o -o main

main_static: main.o libmymath.a
	gcc main.o -o main_static -L. -lmymath



libmymath.a: factorial.o power.o
	ar rsc libmymath.a factorial.o power.o



main.o: src/main.c include/factorial.h include/power.h
	gcc -c src/main.c

factorial.o: src/factorial.c include/factorial.h
	gcc -c src/factorial.c

power.o: src/power.c include/power.h
	gcc -c src/power.c



clean:
	rm -f *.o *.a main
