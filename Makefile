all: main

static: main_static
	mv main_static main

dynamic: main_dynamic
	mv main_dynamic main



main: main.o factorial.o power.o
	gcc main.o factorial.o power.o -o main
	./main

main_static: main.o libmymath.a
	gcc main.o -o main_static -L. -lmymath
	./main_static

main_dynamic: dmain.o libmymath.so
	gcc dmain.o -o main_dynamic -L. -lmymath
	export LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:./ && ./main_dynamic




libmymath.a: factorial.o power.o
	ar rsc libmymath.a factorial.o power.o

libmymath.so: factorial.o power.o
	gcc -shared factorial.o power.o -o libmymath.so 




main.o: src/main.c include/factorial.h include/power.h
	gcc -c src/main.c

dmain.o: src/main.c include/factorial.h include/power.h
	gcc -c src/main.c -o dmain.o

factorial.o: src/factorial.c include/factorial.h
	gcc -c src/factorial.c

power.o: src/power.c include/power.h
	gcc -c src/power.c



clean:
	rm -f *.o *.a *.so main
