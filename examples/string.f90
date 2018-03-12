! string.f90
!
! This example calls the Python function `konnichiwa()` in
! `examples/example.py` from Fortran and prints the returned string to stdout.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: python
    implicit none
    character(len=*), parameter      :: module_name = 'example'     ! The Python module.
    character(len=*), parameter      :: func_name   = 'konnichiwa'  ! The Python function inside the module.
    integer                          :: rc
    type(c_ptr)                      :: name_ptr
    type(c_ptr)                      :: module_ptr
    type(c_ptr)                      :: func_ptr
    type(c_ptr)                      :: value_ptr
    type(c_ptr)                      :: obj_ptr
    type(c_ptr)                      :: string_ptr
    integer(kind=c_size_t)           :: string_len
    character, pointer, dimension(:) :: string

    ! Initialise Python.
    call py_set_program_name('python' // c_null_char)
    call py_initialize()

    ! Add the `examples` directory to Python's system path.
    rc = py_run_simple_string('import sys' // c_null_char)
    rc = py_run_simple_string('sys.path.append("./examples")' // c_null_char)

    ! Open the Python module.
    name_ptr   = py_unicode_from_string(module_name // c_null_char)
    module_ptr = py_import_import(name_ptr)

    call py_dec_ref(name_ptr)

    if (c_associated(module_ptr)) then
        ! Get the Python function.
        func_ptr = py_object_get_attr_string(module_ptr, func_name // c_null_char)

        if (c_associated(func_ptr)) then
            if (py_callable_check(func_ptr) > 0) then
                value_ptr  = py_object_call_object(func_ptr, c_null_ptr)    ! Call function.
                obj_ptr    = py_unicode_as_utf8_string(value_ptr)           ! Convert object to string.
                string_ptr = py_bytes_as_string(obj_ptr)                    ! Get object buffer.
                string_len = py_bytes_size(obj_ptr)                         ! Get string length.

                call c_f_pointer(string_ptr, string, [ string_len ])        ! Create an array of string pointers.
                print *, string                                             ! Print the string.

                call py_dec_ref(obj_ptr)
                call py_dec_ref(value_ptr)
            else
                call py_err_print()
            end if

            call py_dec_ref(func_ptr)
        else
            call py_err_print()
        end if

        call py_dec_ref(module_ptr)
    else
        call py_err_print()
    end if

    call py_finalize()
end program main
