! string.f90
!
! This example calls the Python function `konnichiwa()` in `example.py` from
! Fortran and prints the returned string to stdout.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: python3
    implicit none
    character(len=*), parameter   :: mod_name = 'example'       ! The Python module.
    character(len=*), parameter   :: fun_name = 'konnichiwa'    ! The Python function inside the module.
    character(len=:), allocatable :: str
    integer                       :: rc
    integer(kind=c_size_t)        :: str_len
    type(c_ptr)                   :: fun_ptr
    type(c_ptr)                   :: mod_ptr
    type(c_ptr)                   :: name_ptr
    type(c_ptr)                   :: obj_ptr
    type(c_ptr)                   :: str_ptr
    type(c_ptr)                   :: val_ptr

    ! Initialise Python.
    call py_set_program_name('python' // c_null_char)
    call py_initialize()

    ! Add local directory to Python's system path.
    rc = py_run_simple_string('import sys' // c_null_char)
    rc = py_run_simple_string('sys.path.append("./")' // c_null_char)

    ! Open the Python module.
    name_ptr   = py_unicode_from_string(mod_name // c_null_char)
    mod_ptr = py_import_import(name_ptr)

    call py_dec_ref(name_ptr)

    if (c_associated(mod_ptr)) then
        ! Get the Python function.
        fun_ptr = py_object_get_attr_string(mod_ptr, fun_name // c_null_char)

        if (c_associated(fun_ptr)) then
            if (py_callable_check(fun_ptr) > 0) then
                val_ptr = py_object_call_object(fun_ptr, c_null_ptr)    ! Call Python function.
                obj_ptr = py_unicode_as_utf8_string(val_ptr)            ! Convert object to string.
                str_ptr = py_bytes_as_string(obj_ptr)                   ! Get object buffer.
                str_len = py_bytes_size(obj_ptr)                        ! Get string length.

                ! Convert C char pointer to Fortran character.
                ! Then, print the Fortran string.
                allocate (character(len=str_len) :: str)
                call c_f_str_ptr(str_ptr, str)
                print '(a)', str

                call py_dec_ref(obj_ptr)
                call py_dec_ref(val_ptr)
            else
                call py_err_print()
            end if

            call py_dec_ref(fun_ptr)
        else
            call py_err_print()
        end if

        call py_dec_ref(mod_ptr)
    else
        call py_err_print()
    end if

    call py_finalize()
contains
    subroutine c_f_str_ptr(c_str, f_str)
        !! Utility routine that copies a C string, passed as a C pointer, to a
        !! Fortran string.
        use, intrinsic :: iso_c_binding, only: c_associated, c_char, c_f_pointer, c_null_char, c_ptr
        type(c_ptr),      intent(in)           :: c_str
        character(len=*), intent(out)          :: f_str
        character(kind=c_char, len=1), pointer :: char_ptrs(:)
        integer                                :: i

        if (.not. c_associated(c_str)) then
            f_str = ' '
            return
        end if

        call c_f_pointer(c_str, char_ptrs, [ huge(0) ])
        i = 1

        do while (char_ptrs(i) /= c_null_char .and. i <= len(f_str))
            f_str(i:i) = char_ptrs(i)
            i = i + 1
        end do

        if (i < len(f_str)) f_str(i:) = ' '
    end subroutine c_f_str_ptr
end program main
