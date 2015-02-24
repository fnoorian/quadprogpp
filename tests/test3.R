require("quadprogpp")

B_max = 1600
U_max = 90

B_min = 0.2 * B_max
B0 = B_max

N = 100
LS = 200 * sin((1:N)*pi/N)

N = length(LS)
S = matrix(1, N, N)
S[upper.tri(S)] = 0

I = diag(N)
I1 = matrix(1, 1, N)

Amat = cbind(-t(S), t(S), I, -I)
bvec = c((B_min - B0) * I1, (-B_max + B0) * I1, -U_max * I1, -U_max * I1)

CE = matrix(0, N, 0)
ce0 = vector()

U = QP.Solve(I, -LS, Amat, -bvec)

V = LS
V[V > 155.3759105] = 155.3759105 # the cap

# accurate to 1e-6
stopifnot(all(abs((LS - U) - V) < 1e-6))

