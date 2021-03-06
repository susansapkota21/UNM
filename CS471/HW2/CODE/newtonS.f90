!
! Newton's method - simple method to find roots
! Here we try to find the solution to the f(x) = 0
! This is the template file used for the scripted version  
!
program newton
  
  implicit none
  ! x0 is the previous guess
  ! x is current guess
  ! f is value of function f(x) at x
  ! fp is the value of function f'(x) at x
  ! m is multiplicity of root
  ! error is abs(x - x0)
  ! error0 is the previous error
  double precision :: f,fp,x,x0,m,dx,error,error0
  integer :: iter
 
  m = 1
  error = huge(error)
  iter = 0
  x = -0.5d0 ! initial guess
  do while (error > 1e-15)
     iter = iter + 1
     f = ffun(x)
     fp = fpfun(x)
     dx = -f/fp
     x0 = x
     x = x + m*dx

     
     if (x /= x) then
       ! just set x back to its previous value if x is NaN
       x = x0
     endif

     error0= error
     error = abs(x - x0)

     if (iter > 1) then
       write(*,'(A18,I2.2,5(E24.16))') ' sin(x)+cos(x*x) ', iter, x, dx, error, (error/error0), (error/error0**2)
     else
       write(*,'(A18,I2.2,3(E24.16))') ' sin(x)+cos(x*x) ', iter, x, dx, error
     endif
  enddo 

contains

  double precision function ffun(x)
    implicit none
    double precision :: x

    ffun = sin(x)+cos(x*x)

  end function ffun

  double precision function fpfun(x)
    implicit none
    double precision :: x

    fpfun = cos(x)-2.d0*x*sin(x*x)

  end function fpfun

end program newton
