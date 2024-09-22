CLASS zsad_cl_tocheck DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsad_cl_tocheck IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'it works on my machine!!?' ).
  ENDMETHOD.
ENDCLASS.
