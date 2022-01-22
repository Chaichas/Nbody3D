all: nbody.g nbody0.c nbody.i nbody0.i

nbody.g: nbody.c
	#gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp
	gcc -o -o3 -mavx2 -Ofast -ffast-math -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp
	
nbody0.g: nbody0.c
	#gcc -march=native -mavx2 -Ofast -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp
	gcc -o -o3 -mavx2 -Ofast -ffast-math -fopt-info-all=nbody.gcc.optrpt $< -o $@ -lm -fopenmp

nbody.i: nbody.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp -msse4.2 -axAVX,CORE-AVX2
	
nbody0.i: nbody0.c
	icc -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

clean:
	rm -Rf *~ nbody.g nbody0.g nbody.i nbody0.i *.optrpt


#-funroll-loops
