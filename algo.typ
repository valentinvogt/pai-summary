#let bphi=$bold(phi)$
#let btheta=$bold(theta)$
#let bx=$bold(x)$
#let ba=$bold(a)$
#line(length: 2000pt)
#v(-8pt)
*Algorithm*: Online actor-critic: on-policy, biased $^nabla$
#v(-8pt)
#line(length: 2000pt)
#v(-10pt)
initialize actor $bphi$ and critic $btheta$ \
#v(-10pt)

#raw("repeat", lang: "c++") \
#v(-10pt)

$wide$use $pi_bphi$ to obtain transition $(bx, ba, r, bx')$ \
$wide delta = r + gamma * Q(bx', pi_bphi (bx'); btheta) - Q(bx, ba; btheta)$ \
    $wide bphi <- bphi + eta gamma^t Q(bx, ba; btheta) gradient_bphi log pi_bphi(bx, ba)$ \
    $wide btheta <- btheta + eta delta gradient_btheta Q(bx, ba; btheta)$ \
    #v(-10pt)

`until` convergence

#line(length: 2000pt)
#v(-8pt)
*Algorithm*: $R_"max"$ \
#v(-8pt)
#line(length: 2000pt)
#v(-10pt)
add the fairy-tale state $x^*$ to the MDP \
for all $x in X, a in A$: set $hat(r)(x, a) = R_"max"$ and $hat(p)(x^*|x, a) = 1$ \
#v(-8pt)
compute the optimal policy $hat(pi)$ for $hat(r), hat(p)$ \
#v(-8pt)
```c for``` $t=0$ ```c to``` $infinity$ ```c do``` \
#v(-8pt)
$wide$ execute policy $hat(pi)$ for some steps \
#v(-8pt)
$wide$ for each visited $(x, a)$, update $hat(r)(x, a)$ \
#v(-8pt)
$wide$ estimate transition probabilities $hat(p)(x^'|x, a)$ \
#v(-8pt)
$wide$ after observing "enough" transitions and rewards, \
#v(-8pt)
$wide thick thick $ compute the optimal policy $hat(pi)$ for $hat(r), hat(p)$ \