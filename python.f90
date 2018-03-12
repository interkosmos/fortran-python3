! python.f90
!
! Interface to Python 3 for Fortran 2003/2008.
!
! Author:  Philipp Engel
! Licence: ISC
module python
    implicit none

    interface
        ! char *PyBytes_AsString(PyObject *o)
        function py_bytes_as_string(o) bind(c, name='PyBytes_AsString')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
            type(c_ptr)                    :: py_bytes_as_string
        end function py_bytes_as_string

        ! int PyBytes_AsStringAndSize(PyObject *obj, char **buffer, Py_ssize_t *length)
        function py_bytes_as_string_and_size(obj, buffer, length) bind(c, name='PyBytes_AsStringAndSize')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),            intent(in), value :: obj
            character(kind=c_char), intent(out)       :: buffer
            integer(kind=c_size_t), intent(out)       :: length
            integer(kind=c_int)                       :: py_bytes_as_string_and_size
        end function py_bytes_as_string_and_size

        ! Py_ssize_t PyBytes_Size(PyObject *o)
        function py_bytes_size(o) bind(c, name='PyBytes_Size')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
            integer(kind=c_size_t)         :: py_bytes_size
        end function py_bytes_size

        ! int PyCallable_Check(PyObject *o)
        function py_callable_check(o) bind(c, name='PyCallable_Check')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
            integer(kind=c_int)            :: py_callable_check
        end function py_callable_check

        ! double PyFloat_AsDouble(PyObject *pyfloat)
        function py_float_as_double(pyfloat) bind(c, name='PyFloat_AsDouble')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: pyfloat
            real(kind=c_double)            :: py_float_as_double
        end function py_float_as_double

        ! int Py_FinalizeEx()
        function py_finalize_ex() bind(c, name='Py_FinalizeEx')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: py_finalize_ex
        end function py_finalize_ex

        ! PyObject *PyImport_Import(PyObject *name)
        function py_import_import(name) bind(c, name='PyImport_Import')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: name
            type(c_ptr)                    :: py_import_import
        end function py_import_import

        ! PyObject *PyImport_ImportModule(const char *name)
        function py_import_import_module(name) bind(c, name='PyImport_ImportModule')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: name
            type(c_ptr)                        :: py_import_import_module
        end function py_import_import_module

        ! int Py_IsInitialized()
        function py_is_initialized() bind(c, name='Py_IsInitialized')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: py_is_initialized
        end function py_is_initialized

        ! long PyLong_AsLong(PyObject *obj)
        function py_long_as_long(obj) bind(c, name='PyLong_AsLong')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: obj
            integer(kind=c_long)           :: py_long_as_long
        end function py_long_as_long

        ! PyObject *PyObject_CallObject(PyObject *callable_object, PyObject *args)
        function py_object_call_object(callable_object, args) bind(c, name='PyObject_CallObject')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: callable_object
            type(c_ptr), intent(in), value :: args
            type(c_ptr)                    :: py_object_call_object
        end function py_object_call_object

        ! PyObject *PyObject_GetAttrString(PyObject *o, const char *attr_name)
        function py_object_get_attr_string(o, attr_name) bind(c, name='PyObject_GetAttrString')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),            intent(in), value :: o
            character(kind=c_char), intent(in)        :: attr_name
            type(c_ptr)                               :: py_object_get_attr_string
        end function py_object_get_attr_string

        ! PyObject *PyObject_Repr(PyObject *o)
        function py_object_repr(o) bind(c, name='PyObject_Repr')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
            type(c_ptr)                    :: py_object_repr
        end function py_object_repr

        ! PyObject *PyObject_Str(PyObject *o)
        function py_object_str(o) bind(c, name='PyObject_Str')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
            type(c_ptr)                    :: py_object_str
        end function py_object_str

        ! int PyRun_SimpleString(const char *command)
        function py_run_simple_string(command) bind(c, name='PyRun_SimpleString')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: command
            integer(kind=c_int)                :: py_run_simple_string
        end function py_run_simple_string

        ! PyObject *PyUnicode_AsEncodedString(PyObject *unicode, const char *encoding, const char *errors)
        function py_unicode_as_encoded_string(unicode, encoding, errors) bind(c, name='PyUnicode_AsEncodedString')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),            intent(in), value :: unicode
            character(kind=c_char), intent(in)        :: encoding
            character(kind=c_char), intent(in)        :: errors
            type(c_ptr)                               :: py_unicode_as_encoded_string
        end function py_unicode_as_encoded_string

        ! PyObject *PyUnicode_AsUTF8String(PyObject *unicode)
        function py_unicode_as_utf8_string(unicode) bind(c, name='PyUnicode_AsUTF8String')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: unicode
            type(c_ptr)                    :: py_unicode_as_utf8_string
        end function py_unicode_as_utf8_string

        ! PyObject *PyUnicode_DecodeFSDefault(char *s)
        function py_unicode_decode_fs_default(s) bind(c, name='PyUnicode_DecodeFSDefault')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: s
            type(c_ptr)                        :: py_unicode_decode_fs_default
        end function py_unicode_decode_fs_default

        ! PyObject *PyUnicode_FromString(char *u)
        function py_unicode_from_string(u) bind(c, name='PyUnicode_FromString')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: u
            type(c_ptr)                        :: py_unicode_from_string
        end function py_unicode_from_string

        ! void Py_CLEAR(PyObject *o)
        subroutine py_clear(o) bind(c, name='Py_CLEAR')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_clear

        ! void Py_DECREF(PyObject *o)
        subroutine py_decref(o) bind(c, name='Py_DECREF')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_decref

        ! void Py_DecRef(PyObject *o)
        subroutine py_dec_ref(o) bind(c, name='Py_DecRef')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_dec_ref

        ! void PyErr_Print()
        subroutine py_err_print() bind(c, name='PyErr_Print')
        end subroutine py_err_print

        ! void Py_Finalize()
        subroutine py_finalize() bind(c, name='Py_Finalize')
        end subroutine py_finalize

        ! void Py_INCREF(PyObject *o)
        subroutine py_incref(o) bind(c, name='Py_INCREF')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_incref

        ! void Py_IncRef(PyObject *o)
        subroutine py_inc_ref(o) bind(c, name='Py_IncRef')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_inc_ref

        ! void Py_Initialize()
        subroutine py_initialize() bind(c, name='Py_Initialize')
        end subroutine py_initialize

        ! void Py_InitializeEx(int initsigs)
        subroutine py_initialize_ex(init_sigs) bind(c, name='Py_InitializeEx')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int), intent(in), value :: init_sigs
        end subroutine py_initialize_ex

        ! void PyMem_RawFree(void *p)
        subroutine py_mem_raw_free(p) bind(c, name='PyMem_RawFree')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in) :: p
        end subroutine py_mem_raw_free

        ! void Py_SetProgramName(wchar_t *name)
        subroutine py_set_program_name(name) bind(c, name='Py_SetProgramName')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: name
        end subroutine py_set_program_name

        ! void PySys_SetPath(char *path)
        subroutine py_sys_set_path(path) bind(c, name='PySys_SetPath')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: path
        end subroutine py_sys_set_path

        ! void Py_XDECREF(PyObject *o)
        subroutine py_xdecref(o) bind(c, name='Py_XDECREF')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_xdecref

        ! void Py_XINCREF(PyObject *o)
        subroutine py_xincref(o) bind(c, name='Py_XINCREF')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: o
        end subroutine py_xincref
    end interface
end module python
