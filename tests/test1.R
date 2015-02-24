require("quadprogpp")

# Given:
#   G =  2.1 0.0 1.0   g0^T = [6.0 1.0 1.0]
#        1.5 2.2 0.0      
#        1.2 1.3 3.1 
# Solve:
#   min f(x) = 1/2 x G x + g0 x
# s.t.
# x_1 + 2*x_2 - x_3 = -4
# 
# x_1 >= 0
# x_2 >= 0
# x_3 >= 0  
# -x_1 - x_2 >= -10
# 
# The solution is x^T = [0 2 0] and f(x) = 6.4

G = matrix(c(2.1, 1.5, 1.2,
             0.0, 2.2, 1.3,
             1.0, 0.0, 3.1), 3, 3)

g0 = c(6.0, 1.0, 1.0)  

CE = matrix(c(1, 2, -1), 3, 1)

ce0 = c(-4);

CI = matrix(c( 1,  0,  0, 
               0,  1,  0, 
               0,  0,  1,
              -1, -1,  0), 3, 4)

ci0 = c(0, 0, 0, 10)

x = QP.Solve(G, g0, CI, ci0, CE, ce0)
print(x)

stopifnot(all(round(x, 6) == c(0,2,0)))

