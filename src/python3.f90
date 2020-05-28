! python3.f90
!
! A collection of ISO C binding Interface to Python 3 for Fortran 2003.
!
! Author:  Philipp Engel
! Licence: ISC
module python3
    use, intrinsic :: iso_c_binding
    implicit none
    private

    public :: py_bytes_as_string
    public :: py_bytes_as_string_and_size
    public :: py_bytes_size
    public :: py_callable_check
    public :: py_float_as_double
    public :: py_finalize_ex
    public :: py_import_import
    public :: py_import_import_module
    public :: py_is_initialized
    public :: py_long_as_long
    public :: py_object_call_object
    public :: py_object_get_attr_string
    public :: py_object_repr
    public :: py_object_str
    public :: py_run_simple_string
    public :: py_unicode_as_encoded_string
    public :: py_unicode_as_utf8_string
    public :: py_unicode_decode_fs_default
    public :: py_unicode_from_string
    public :: py_clear
    public :: py_decref
    public :: py_dec_ref
    public :: py_err_print
    public :: py_finalize
    public :: py_incref
    public :: py_inc_ref
    public :: py_initialize
    public :: py_initialize_ex
    public :: py_mem_raw_free
    public :: py_set_program_name
    public :: py_sys_set_path
    public :: py_xdecref
    public :: py_xincref

    interface
        ! char *PyBytes_AsString(PyObject *o)
        type(c_ptr) function py_bytes_as_string(o) bind(c, name='PyBytes_AsString')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end function py_bytes_as_string

        ! int PyBytes_AsStringAndSize(PyObject *obj, char **buffer, Py_ssize_t *length)
        integer(kind=c_int) function py_bytes_as_string_and_size(obj, buffer, length) bind(c, name='PyBytes_AsStringAndSize')
            import :: c_char, c_int, c_ptr, c_size_t
            type(c_ptr),            intent(in), value :: obj
            character(kind=c_char), intent(out)       :: buffer
            integer(kind=c_size_t), intent(out)       :: length
        end function py_bytes_as_string_and_size

        ! Py_ssize_t PyBytes_Size(PyObject *o)
        integer(kind=c_size_t) function py_bytes_size(o) bind(c, name='PyBytes_Size')
            import :: c_ptr, c_size_t
            type(c_ptr), intent(in), value :: o
        end function py_bytes_size

        ! int PyCallable_Check(PyObject *o)
        integer(kind=c_int) function py_callable_check(o) bind(c, name='PyCallable_Check')
            import :: c_int, c_ptr
            type(c_ptr), intent(in), value :: o
        end function py_callable_check

        ! double PyFloat_AsDouble(PyObject *pyfloat)
        real(kind=c_double) function py_float_as_double(pyfloat) bind(c, name='PyFloat_AsDouble')
            import :: c_double, c_ptr
            type(c_ptr), intent(in), value :: pyfloat
        end function py_float_as_double

        ! int Py_FinalizeEx()
        integer(kind=c_int) function py_finalize_ex() bind(c, name='Py_FinalizeEx')
            import :: c_int
        end function py_finalize_ex

        ! PyObject *PyImport_Import(PyObject *name)
        type(c_ptr) function py_import_import(name) bind(c, name='PyImport_Import')
            import :: c_ptr
            type(c_ptr), intent(in), value :: name
        end function py_import_import

        ! PyObject *PyImport_ImportModule(const char *name)
        type(c_ptr) function py_import_import_module(name) bind(c, name='PyImport_ImportModule')
            import :: c_char, c_ptr
            character(kind=c_char), intent(in) :: name
        end function py_import_import_module

        ! int Py_IsInitialized()
        integer(kind=c_int) function py_is_initialized() bind(c, name='Py_IsInitialized')
            import :: c_int
        end function py_is_initialized

        ! long PyLong_AsLong(PyObject *obj)
        integer(kind=c_long) function py_long_as_long(obj) bind(c, name='PyLong_AsLong')
            import :: c_long, c_ptr
            type(c_ptr), intent(in), value :: obj
        end function py_long_as_long

        ! PyObject *PyObject_CallObject(PyObject *callable_object, PyObject *args)
        type(c_ptr) function py_object_call_object(callable_object, args) bind(c, name='PyObject_CallObject')
            import :: c_ptr
            type(c_ptr), intent(in), value :: callable_object
            type(c_ptr), intent(in), value :: args
        end function py_object_call_object

        ! PyObject *PyObject_GetAttrString(PyObject *o, const char *attr_name)
        type(c_ptr) function py_object_get_attr_string(o, attr_name) bind(c, name='PyObject_GetAttrString')
            import :: c_char, c_ptr
            type(c_ptr),            intent(in), value :: o
            character(kind=c_char), intent(in)        :: attr_name
        end function py_object_get_attr_string

        ! PyObject *PyObject_Repr(PyObject *o)
        type(c_ptr) function py_object_repr(o) bind(c, name='PyObject_Repr')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end function py_object_repr

        ! PyObject *PyObject_Str(PyObject *o)
        type(c_ptr) function py_object_str(o) bind(c, name='PyObject_Str')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end function py_object_str

        ! int PyRun_SimpleString(const char *command)
        integer(kind=c_int) function py_run_simple_string(command) bind(c, name='PyRun_SimpleString')
            import :: c_char, c_int
            character(kind=c_char), intent(in) :: command
        end function py_run_simple_string

        ! PyObject *PyUnicode_AsEncodedString(PyObject *unicode, const char *encoding, const char *errors)
        type(c_ptr) function py_unicode_as_encoded_string(unicode, encoding, errors) bind(c, name='PyUnicode_AsEncodedString')
            import :: c_char, c_ptr
            type(c_ptr),            intent(in), value :: unicode
            character(kind=c_char), intent(in)        :: encoding
            character(kind=c_char), intent(in)        :: errors
        end function py_unicode_as_encoded_string

        ! PyObject *PyUnicode_AsUTF8String(PyObject *unicode)
        type(c_ptr) function py_unicode_as_utf8_string(unicode) bind(c, name='PyUnicode_AsUTF8String')
            import :: c_ptr
            type(c_ptr), intent(in), value :: unicode
        end function py_unicode_as_utf8_string

        ! PyObject *PyUnicode_DecodeFSDefault(char *s)
        type(c_ptr) function py_unicode_decode_fs_default(s) bind(c, name='PyUnicode_DecodeFSDefault')
            import :: c_char, c_ptr
            character(kind=c_char), intent(in) :: s
        end function py_unicode_decode_fs_default

        ! PyObject *PyUnicode_FromString(char *u)
        type(c_ptr) function py_unicode_from_string(u) bind(c, name='PyUnicode_FromString')
            import :: c_char, c_ptr
            character(kind=c_char), intent(in) :: u
        end function py_unicode_from_string

        ! void Py_CLEAR(PyObject *o)
        subroutine py_clear(o) bind(c, name='Py_CLEAR')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_clear

        ! void Py_DECREF(PyObject *o)
        subroutine py_decref(o) bind(c, name='Py_DECREF')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_decref

        ! void Py_DecRef(PyObject *o)
        subroutine py_dec_ref(o) bind(c, name='Py_DecRef')
            import :: c_ptr
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
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_incref

        ! void Py_IncRef(PyObject *o)
        subroutine py_inc_ref(o) bind(c, name='Py_IncRef')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_inc_ref

        ! void Py_Initialize()
        subroutine py_initialize() bind(c, name='Py_Initialize')
        end subroutine py_initialize

        ! void Py_InitializeEx(int initsigs)
        subroutine py_initialize_ex(init_sigs) bind(c, name='Py_InitializeEx')
            import :: c_int
            integer(kind=c_int), intent(in), value :: init_sigs
        end subroutine py_initialize_ex

        ! void PyMem_RawFree(void *p)
        subroutine py_mem_raw_free(p) bind(c, name='PyMem_RawFree')
            import :: c_ptr
            type(c_ptr), intent(in) :: p
        end subroutine py_mem_raw_free

        ! void Py_SetProgramName(wchar_t *name)
        subroutine py_set_program_name(name) bind(c, name='Py_SetProgramName')
            import :: c_char
            character(kind=c_char), intent(in) :: name
        end subroutine py_set_program_name

        ! void PySys_SetPath(char *path)
        subroutine py_sys_set_path(path) bind(c, name='PySys_SetPath')
            import :: c_char
            character(kind=c_char), intent(in) :: path
        end subroutine py_sys_set_path

        ! void Py_XDECREF(PyObject *o)
        subroutine py_xdecref(o) bind(c, name='Py_XDECREF')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_xdecref

        ! void Py_XINCREF(PyObject *o)
        subroutine py_xincref(o) bind(c, name='Py_XINCREF')
            import :: c_ptr
            type(c_ptr), intent(in), value :: o
        end subroutine py_xincref
    end interface
end module python3
