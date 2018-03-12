! simple.f90
!
! Example that shows how to call the Python interpreter.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: python
    implicit none
    integer :: rc

    ! Initialise Python.
    call py_set_program_name('python' // c_null_char)
    call py_initialize()

    ! Call the Python interpreter.
    rc = py_run_simple_string('print("Hello, World!")' // c_null_char)

    call py_finalize()
end program main
