/**
* Implementacion del Metodo Iterativo para Aproximar
* la PseudoInversa de una Matriz, basado en el Metodo
* de la Secante para hallar el cero de una funcion no
* lineal, en C++.
*/

// bibliotecas necesarias //
#include <iostream>
#include <armadillo>

// abreviaciones para el codigo //
using namespace std;
using namespace arma;

// funcion principal que encuentra la pseudoinversa //
int main(int argc, char** argv)
{
	// declaracion: dimensiones de la matriz //
	int filas = 45;
	int columnas = 30;

	// declaracion: matriz A //
	mat A(filas, columnas);

	// asignacion: llenando la matriz A de ceros //
	A.fill(0);

	// iteracion: llenando la matriz con la formula: //
	// A(i, j) = i^2 + j^2							 //
	for (int i = 0; i < filas; i++)
	{
		for (int j = 0; j < columnas; j++)
		{
			A(i, j) = pow(i + 1, 2) + pow(j + 1, 2);
		}
	}

	// delcaracion: valores de alpha_1 y alpha_2 //
	double alpha_1 = 5 * pow(10, -10);
	double alpha_2 = 2 * pow(10, -11);

	// asignacion: valores iniciales //
	mat x0 = alpha_1 * A.t();
	mat x1 = alpha_2 * A.t();

	// declaracion: tolerancia //
	double tol = pow(10, -5);

	// declaracion: error //
	double err = tol + 1;

	// declaracion: matriz resultante //
	mat xk;

	// iteracion: mientras el error sea mayor que la //
	// tolerancia, se calcula la pesudinversa        //
	while (tol < err)
	{
		// calculo: formula de la pseudoinversa //
		xk = x0 + x1 - x0 * A * x1;

		// asignacion: nuevos valores de la iteracion //
		x0 = x1;
		x1 = xk;

		// calculo: error mediante la norma de frobenius //
		err = norm(A * xk * A - A, "fro");
	}

	cout << "A: " << A << endl;
	cout << "err: " << err << endl;
	cout << "xk: " << xk << endl;

	return 0;
}