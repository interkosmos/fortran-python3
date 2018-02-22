program main
    use :: python
    implicit none
    integer :: rc

    call py_initialize()
    rc = py_run_simple_string('print("Hello, World!")')
    call py_finalize()
end program main
