! python.f90
module python
    implicit none

    interface
        ! int Py_FinalizeEx()
        function py_finalize_ex() bind(c, name='Py_FinalizeEx')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: py_finalize_ex
        end function py_finalize_ex

        ! int Py_IsInitialized()
        function py_is_initialized() bind(c, name='Py_IsInitialized')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: py_is_initialized
        end function py_is_initialized

        ! int PyRun_SimpleString(const char *command)
        function py_run_simple_string(command) bind(c, name='PyRun_SimpleString')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: command
            integer(kind=c_int)                :: py_run_simple_string
        end function py_run_simple_string

        ! void Py_Finalize()
        subroutine py_finalize() bind(c, name='Py_Finalize')
            use, intrinsic :: iso_c_binding
            implicit none
        end subroutine py_finalize

        ! void Py_Initialize()
        subroutine py_initialize() bind(c, name='Py_Initialize')
            use, intrinsic :: iso_c_binding
            implicit none
        end subroutine py_initialize

        ! void Py_InitializeEx(int initsigs)
        subroutine py_initialize_ex(init_sigs) bind(c, name='Py_InitializeEx')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int), value, intent(in) :: init_sigs
        end subroutine py_initialize_ex

        ! void Py_SetProgramName(wchar_t *name)
        subroutine py_set_program_name(name) bind(c, name='Py_SetProgramName')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: name
        end subroutine py_set_program_name
    end interface
end module python
