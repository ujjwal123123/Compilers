default: lab2.l
	flex --outfile lab2.c lab2.l
	gcc -o lab2 lab2.c -lfl

run: default
	./lab2

clean:
	rm lab2
	rm lab2.c
