import sympy as sym
import numpy as np
import matplotlib.pyplot as plt


# Función Jacobiano(x_str, f_list):

# Entradas:
#   x_list: es el vector que contiene las incognitas para cada ecuacion del sistema
#   f_list: es el vector que contiene las ecuaciones no lineales del sistema

# Salidas:
#   J: matriz jacobiana

def Jacobiano(x_str, f_list):
    vars = sym.symbols(x_str)
    f = sym.sympify(f_list)
    J = sym.zeros(len(f), len(vars))
    # Calculo de las derivadas parciales de cada funcion para el jacobiano
    for i, fi in enumerate(f):
        for j, s in enumerate(vars):
            J[i, j] = sym.diff(fi, s)
    return J


# Ejemplos de utilizacion
#Jacobiano('u1 u2', ['2*u1 + 3*u2','2*u1 - 3*u2'])
#Jacobiano('x y z', ['x^2+y^2+z^2-1','2*x^2+y^2-4*z','3*x^2-4*y+z^2'])


# Función newton_raphson(x0, f, x, tol, iterMax)

# Entradas:
#   x0: es el vector que contiene los valores iniciales
#   f: es el vector que contiene las ecuaciones no lineales del sistema
#   x: es el vector que contiene las incognitas para cada ecuacion del sistema
#   tol: es la tolerancia > 0, parametro de parada
#   iterMax: es el numero de iteraciones maximas, parametro de parada

# Salidas:
#   x: contiene la aproximacion de la solucion del sistema de ecuaciones
#   k: cantidad de iteraciones para encontrar el mejor x
#   ek: error generado
#   grafica: iteraciones vs error

def newton_raphson(x0, f, x, tol, iterMax):

    # sim es el vector con las variables; para operar a lo largo de la función
    # x0A es el vector con los valores del vector x0 inicial
    c = sym.symbols(x) 
    d = []
    sim = []
    x0A = []

    # for para pasar a simbolico las variables de las ecuaciones
    # se van agregando al vector sim
    for i in range(len(c)):
        d.append(str(c[i]))
        s = sym.Symbol(d[i])
        sim.append(s)

    # f es un vector con las funciones en simbolico
    # fun es una copia del vector fun
    # it es el vector para guardar las iteraciones
    # iteraciones es el contador de las iteraciones
    # err define el error
    # e es el vector para guardar los errores
    f = sym.sympify(f)
    fun = sym.sympify(f)
    it = []
    iteraciones = 0
    err = tol + 1
    e = []

    # Validar que cantidad de variables sea igual
    #  que cantidad de funciones
    if len(x0) != len(f):
        print("Ingrese las funciones y variables correctamente")

    # Ejecutar método de Newton-Raphson
    else:

        # Calculo del jacobiano
        J = Jacobiano(x, f)

        # while para iterar el método
        while (tol < err) and (iteraciones < iterMax):
            fun = sym.sympify(f)

            x0A = []
            # Pasar la matriz x0 a un vector x0A
            for i in range(len(c)):
                x0A.append(x0[i][0])

            # Calculo de las funciones evaluadas en el punto inicial x0A
            for k in range(len(sim)):
                for i in range(len(sim)):
                    f[k] = f[k].subs({sim[i]: x0A[i]})

            # Calculo de y

            # Se define el largo del vector de las incógnitas
            # Se definen 2 contadores para el while
            # Los vectores H1 y H1 son para formar la matriz jacobiana evaluada
            #  en cada punto del vector inicial x0A

            largo = len(sim)
            indice = 0
            indice2 = 0
            H1 = []
            H2 = []

            # H1, para formar cada una de las filas del jacobiano en vector
            # H2, para formar la matriz jacobiana
            # Se debe ingresar cada H1 en H2

            # While para formar la matriz Jacobiana como matriz y poderla
            #   manipular de forma más facil, ya que está como vector
            while indice2 < largo:
                for l in range(largo):
                    H1.append(J[l+indice])

                H2.append(H1)
                H1 = []

                indice = indice+largo
                indice2 = indice2 + 1

            # Evaluar la matriz jacobiana en el vector X0 y mantenerla en
            # matriz
            for k in range(len(sim)):
                for i in range(len(sim)):
                    H2[k][i] = H2[k][i].subs({sim[i]: x0A[i]})

            # Resolver el sistema de ecuaciones Ax=b
            # Se crea el vector w, para guardar la solución
            w = []

            #w = np.linalg.solve(H2, f)
            #w = np.linalg.solve(np.array(H2), np.array(f))
            w = np.linalg.solve(np.array(H2, dtype='float'), np.array(f, dtype='float'))

            # Ahora se debe meter la diagonal de la matriz w
            # Y tomarla como el nuevo w

            # Calculo de x
            # u es una matriz con la solución
            u = x0-w

            w1 = []
            w2 = []

            # Los valores de la matriz u que nos interesan son los de la
            #  diagonal, por lo cual se procede con ese for a ingresarlos
            #  un vector w2, pero dicho vector debe ser transpuesto, por lo
            #  cual la solución se obtiene en w1
            for k in range(len(sim)):
                w2 = u[k][k]
                w1.append(w2)

            # Actualizamos el valor del x para la siguiente iteracion
            x = w1

            # Calculo del error absoluto mediante la norma 2
            # norma es el vector tipo array de Numpy
            norma = np.array(f)
            err = np.linalg.norm(abs(norma), 1)

            
            # Actualizacion del vector de error
            e.append(err)

            # Cambio del nuevo valor inicial por el
            # valor recien calculado

            x0A = x
            for w in range(len(sim)):
                x0[w][0] = x0A[w]

            # Actualizacion del vector de iteraciones para plot
            it.append(iteraciones)

            iteraciones += 1
            H2 = []
            f = fun
            w = []

    print("Vector xk con la aproximacion de la solucion: ", x)
    print("Cantidad de iteraciones: ", iteraciones)
    print("Error ek: ", err)
    
    # Graficar Error vs cantidad de Iteraciones
    plt.title('Error vs Iteraciones')
    plt.ylabel('||F(xk)||1)')
    plt.xlabel('Iteraciones')
    plt.plot(it, e)
    plt.show()

# Ejemplo de utilizacion
#newton_raphson([[0.5],[0.5],[0.5]], ['x^2+y^2+z^2-1','2*x^2+y^2-4*z','3*x^2-4*y+z^2'], 'x y z', 0.00001, 50)
